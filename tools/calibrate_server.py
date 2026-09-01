#!/usr/bin/env python3
"""Save/Publish backend for the calibration tool (specs/000, REVISED 2026-08-14).

The tool at tt-dev.spliffdonk.com/calibrate is a static page; this is the
write path behind it. Caddy proxies /calibrate/api/* here (tt-dev only), and
everything below runs against the WORKING repo — the sidecars and masters it
writes are ordinary uncommitted changes until Publish commits them.

Routes (paths as this server sees them, after Caddy strips /calibrate/api):
  GET  /health            liveness, unauthenticated
  GET  /calib             index of saved sidecars {terrain: {scene, pins, ...}}
  GET  /calib/<terrain>   one sidecar, 404 when never saved
  PUT  /calib/<terrain>   write sidecar — a work-in-progress judgement set
  POST /publish           patch the .gml master, commit, push, deploy to tt-dev

Save is cheap and frequent: ten minutes today, ten tomorrow, the sidecar is
the resume point. Publish is the expensive full statement: it refuses on a
dirty tree (deploy.sh's own rule — what ships must be what you see), commits
the sidecars and the patched master together, pushes to Forgejo and runs
tools/deploy.sh --env dev, which is minutes of build and verify.

Auth: `Authorization: Bearer $CALIB_TOKEN` on everything but /health. The
token gates a write path into the working repo, so like the launchpad's
JWT secret it has no default: an unset token is a startup error. Stdlib
only, like every tool in this directory.
"""

import datetime
import hmac
import json
import os
import re
import subprocess
import sys
import threading
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent / 'pipeline'))
import calibration  # noqa: E402

REPO = Path(os.environ.get('CALIB_REPO',
                           str(Path.home() / 'work' / 'timaflakkarinn')))
CALIB_DIR = REPO / 'web_import' / 'calib'
GML_DIR = REPO / 'web_import' / 'gml'
DEPLOY = REPO / 'tools' / 'deploy.sh'
PORT = int(os.environ.get('CALIB_PORT', '8031'))
BRANCH = os.environ.get('CALIB_BRANCH', 'dev')

# The paths a publish is allowed to commit. Anything else dirty in the tree
# is someone's work-in-progress, and shipping it as a side effect of a
# calibration would be the worst kind of surprise. webapp/public/gml is NOT
# here although the site serves from it: it is a symlink into web_import/gml
# (git add refuses pathspecs through it), so patching the master already
# updates what both paths see.
OURS = ('web_import/calib/', 'web_import/gml/')

NAME_RE = re.compile(r'^[A-Za-z0-9_-]{1,64}$')
MAX_BODY = 256 * 1024

_publish_lock = threading.Lock()


def _token() -> str:
    t = os.environ.get('CALIB_TOKEN', '')
    if not t:
        raise RuntimeError(
            'CALIB_TOKEN is unset. This service writes into the working repo; '
            'it will not start without a token. Generate one into .calib.env.')
    return t


TOKEN = _token()


def _git(*args, check=True):
    return subprocess.run(['git', '-C', str(REPO), *args],
                          capture_output=True, text=True, check=check)


def sidecar_path(terrain: str) -> Path:
    if not NAME_RE.match(terrain):
        raise ValueError(f'bad terrain name: {terrain!r}')
    return CALIB_DIR / f'{terrain}.json'


def validate_sidecar(body: dict) -> dict:
    """Bound what a sidecar may contain — it is written to disk verbatim."""
    if not isinstance(body, dict):
        raise ValueError('sidecar must be an object')
    out = {'version': 1}
    for key in ('scene', 'terrain'):
        v = body.get(key, '')
        if not isinstance(v, str) or not NAME_RE.match(v):
            raise ValueError(f'bad {key}')
        out[key] = v
    mode = body.get('mode', 'classic')
    if mode not in ('classic', 'modern'):
        raise ValueError('mode must be classic or modern')
    out['mode'] = mode
    vals = body.get('values', {})
    out['values'] = {k: float(vals[k]) for k in ('d', 'a', 'b', 's')}
    pins = body.get('pins', [])
    if not isinstance(pins, list) or len(pins) > 200:
        raise ValueError('pins must be a list (max 200)')
    out['pins'] = [{'x': float(p['x']), 'y': float(p['y']), 'k': float(p['k'])}
                   for p in pins]
    him = body.get('him')
    if him is not None:
        him = {'x': float(him['x']), 'y': float(him['y']),
               'k': None if him.get('k') is None else float(him['k'])}
    out['him'] = him
    if body.get('vpx') is not None:
        out['vpx'] = float(body['vpx'])
    for key in ('savedAt', 'publishedAt'):
        if isinstance(body.get(key), str):
            out[key] = body[key][:64]
    return out


def write_sidecar(terrain: str, data: dict) -> None:
    CALIB_DIR.mkdir(parents=True, exist_ok=True)
    path = sidecar_path(terrain)
    tmp = path.with_suffix('.json.tmp')
    tmp.write_text(json.dumps(data, indent=2, sort_keys=True) + '\n')
    os.replace(tmp, path)


def calib_index() -> dict:
    out = {}
    if CALIB_DIR.is_dir():
        for p in sorted(CALIB_DIR.glob('*.json')):
            try:
                d = json.loads(p.read_text())
                out[p.stem] = {'scene': d.get('scene'), 'mode': d.get('mode'),
                               'pins': len(d.get('pins', [])),
                               'savedAt': d.get('savedAt'),
                               'publishedAt': d.get('publishedAt')}
            except (json.JSONDecodeError, OSError):
                out[p.stem] = {'error': 'unreadable'}
    return out


def find_master(terrain: str) -> Path:
    """The one .gml master declaring this terrain, or a loud error."""
    hits = []
    for p in sorted(GML_DIR.glob('*.gml')):
        text = p.read_bytes().decode('iso-8859-1')
        if calibration._element_re(terrain).search(text):
            hits.append(p)
    if not hits:
        raise LookupError(f'no master declares {terrain!r}')
    if len(hits) > 1:
        raise ValueError(f'{terrain!r} declared in {[p.name for p in hits]}')
    return hits[0]


def do_publish(body: dict) -> dict:
    """Patch, commit, push, deploy. The caller holds _publish_lock."""
    side = validate_sidecar(body)
    terrain = side['terrain']

    branch = _git('rev-parse', '--abbrev-ref', 'HEAD').stdout.strip()
    if branch != BRANCH:
        raise RuntimeError(f'working repo is on {branch!r}, publish needs {BRANCH!r}')

    # Refuse when the tree is dirty with anything that is not ours. deploy.sh
    # would refuse anyway; refusing here names the blocker before the master
    # is touched, so a failed publish never leaves half a story behind.
    dirt = [line for line in _git('status', '--porcelain').stdout.splitlines()
            if line[3:] and not line[3:].startswith(OURS)]
    if dirt:
        raise RuntimeError('working tree has unrelated changes; commit or '
                           'stash them first:\n' + '\n'.join(dirt))

    master = find_master(terrain)
    v = side['values']
    values = {'defaultscaling': v['d'], 'scanline1': v['a'],
              'scanline2': v['b'], 'scaling2': v['s']}
    pins = [(p['x'], p['y'], p['k']) for p in side['pins']]
    before, after = calibration.patch_file(str(master), terrain, values,
                                           pins=pins)
    side['publishedAt'] = datetime.datetime.now(datetime.timezone.utc) \
        .isoformat(timespec='seconds')
    write_sidecar(terrain, side)

    changed = after is not None
    _git('add', '--', *OURS)
    staged = _git('diff', '--cached', '--name-only').stdout.strip()
    commit = None
    if staged:
        msg = (f'Calibrate {terrain}: defaultscaling={v["d"]} '
               f'scanline1={v["a"]:.0f} scanline2={v["b"]:.0f} '
               f'scaling2={v["s"]} ({len(pins)} pins)\n\n'
               f'Published from /calibrate.')
        _git('commit', '-m', msg)
        commit = _git('rev-parse', '--short', 'HEAD').stdout.strip()
        push = _git('push', 'origin', BRANCH, check=False)
        if push.returncode != 0:
            raise RuntimeError('push failed:\n' + push.stderr[-2000:])

    deploy = subprocess.run(['bash', str(DEPLOY), '--env', 'dev'],
                            cwd=str(REPO), capture_output=True, text=True,
                            timeout=900)
    tail = '\n'.join((deploy.stdout + deploy.stderr).splitlines()[-25:])
    return {'terrain': terrain, 'master': master.name, 'changed': changed,
            'element_before': before, 'element_after': after,
            'commit': commit, 'deploy_ok': deploy.returncode == 0,
            'deploy_tail': tail}


class Handler(BaseHTTPRequestHandler):
    protocol_version = 'HTTP/1.1'

    def _send(self, code: int, payload: dict) -> None:
        raw = json.dumps(payload).encode()
        self.send_response(code)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-Length', str(len(raw)))
        self.end_headers()
        self.wfile.write(raw)

    def _authed(self) -> bool:
        got = self.headers.get('Authorization', '')
        want = 'Bearer ' + TOKEN
        return hmac.compare_digest(got.encode(), want.encode())

    def _body(self):
        n = int(self.headers.get('Content-Length') or 0)
        if n > MAX_BODY:
            raise ValueError('body too large')
        return json.loads(self.rfile.read(n) or b'{}')

    def log_message(self, fmt, *args):  # journald gets one line per request
        sys.stderr.write('%s %s\n' % (self.address_string(), fmt % args))

    def do_GET(self):
        if self.path == '/health':
            return self._send(200, {'status': 'ok'})
        if not self._authed():
            return self._send(401, {'error': 'unauthorized'})
        if self.path == '/calib':
            return self._send(200, {'terrains': calib_index()})
        m = re.match(r'^/calib/([^/]+)$', self.path)
        if m:
            try:
                path = sidecar_path(m.group(1))
            except ValueError as exc:
                return self._send(400, {'error': str(exc)})
            if not path.is_file():
                return self._send(404, {'error': 'never saved'})
            return self._send(200, json.loads(path.read_text()))
        self._send(404, {'error': 'no such route'})

    def do_PUT(self):
        if not self._authed():
            return self._send(401, {'error': 'unauthorized'})
        m = re.match(r'^/calib/([^/]+)$', self.path)
        if not m:
            return self._send(404, {'error': 'no such route'})
        try:
            data = validate_sidecar(self._body())
            if data['terrain'] != m.group(1):
                raise ValueError('terrain in body and path disagree')
            write_sidecar(m.group(1), data)
        except (ValueError, KeyError, TypeError, json.JSONDecodeError) as exc:
            return self._send(400, {'error': str(exc)})
        self._send(200, {'saved': m.group(1)})

    def do_POST(self):
        if not self._authed():
            return self._send(401, {'error': 'unauthorized'})
        if self.path != '/publish':
            return self._send(404, {'error': 'no such route'})
        if not _publish_lock.acquire(blocking=False):
            return self._send(409, {'error': 'a publish is already running'})
        try:
            result = do_publish(self._body())
            self._send(200, result)
        except (ValueError, KeyError, TypeError, LookupError,
                json.JSONDecodeError) as exc:
            self._send(400, {'error': str(exc)})
        except (RuntimeError, subprocess.TimeoutExpired,
                subprocess.CalledProcessError) as exc:
            err = str(exc)
            if isinstance(exc, subprocess.CalledProcessError):
                err += '\n' + (exc.stderr or '')[-2000:]
            self._send(500, {'error': err})
        finally:
            _publish_lock.release()


def main() -> None:
    server = ThreadingHTTPServer(('127.0.0.1', PORT), Handler)
    sys.stderr.write(f'calibrate_server: repo={REPO} port={PORT}\n')
    server.serve_forever()


if __name__ == '__main__':
    main()
