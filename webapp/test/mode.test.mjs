import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'c.mjs');
await build({ entryPoints: ['src/config.ts'], bundle: true, format: 'esm', outfile: out, logLevel: 'silent' });
const { resolveMode, hasDebugControl } = await import(pathToFileURL(out));

const loc = (href) => new URL(href);
let n = 0; const ok = (d,f) => { f(); n++; console.log('  ok  ' + d); };

ok('production host -> play',        () => assert.equal(resolveMode(loc('https://tt.spliffdonk.com/chapter1')), 'play'));
ok('tt-dev host -> play',            () => assert.equal(resolveMode(loc('https://tt-dev.spliffdonk.com/chapter1')), 'play'));
ok('localhost -> play',              () => assert.equal(resolveMode(loc('http://localhost:5199/intro')), 'play'));
ok('127.0.0.1 -> play',              () => assert.equal(resolveMode(loc('http://127.0.0.1:5199/intro')), 'play'));
ok('?debug=1 forces debug on prod',  () => assert.equal(resolveMode(loc('https://tt.spliffdonk.com/intro?debug=1')), 'debug'));
ok('?debug=0 forces play locally',   () => assert.equal(resolveMode(loc('http://localhost:5199/intro?debug=0')), 'play'));
ok('?debug=0 beats tt-dev host',     () => assert.equal(resolveMode(loc('https://tt-dev.spliffdonk.com/?debug=0')), 'play'));
ok('?debug=1 opts into debug on dev', () => assert.equal(resolveMode(loc('https://tt-dev.spliffdonk.com/chapter2?debug=1')), 'debug'));
ok('tt-dev offers a debug control', () => assert.equal(hasDebugControl(loc('https://tt-dev.spliffdonk.com')), true));
ok('local preview offers a debug control', () => assert.equal(hasDebugControl(loc('http://localhost:5199')), true));
ok('production has no debug control', () => assert.equal(hasDebugControl(loc('https://tt.spliffdonk.com/?debug=1')), false));

console.log(`\n  ${n} passed`);
