// Runs the real routing + config modules through esbuild, then asserts.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { writeFileSync, mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'b.mjs');
await build({ entryPoints: ['src/routing.ts', 'src/config.ts'], bundle: true,
  format: 'esm', outfile: out, logLevel: 'silent',
  plugins: [{ name: 'x', setup(b){ b.onEnd(()=>{}); } }] }).catch(async () => {
  await build({ entryPoints: ['src/routing.ts'], bundle: true, format: 'esm', outfile: out, logLevel: 'silent' });
});
const { parseRoute, pathForChapter, DEFAULT_PATH } = await import(pathToFileURL(out));

const CH = { INTRO:0, LANDNAM:2, KRISTNITAKA:3, SIDASKIPTI:4, TYRKJARAN:5, EXTRO:6 };
let n = 0; const ok = (d,f) => { f(); n++; console.log('  ok  ' + d); };

ok('/ is unrouted (caller redirects to intro)', () => assert.equal(parseRoute('/'), null));
ok('DEFAULT_PATH is /intro',                    () => assert.equal(DEFAULT_PATH, '/intro'));
ok('/intro -> INTRO',                           () => assert.equal(parseRoute('/intro').chapter, CH.INTRO));
ok('/chapter1 -> Landnam',                      () => assert.equal(parseRoute('/chapter1').chapter, CH.LANDNAM));
ok('/chapter2 -> Kristnitaka',                  () => assert.equal(parseRoute('/chapter2').chapter, CH.KRISTNITAKA));
ok('/chapter3 -> Sidaskipti',                   () => assert.equal(parseRoute('/chapter3').chapter, CH.SIDASKIPTI));
ok('/chapter4 -> Tyrkjaranid',                  () => assert.equal(parseRoute('/chapter4').chapter, CH.TYRKJARAN));
ok('/extro -> EXTRO',                           () => assert.equal(parseRoute('/extro').chapter, CH.EXTRO));
ok('icelandic alias /kristnitaka -> chapter2',  () => assert.equal(parseRoute('/kristnitaka').chapter, CH.KRISTNITAKA));
ok('alias canonicalises to /chapter2',          () => assert.equal(parseRoute('/kristnitaka').path, '/chapter2'));
ok('case-insensitive',                          () => assert.equal(parseRoute('/CHAPTER2').chapter, CH.KRISTNITAKA));
ok('trailing slash tolerated',                  () => assert.equal(parseRoute('/chapter2/').chapter, CH.KRISTNITAKA));
ok('unknown path -> null',                      () => assert.equal(parseRoute('/bogus'), null));
ok('pathForChapter round-trips',                () => {
  for (const c of [0,2,3,4,5,6]) assert.equal(parseRoute(pathForChapter(c)).chapter, c);
});

console.log(`\n  ${n} passed`);
