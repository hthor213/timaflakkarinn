#!/usr/bin/env python3
"""Tests for calibrate_server.py against a throwaway repo.

Run: python3 tools/test_calibrate_server.py

The publish path is the part that must never surprise: it commits and pushes,
so it runs here against a temp repo with a bare origin and a stub deploy.sh —
the real one builds for minutes and touches the serving root.
"""
import http.client
import importlib
import json
import os
import subprocess
import sys
import tempfile
import threading
import unittest
from http.server import ThreadingHTTPServer
from pathlib import Path

ELEMENT = ('<SimplePseudo3DTerrain name="t_X" scene="s_X" polygon="p_X"\r\n'
           '\tzmin="-7" zmax="0" defaultscaling="1.0" scanline1="600"/>')
DOC = ('<?xml version="1.0" encoding="ISO-8859-1"?>\r\n' + ELEMENT + '\r\n')

TOKEN = 'test-token-not-secret'


def _run(cwd, *argv):
    subprocess.run(argv, cwd=cwd, check=True, capture_output=True)


def make_repo() -> Path:
    root = Path(tempfile.mkdtemp())
    repo = root / 'repo'
    (repo / 'web_import' / 'gml').mkdir(parents=True)
    (repo / 'webapp' / 'public' / 'gml').mkdir(parents=True)
    (repo / 'tools').mkdir()
    (repo / 'web_import' / 'gml' / 'x.gml').write_bytes(DOC.encode('iso-8859-1'))
    stub = repo / 'tools' / 'deploy.sh'
    stub.write_text('#!/bin/bash\necho deploy-stub "$@"\n')
    stub.chmod(0o755)
    _run(root, 'git', 'init', '-q', '-b', 'dev', 'repo')
    _run(repo, 'git', 'config', 'user.email', 't@t')
    _run(repo, 'git', 'config', 'user.name', 't')
    _run(repo, 'git', 'add', '-A')
    _run(repo, 'git', 'commit', '-qm', 'seed')
    _run(root, 'git', 'init', '-q', '--bare', 'origin.git')
    _run(repo, 'git', 'remote', 'add', 'origin', str(root / 'origin.git'))
    _run(repo, 'git', 'push', '-q', 'origin', 'dev')
    return repo


REPO = make_repo()
os.environ['CALIB_REPO'] = str(REPO)
os.environ['CALIB_TOKEN'] = TOKEN
sys.path.insert(0, str(Path(__file__).resolve().parent))
srv = importlib.import_module('calibrate_server')


def sidecar(**over):
    body = {'scene': 's_X', 'terrain': 't_X', 'mode': 'classic',
            'values': {'d': 1.368, 'a': 570, 'b': 360, 's': 0.831},
            'pins': [{'x': 100, 'y': 546, 'k': 1.216}],
            'him': None, 'savedAt': '2026-08-14T00:00:00Z'}
    body.update(over)
    return body


class Validate(unittest.TestCase):
    def test_accepts_the_real_shape(self):
        out = srv.validate_sidecar(sidecar())
        self.assertEqual(out['values']['a'], 570.0)
        self.assertEqual(out['pins'][0]['k'], 1.216)

    def test_rejects_traversal_names(self):
        for bad in ('../x', 'a/b', 'a b', '', 'x' * 65):
            with self.assertRaises(ValueError):
                srv.validate_sidecar(sidecar(terrain=bad))
            with self.assertRaises(ValueError):
                srv.sidecar_path(bad)

    def test_rejects_unknown_mode_and_bad_pins(self):
        with self.assertRaises(ValueError):
            srv.validate_sidecar(sidecar(mode='remaster'))
        with self.assertRaises((ValueError, TypeError, KeyError)):
            srv.validate_sidecar(sidecar(pins=[{'x': 'NaN-ish'}]))


class Publish(unittest.TestCase):
    def test_publish_patches_commits_pushes_and_deploys(self):
        result = srv.do_publish(sidecar())
        self.assertTrue(result['changed'])
        self.assertIn('scanline1="570"', result['element_after'])
        self.assertTrue(result['deploy_ok'])
        self.assertIn('deploy-stub --env dev', result['deploy_tail'])
        # the commit reached origin
        head = subprocess.run(
            ['git', '-C', str(REPO), 'ls-remote', 'origin', 'refs/heads/dev'],
            capture_output=True, text=True).stdout.split()[0]
        local = subprocess.run(
            ['git', '-C', str(REPO), 'rev-parse', 'HEAD'],
            capture_output=True, text=True).stdout.strip()
        self.assertEqual(head, local)
        # master bytes stayed latin-1 + CRLF, pins comment landed
        raw = (REPO / 'web_import' / 'gml' / 'x.gml').read_bytes()
        self.assertEqual(raw.count(b'\n'), raw.count(b'\r\n'))
        self.assertIn(b'calibration pins (x,y,scale): 100,546,1.216', raw)
        # sidecar recorded the publish
        side = json.loads((REPO / 'web_import' / 'calib' / 't_X.json').read_text())
        self.assertTrue(side['publishedAt'])

    def test_publish_refuses_unrelated_dirt(self):
        stray = REPO / 'engine.ts'
        stray.write_text('wip')
        try:
            with self.assertRaises(RuntimeError) as ctx:
                srv.do_publish(sidecar())
            self.assertIn('engine.ts', str(ctx.exception))
        finally:
            stray.unlink()

    def test_publish_refuses_unknown_terrain(self):
        with self.assertRaises(LookupError):
            srv.do_publish(sidecar(terrain='t_Nope'))


class Http(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.server = ThreadingHTTPServer(('127.0.0.1', 0), srv.Handler)
        cls.port = cls.server.server_address[1]
        threading.Thread(target=cls.server.serve_forever, daemon=True).start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()

    def req(self, method, path, body=None, token=TOKEN):
        c = http.client.HTTPConnection('127.0.0.1', self.port, timeout=10)
        headers = {'Content-Type': 'application/json'}
        if token is not None:
            headers['Authorization'] = 'Bearer ' + token
        c.request(method, path, json.dumps(body) if body else None, headers)
        r = c.getresponse()
        data = json.loads(r.read() or b'{}')
        c.close()
        return r.status, data

    def test_health_is_open(self):
        self.assertEqual(self.req('GET', '/health', token=None)[0], 200)

    def test_everything_else_is_not(self):
        for method, path in (('GET', '/calib'), ('GET', '/calib/t_X'),
                             ('PUT', '/calib/t_X'), ('POST', '/publish')):
            self.assertEqual(self.req(method, path, token=None)[0], 401)
            self.assertEqual(self.req(method, path, token='wrong')[0], 401)

    def test_save_load_roundtrip(self):
        status, _ = self.req('PUT', '/calib/t_X', sidecar())
        self.assertEqual(status, 200)
        status, data = self.req('GET', '/calib/t_X')
        self.assertEqual(status, 200)
        self.assertEqual(data['values']['a'], 570.0)
        status, data = self.req('GET', '/calib')
        self.assertEqual(data['terrains']['t_X']['pins'], 1)

    def test_body_and_path_must_agree(self):
        status, data = self.req('PUT', '/calib/t_Other', sidecar())
        self.assertEqual(status, 400)

    def test_never_saved_is_404(self):
        self.assertEqual(self.req('GET', '/calib/t_Virgin')[0], 404)


if __name__ == '__main__':
    unittest.main()
