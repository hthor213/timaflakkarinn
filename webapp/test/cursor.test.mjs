// Cursor hotspot, ported from Java CursorFace.
// BENDILL1/2 are 30x30 with four arrowheads converging on the CENTRE pixel,
// so the art must be centred on the mouse point: the 1999 ctor set
// xOffset/yOffset to half the image size and setLocation() SUBTRACTED them
// (CursorFace.java:45-46,98-99), unlike ActorFace.setLocation() which adds
// (ActorFace.java:235). Drawing top-left at the mouse point put the visual
// hotspot 15px down-right of the point Scene.getActorFaceAt() actually tests.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'c.mjs');
await build({ entryPoints: ['src/engine/ActorFace.ts'], bundle: true,
  format: 'esm', outfile: out, logLevel: 'silent' });
const { CursorFace } = await import(pathToFileURL(out));

// Awaited, unlike the sibling suites' sync helper: prepare() is async, and an
// un-awaited body would print "ok" before its assertions ever ran.
let n = 0; const ok = async (d, f) => { await f(); n++; console.log('  ok  ' + d); };

/** Loader stub: hands back an image of the given size, as the real one does
 *  only after decode (AssetLoader.applyChromaKey resolves on result.onload). */
const loaderOf = (w, h) => ({ loadImage: async () => ({ naturalWidth: w, naturalHeight: h }) });

await ok('30x30 cursor centres on the mouse point', async () => {
  const c = new CursorFace('bendill', '\\common\\bendill1');
  await c.prepare(loaderOf(30, 30));
  assert.equal(c.xOffset, 15, `xOffset ${c.xOffset}, expected 15`);
  assert.equal(c.yOffset, 15, `yOffset ${c.yOffset}, expected 15`);
  c.setLocation(400, 300);
  assert.equal(c.bounds.x, 385, `bounds.x ${c.bounds.x}, expected 385`);
  assert.equal(c.bounds.y, 285, `bounds.y ${c.bounds.y}, expected 285`);
});

await ok('the drawn centre lands back on the mouse point', async () => {
  const c = new CursorFace('bendill', '\\common\\bendill1');
  await c.prepare(loaderOf(30, 30));
  for (const [mx, my] of [[0, 0], [17, 233], [400, 300], [799, 599]]) {
    c.setLocation(mx, my);
    const cx = c.bounds.x + c.bounds.width / 2;
    const cy = c.bounds.y + c.bounds.height / 2;
    assert.equal(cx, mx, `centre x ${cx} != mouse x ${mx}`);
    assert.equal(cy, my, `centre y ${cy} != mouse y ${my}`);
  }
});

await ok('odd sizes floor, never landing the hotspot outside the art', async () => {
  const c = new CursorFace('odd', '\\common\\odd');
  await c.prepare(loaderOf(31, 31));
  assert.equal(c.xOffset, 15);
  c.setLocation(100, 100);
  assert.equal(c.bounds.x, 85);
});

await ok('an explicit hotspot from the ctor survives prepare()', async () => {
  const c = new CursorFace('tip', '\\common\\tip', 3, 4);
  await c.prepare(loaderOf(30, 30));
  assert.equal(c.xOffset, 3, 'ctor offset was overwritten by the centre default');
  assert.equal(c.yOffset, 4, 'ctor offset was overwritten by the centre default');
  c.setLocation(400, 300);
  assert.equal(c.bounds.x, 397);
  assert.equal(c.bounds.y, 296);
});

// Regression guard for the actual bug: top-left-at-mouse placement.
await ok('cursor is NOT drawn with its top-left at the mouse point', async () => {
  const c = new CursorFace('bendill', '\\common\\bendill1');
  await c.prepare(loaderOf(30, 30));
  c.setLocation(400, 300);
  assert.notEqual(c.bounds.y, 300, 'cursor top-left sits on the mouse point again');
  assert.ok(c.bounds.y < 300, 'cursor art must sit ABOVE the hit point, not below');
});

console.log(`\n  ${n} passed\n`);
