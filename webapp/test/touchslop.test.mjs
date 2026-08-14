// Touch pick tolerance — known-issues #26.
//
// The 1999 hotspots were sized for a mouse cursor; on a phone some are
// smaller than the fingertip aiming at them. Georg's playthrough report named
// two: the barrel tap in Tyrkjarán and the Thor's-hammer necklace in
// Kristnitaka — "many tries, and only exactly the right point worked".
//
// The fix is a finger allowance in the hit test, never a change to authored
// geometry: an exact hit always wins; otherwise the nearest SMALL face within
// the slop radius takes the tap. Small means at most 2*slop per side — a
// target a fingertip can genuinely miss. Large faces (characters, backdrops,
// covering plates) never attract, and nothing below the exact hit in z can be
// picked, so a covering face keeps covering. A mouse passes slop 0 and gets
// the exact 1999 behaviour, byte for byte.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const dir = mkdtempSync(join(tmpdir(), 'tt-'));
const entry = join(dir, 'entry.ts');
writeFileSync(entry, [
  "export { Actor } from '@src/engine/Actor';",
  "export { StaticActorFace } from '@src/engine/ActorFace';",
  "export { Terrain } from '@src/engine/Terrain';",
  "export { Scene } from '@src/engine/Scene';",
].join('\n'));

const out = join(dir, 't.mjs');
await build({
  entryPoints: [entry], bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
  alias: { '@src': join(process.cwd(), 'src') },
});
const { Actor, StaticActorFace, Terrain, Scene } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

// ---------------------------------------------------------------- fixtures

function hotspot(name, w, h) {
  const f = new StaticActorFace(name, '');
  f.frameWidth = w; f.frameHeight = h;
  f.bounds.width = w; f.bounds.height = h;
  f.prepared = true;
  f.paint = () => {};
  return f;
}

function sprite(name, w, h) {
  const f = hotspot(name, w, h);
  f.imagePath = `/fake/${name}.png`;
  return f;
}

function actor(name, terrain, [x, y, z], face) {
  const a = new Actor(name);
  a.addState('stop', face, null, 0, 0, 0);
  a.setTerrain(terrain);
  a.setState('stop');
  a.setLocation(x, y, z);
  return a;
}

/**
 * A flat 800x600 room in the shape of Georg's complaint: a full-screen
 * backdrop, a big barrel sprite, and a 22x30 tap on its rim — small enough
 * that a fingertip misses it more often than not.
 */
function room() {
  const scene = new Scene('s_Test');
  const t = new Terrain('t_Test');
  t.setPolygon([[0, 0], [800, 0], [800, 600], [0, 600]]);
  t.defaultScaling = 1.0;
  t.scrolling = false;
  scene.addTerrain(t);
  const a = {};
  a.backdrop = actor('a_Backdrop', t, [0, -2, -2], sprite('af_Backdrop', 800, 600));
  a.tunna = actor('a_Tunna', t, [700, 420, 100], sprite('af_Tunna', 127, 164));
  a.tappi = actor('a_Tappi', t, [709, 430, 200], hotspot('af_Tappi', 22, 30));
  scene.sortFaces();
  return { scene, a };
}

const SLOP = 34;   // 22 CSS px at a typical phone scale of 0.65

// -------------------------------------------------------------------- tests

ok('slop 0 is the exact 1999 hit test: a near miss stays a miss', () => {
  const { scene, a } = room();
  const b = a.tappi.currentFace.bounds;
  assert.equal(scene.getActorFaceAt(b.x - 5, b.y - 5), a.backdrop.currentFace);
  assert.equal(scene.getActorFaceAt(b.x + 1, b.y + 1), a.tappi.currentFace);
});

ok('an exact touch on the small face wins outright', () => {
  const { scene, a } = room();
  const b = a.tappi.currentFace.bounds;
  assert.equal(scene.getActorFaceAt(b.x + 1, b.y + 1, SLOP), a.tappi.currentFace);
});

ok('a near miss inside the slop snaps to the small hotspot', () => {
  const { scene, a } = room();
  const b = a.tappi.currentFace.bounds;
  assert.equal(scene.getActorFaceAt(b.x - 20, b.y - 20, SLOP), a.tappi.currentFace);
});

ok('a miss beyond the slop stays a miss', () => {
  const { scene, a } = room();
  const b = a.tappi.currentFace.bounds;
  assert.equal(scene.getActorFaceAt(b.x - SLOP - 30, b.y - SLOP - 30, SLOP),
               a.backdrop.currentFace);
});

ok('large faces never attract: a tap near the barrel does not become the barrel', () => {
  const { scene, a } = room();
  const b = a.tunna.currentFace.bounds;
  // left of the barrel, outside every bounds, far from the tap
  const got = scene.getActorFaceAt(b.x - 10, b.y + 10, SLOP);
  assert.equal(got, a.backdrop.currentFace);
});

ok('a tap landing ON the barrel near the tap is pulled to the tap', () => {
  const { scene, a } = room();
  const tap = a.tappi.currentFace.bounds;
  // inside the barrel sprite, 15px left of the tap hotspot
  const got = scene.getActorFaceAt(tap.x - 15, tap.y + 5, SLOP);
  assert.equal(got, a.tappi.currentFace);
});

ok('the nearest of two small faces wins', () => {
  const { scene, a } = room();
  const near = actor('a_Near', scene.terrains[0], [500, 300, 200], hotspot('af_Near', 20, 20));
  const far = actor('a_Far', scene.terrains[0], [560, 300, 200], hotspot('af_Far', 20, 20));
  scene.sortFaces();
  const nb = near.currentFace.bounds;
  const got = scene.getActorFaceAt(nb.x + nb.width + 8, nb.y + 5, SLOP);
  assert.equal(got, near.currentFace, 'nearer hotspot should win');
  assert.notEqual(got, far.currentFace);
});

ok('nothing below a covering face can be picked by slop', () => {
  const { scene, a } = room();
  // A full-screen cover ABOVE everything — a scene curtain. getZOrder() is
  // the owner's world y (painter's algorithm by depth), so "above" means
  // authored at a larger y; z lifts the face back to screen origin.
  const cover = actor('a_Cover', scene.terrains[0], [0, 3000, 3000],
                      hotspot('af_Cover', 800, 600));
  scene.sortFaces();
  assert.ok(cover.currentFace.getZOrder() > a.tappi.currentFace.getZOrder(),
            'fixture: cover must be above the tap');
  const b = a.tappi.currentFace.bounds;
  assert.equal(scene.getActorFaceAt(b.x - 10, b.y - 10, SLOP), cover.currentFace);
});

console.log(`touchslop: ${n} passed`);
