// Position validation is gated on the state having a collision box.
//
// Java validates a move only when the actor's *current state* declares one
// (`Actor.setLocation`: `currentCollisionBox != null && !validLocation(...)`).
// The port tested `terrain.contains()` unconditionally, which silently froze
// every boxless scripted walk in the game — and boxless is exactly what the
// 1998 content used for actors that enter or leave the frame, because a walk
// to x=-250 or y=1130 is outside the terrain polygon by design.
//
// The reported symptom: in Landnám's ship scene the öndvegissúlur are thrown
// overboard with no animation. `ingolfur2` sits at z=327 against a terrain of
// zmin=-7/zmax=0, so *every* step was rejected; he never left his off-screen
// start, and his ten-frame `push` animation — Ingólfur tipping the pillar over
// the rail, its fall, and the splash — played 260px below the bottom of the
// canvas. Both `wait="true"` walks reported "reached" immediately, so nothing
// hung and nothing logged: the pillar just vanished.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync, writeFileSync, readFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const dir = mkdtempSync(join(tmpdir(), 'tt-'));
const entry = join(dir, 'entry.ts');
writeFileSync(entry, [
  "export { MovingActor } from '@src/engine/Actor';",
  "export { AnimatedActorFace } from '@src/engine/ActorFace';",
  "export { Terrain } from '@src/engine/Terrain';",
].join('\n'));

const out = join(dir, 'c.mjs');
await build({
  entryPoints: [entry], bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
  alias: { '@src': join(process.cwd(), 'src') },
});
const { MovingActor, AnimatedActorFace, Terrain } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

const SCREEN = { width: 800, height: 600 };

// landnam.gml: <SimplePseudo3DTerrain name="t_Skipingolfs" polygon="p_All"
// zmin="-7" zmax="0" defaultscaling="1.0"/>, p_All being the whole screen.
function shipTerrain() {
  const t = new Terrain('t_Skipingolfs');
  t.setPolygon([[0, 0], [800, 0], [800, 600], [0, 600]]);
  t.zMin = -7; t.zMax = 0;
  t.defaultScaling = 1.0;
  return t;
}

/** q_MoveIngolfur2Skipingolfs: <Location x="125" y="1187" z="327"/> */
const START = [125, 1187, 327];
const WALK2 = [165, 520];  // q_WalkIngolfurSkipIngolfs2, speed="130"
const WALK3 = [415, 500];  // q_WalkIngolfurSkipIngolfs3, speed="130"

/**
 * `ingolfur2` as landnam.gml declares him: five states, not one of them
 * carrying a `collisionbox=`.
 */
function ingolfur2(terrain, face = null) {
  const a = new MovingActor('ingolfur2');
  for (const s of ['right', 'back', 'stop', 'skipsfelagarnusjaum']) {
    a.addState(s, null, null);
  }
  a.addState('push', face, null);
  a.setState('stop');
  a.currentTerrain = terrain;
  terrain.addActor(a);
  a.setLocation(...START);
  a.speed = 130;
  return a;
}

/** Drive one SetDestinationQuantum to completion. */
function walkTo(a, [x, y], maxTicks = 20000) {
  let reached = false;
  a.onDestinationReached = () => { reached = true; };
  const live = new Set();
  a.pulser = { register: o => live.add(o), unregister: o => live.delete(o) };
  a.setDestination(x, y);
  let ticks = 0;
  while (live.size && ticks < maxTicks) { a.pulse(30); ticks++; }
  return reached;
}

const at = (a, [x, y], tol = 2) =>
  Math.abs(a.location.x - x) <= tol && Math.abs(a.location.y - y) <= tol;

ok('a boxless actor walks its authored route instead of freezing in place', () => {
  const a = ingolfur2(shipTerrain());
  assert.ok(walkTo(a, WALK2), 'walk 2 never fired onDestinationReached');
  assert.ok(at(a, WALK2), `walk 2 ended at ${a.location.x},${a.location.y}`);
  assert.ok(walkTo(a, WALK3), 'walk 3 never fired onDestinationReached');
  assert.ok(at(a, WALK3), `walk 3 ended at ${a.location.x},${a.location.y}`);
  // Pre-fix he was still standing on his start point, both walks having
  // reported success without moving him a pixel.
  assert.notDeepEqual(
    [a.location.x, a.location.y], [START[0], START[1]],
    'actor never moved — the terrain test is still being applied',
  );
});

ok('the throw happens on screen, not below the bottom of the canvas', () => {
  const a = ingolfur2(shipTerrain());
  walkTo(a, WALK2); walkTo(a, WALK3);
  // SimplePseudo3DTerrain.getPhysicalYCoord: y - z.
  const screenY = a.location.y - a.location.z;
  assert.equal(a.location.x, WALK3[0]);
  assert.ok(screenY > 0 && screenY < SCREEN.height,
    `Ingólfur is at screen y=${screenY}, outside 0..${SCREEN.height}`);
  assert.equal(screenY, 173); // 500 - 327, the mark he was authored to stand on
});

ok('a state that DOES declare a box is still held inside the terrain', () => {
  // The gate must not become a blanket removal of collision: issue #10's
  // detour behaviour depends on boxed actors still being blocked.
  const t = shipTerrain();
  const a = new MovingActor('vifill');
  a.addState('stop', null, null, 100, 15, 292); // vifill_cb
  a.setState('stop');
  a.currentTerrain = t;
  t.addActor(a);
  a.setLocation(400, 300, 0);
  walkTo(a, [400, 2000]); // straight down, off the bottom of p_All
  assert.ok(a.location.y <= 600,
    `boxed actor escaped the polygon to y=${a.location.y}`);
});

ok('the ten-frame push animation runs to its end and holds the last frame', () => {
  // The frames are real: LANDNAM/ANIMATIA/INGOLFUR/PUSH.PNG is a vertical strip
  // of ten cells, read straight out of the 1998 master here so the test fails
  // if the asset is ever replaced with a different frame count.
  const png = readFileSync(join(process.cwd(), '..',
    'web_import/GAME/LANDNAM/ANIMATIA/INGOLFUR/PUSH.PNG'));
  const width = png.readUInt32BE(16);
  const height = png.readUInt32BE(20);
  assert.equal(height % 10, 0, `PUSH.PNG is ${width}x${height}, not 10 whole cells`);

  // <CelledAnimated2DActorFace name="ingolfur_push" repeat="1" count="10"
  //  speed="225" xoffset="0" yoffset="-60"/>
  const face = new AnimatedActorFace('ingolfur_push', '', 10, 225, 1);
  face.yOffset = -60;
  const live = new Set();
  face.pulser = { register: o => live.add(o), unregister: o => live.delete(o) };

  const t = shipTerrain();
  const a = ingolfur2(t, face);
  walkTo(a, WALK2); walkTo(a, WALK3);

  let finished = false;
  face.onAnimationFinished = () => { finished = true; };
  a.setState('push');

  // Stand in for prepare(), which needs a browser to decode the PNG.
  face.prepared = true;
  face.frameWidth = width;
  face.frameHeight = height / 10;
  a.updateFace();

  const seen = new Set([face.currentFrame]);
  for (let i = 0; i < 20 && live.size; i++) { face.pulse(225); seen.add(face.currentFrame); }

  assert.equal(seen.size, 10, `showed ${seen.size} distinct frames, expected 10`);
  assert.ok(finished, 'never fired onAnimationFinished — a wait="true" quantum would hang');
  assert.equal(face.currentFrame, 9, 'must rest on the closing pose, not wrap to frame 0');

  // The whole gesture — Ingólfur, the falling pillar, the splash — has to be
  // inside the frame. bounds is the rect the canvas actually blits to.
  assert.equal(face.bounds.x, 415);
  assert.equal(face.bounds.y, 173 - 60);
  assert.ok(face.bounds.x >= 0 && face.bounds.y >= 0,
    `push draws at ${face.bounds.x},${face.bounds.y}`);
  assert.ok(face.bounds.y + face.bounds.height <= SCREEN.height,
    `push runs ${face.bounds.y + face.bounds.height - SCREEN.height}px past the bottom`);
});

console.log(`\n  ${n} passed`);
