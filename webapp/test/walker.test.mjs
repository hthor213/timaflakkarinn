// Walker pathing, ported from Java MovingActor (updateLocation /
// destinationReached / control / xFailed / yFailed).
//
// The bug this pins down: when the straight line to the destination is blocked
// by the terrain polygon, the walker must remember the real target and walk
// axis-aligned legs toward it, re-deriving its course each leg. The first web
// port instead kept the original course while sliding along the wall, so the
// actor drifted permanently off target and parked itself in a corner —
// Vífill walking to the right edge of Ingólfshöfði instead of stopping to
// Karli's left.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const dir = mkdtempSync(join(tmpdir(), 'tt-'));
const entry = join(dir, 'entry.ts');
writeFileSync(entry, [
  "export { MovingActor, DYNAMIC_SCALING } from '@src/engine/Actor';",
  "export { Terrain } from '@src/engine/Terrain';",
].join('\n'));

const out = join(dir, 'w.mjs');
await build({
  entryPoints: [entry], bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
  alias: { '@src': join(process.cwd(), 'src') },
});
const { MovingActor, Terrain, DYNAMIC_SCALING } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

// landnam.gml: <Polygon name="p_Ingolfshofdi"> + <SimplePseudo3DTerrain
// name="t_Ingolfshofdil" ... defaultscaling="0.65" scaling2="0.55"
// scanline1="580" scanline2="420"/>. The (177..260, 424..470) notch is a raised
// ledge whose right wall sits between the ledge and the beach.
const P_INGOLFSHOFDI = [
  [-250, 599], [-250, 483], [0, 483], [177, 424], [260, 424],
  [260, 470], [680, 476], [688, 541], [799, 550], [799, 599],
];
const KARLI_WALK = [360, 550]; // q_WalkVifillToKarliIngolfshofdi

function ingolfshofdi() {
  const t = new Terrain('t_Ingolfshofdil');
  t.setPolygon(P_INGOLFSHOFDI);
  t.zMin = -1; t.zMax = 1500;
  t.defaultScaling = 0.65;
  t.setScalingParameters(580, 420, 0.55);
  return t;
}

/** Walk an actor to a destination, pulsing until it stops. */
function walk(terrain, from, dest, maxTicks = 20000) {
  const a = new MovingActor('vifill');
  a.scalingType = DYNAMIC_SCALING;
  a.currentTerrain = terrain;
  terrain.addActor(a);
  a.setLocation(from[0], from[1], 0);
  let reached = false;
  a.onDestinationReached = () => { reached = true; };
  const live = new Set();
  a.pulser = { register: o => live.add(o), unregister: o => live.delete(o) };
  a.setDestination(dest[0], dest[1]);
  let ticks = 0;
  while (live.size && ticks < maxTicks) { a.pulse(30); ticks++; }
  return { x: a.location.x, y: a.location.y, ticks, reached, stillPulsing: live.size > 0 };
}

const at = (r, p, tol = 2) =>
  Math.abs(r.x - p[0]) <= tol && Math.abs(r.y - p[1]) <= tol;

ok('clear line of sight: walks straight to the destination', () => {
  const r = walk(ingolfshofdi(), [150, 550], KARLI_WALK);
  assert.ok(at(r, KARLI_WALK), `ended at ${r.x},${r.y}`);
  assert.ok(r.reached, 'never fired onDestinationReached');
});

ok('blocked by the ledge wall: still stops at Karli, not the screen edge', () => {
  // Standing on the upper ledge, the direct line to (360,550) crosses the wall
  // at x=260. Pre-fix this ended at (798,599) — the bottom-right corner.
  for (const from of [[220, 425], [235, 435], [250, 445], [250, 455], [240, 430]]) {
    const r = walk(ingolfshofdi(), from, KARLI_WALK);
    assert.ok(at(r, KARLI_WALK),
      `from ${from} ended at ${Math.round(r.x)},${Math.round(r.y)}`);
    assert.ok(r.reached, `from ${from} never fired onDestinationReached`);
  }
});

ok('every walkable start point reaches the authored destination', () => {
  const t = ingolfshofdi();
  let tested = 0;
  const bad = [];
  for (let y = 425; y <= 595; y += 10) {
    for (let x = -245; x <= 795; x += 15) {
      if (!t.contains({ x, y, z: 0 })) continue;
      tested++;
      const r = walk(ingolfshofdi(), [x, y], KARLI_WALK);
      if (!at(r, KARLI_WALK, 3)) bad.push([x, y, Math.round(r.x), Math.round(r.y)]);
    }
  }
  assert.ok(tested > 500, `only ${tested} start points tested`);
  assert.deepEqual(bad, [], `${bad.length}/${tested} start points missed the target`);
});

ok('an unreachable destination stops and still reports arrival', () => {
  // Nothing may hang: SetDestinationQuantum with wait="true" blocks its whole
  // sequence until onDestinationReached fires.
  const r = walk(ingolfshofdi(), [150, 550], [400, 200]); // far above the floor
  assert.ok(!r.stillPulsing, 'walker never stopped pulsing');
  assert.ok(r.reached, 'gave up without firing onDestinationReached');
});

ok('no terrain: walks freely to the destination', () => {
  const t = new Terrain('open');
  t.setPolygon([]);
  const r = walk(t, [0, 0], [123, -45]);
  assert.ok(at(r, [123, -45]), `ended at ${r.x},${r.y}`);
});

console.log(`\n  ${n} passed`);
