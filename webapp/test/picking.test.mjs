// Hit-testing and painting must share one coordinate space.
//
// 1999 puts the scroll offset into the *layout*: a scrolling
// `SimplePseudo3DTerrain.getPhysicalXCoord()` subtracts
// `((ScrollingScene) myScene).getScrollPosition().x`, so `ActorFace.bounds` is
// screen space, `paint()` blits straight at bounds, and
// `Scene.getActorFaceAt(mouseX, mouseY)` compares screen against screen.
// `ScrollingScene.setScrollPosition()` re-runs `actor.setLocation(...)` over
// every terrain so the whole scene re-lays-out on each 30px step.
//
// The port passed 0 for the scroll and translated the canvas at paint time
// instead. It looked right and picked wrong: bounds stayed in *world* space
// while the pointer stayed in *screen* space, so every hover and click in a
// scrolling scene missed by exactly the scroll offset — and the same translate
// dragged the `scrolling="false"` terrains (corner HUD, subtitles) off with the
// viewport.
//
// The reported symptom is Tyrkjaránið's `s_Kot`: the cottage door
// (`a_KotHurd`, an invisible 111x370 hotspot at world x=996) sits in the right
// third of a 1200px room, so a *screen* x of 996 does not exist on an 800px
// canvas — the door was unclickable at every scroll offset, at every pixel,
// and clicks aimed at it landed on whatever world-space rectangle happened to
// lie under that screen point: `a_Mamma`, `a_KotTunnur1`, `a_Tunna`.
//
// Every number below is read off web_import/gml/tyrkran.gml.
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
  "export { Scene, ScrollingScene } from '@src/engine/Scene';",
].join('\n'));

const out = join(dir, 'p.mjs');
await build({
  entryPoints: [entry], bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
  alias: { '@src': join(process.cwd(), 'src') },
});
const { Actor, StaticActorFace, Terrain, Scene, ScrollingScene } =
  await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

// ---------------------------------------------------------------- fixtures

/**
 * `<TransparentActorFace name=... width=... height=.../>`, built the way
 * GMLParser builds it: a StaticActorFace with no image, pre-sized and marked
 * prepared so it hit-tests without ever loading a byte.
 */
function hotspot(name, w, h) {
  const f = new StaticActorFace(name, '');
  f.frameWidth = w; f.frameHeight = h;
  f.bounds.width = w; f.bounds.height = h;
  f.prepared = true;
  f.paint = () => {};
  return f;
}

/** An image-backed face whose PNG is already "loaded" at a known size. */
function sprite(name, w, h) {
  const f = hotspot(name, w, h);
  f.imagePath = `/fake/${name}.png`;
  return f;
}

function actor(name, terrain, [x, y, z], face, box = null) {
  const a = new Actor(name);
  a.addState('stop', face, null, box?.[0] ?? 0, box?.[1] ?? 0, box?.[2] ?? 0);
  a.setTerrain(terrain);
  a.setState('stop');
  a.setLocation(x, y, z);
  return a;
}

/**
 * `s_Kot` as tyrkran.gml declares it.
 *
 *   <ScrollingScene name="s_Kot" width="1200" height="600"/>
 *   <SimplePseudo3DTerrain name="t_Kot"  polygon="p_All" zmin="-7" zmax="-1"
 *                          defaultscaling="1.0"/>
 *   <SimplePseudo3DTerrain name="t_Kotl" polygon="p_Kot" zmin="-1" zmax="1500"
 *                          defaultscaling="1.0" scaling2="0.75"
 *                          scanline1="600" scanline2="385"/>
 *   <SimplePseudo3DTerrain name="t_Corners" polygon="p_All" zmin="1000"
 *                          zmax="2000" defaultscaling="1.0" scrolling="false"/>
 *
 * Neither t_Kot nor t_Kotl declares `scrolling`, and scene.dtd defaults it to
 * 'true' — a default the browser's DOMParser does not apply, which is why
 * GMLParser hard-codes it. t_Corners opts out explicitly.
 */
function kot() {
  const scene = new ScrollingScene('s_Kot');
  scene.realWidth = 1200; scene.realHeight = 600;

  const mk = (name, scrolling) => {
    const t = new Terrain(name);
    t.setPolygon([[0, 0], [1200, 0], [1200, 600], [0, 600]]);
    t.defaultScaling = 1.0;
    t.scrolling = scrolling;
    scene.addTerrain(t);
    return t;
  };
  const tKot = mk('t_Kot', true);
  const tKotl = mk('t_Kotl', true);
  const tCorners = mk('t_Corners', false);

  const a = {};
  // <StaticActor name="a_Kot1" terrain="t_Kot" x="0" y="-2" z="-2"/> KOT1.PNG 800x600
  a.kot1 = actor('a_Kot1', tKot, [0, -2, -2], sprite('af_Kot1', 800, 600));
  // <StaticActor name="a_Kot2" terrain="t_Kot" x="800" y="-2" z="-2"/> KOT2.PNG 400x600
  a.kot2 = actor('a_Kot2', tKot, [800, -2, -2], sprite('af_Kot2', 400, 600));
  // <TransparentActorFace name="af_KotHurd" width="111" height="370"/>
  // <StaticActor name="a_KotHurd" terrain="t_Kot" x="996" y="139" z="0"/>
  a.hurd = actor('a_KotHurd', tKot, [996, 139, 0], hotspot('af_KotHurd', 111, 370));
  // <TransparentActorFace name="af_KotTunnur1" width="189" height="133"/>
  // <StaticActor name="a_KotTunnur1" terrain="t_Kotl" x="595" y="242" z="0"/>
  a.tunnur = actor('a_KotTunnur1', tKotl, [595, 242, 0], hotspot('af_KotTunnur1', 189, 133));
  // <Pseudo3DCollisionBox name="cb_Tunna" x="127" y="20" z="144"/>
  // <StaticActor name="a_Tunna" terrain="t_Kotl" x="700" y="420" z="0"/> TUNNA.PNG 127x164
  a.tunna = actor('a_Tunna', tKotl, [700, 420, 0], sprite('af_Tunna', 127, 164), [127, 20, 144]);
  // <Pseudo3DCollisionBox name="cb_Mamma" x="213" y="20" z="328"/>
  // <StaticActor name="a_Mamma" terrain="t_Kotl" x="520" y="450" z="0"/> STOP.PNG 213x328
  a.mamma = actor('a_Mamma', tKotl, [520, 450, 0], sprite('af_Mamma', 213, 328), [213, 20, 328]);
  // <StaticActor name="a_States" terrain="t_Corners" x="0" y="1000" z="1000"/>
  a.states = actor('a_States', tCorners, [0, 1000, 1000], sprite('af_Freeze', 112, 84));

  return { scene, a };
}

/**
 * The door handle, in the door's own rectangle: 80% across (the latch edge,
 * away from the hinge) and 55% down. World (1084, 342).
 */
const HANDLE_WORLD = [996 + Math.round(0.8 * 111), 139 + Math.round(0.55 * 370)];

/** Scroll all the way right — the only way any of the door is on screen. */
const MAX_SCROLL = 1200 - 800;

// ------------------------------------------------------------------- cases

ok('the door is on screen once the room is scrolled right', () => {
  const { scene, a } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  const b = a.hurd.currentFace.bounds;
  assert.equal(b.x, 996 - MAX_SCROLL, 'door not placed in screen space');
  assert.equal(b.y, 139);
  assert.equal(b.width, 111);
  assert.equal(b.height, 370);
  assert.ok(b.x >= 0 && b.x + b.width <= 800,
    `door rect ${b.x}..${b.x + b.width} is not inside the 800px canvas`);
});

ok('clicking the door handle picks the door — the reported bug', () => {
  const { scene, a } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  const [hx, hy] = [HANDLE_WORLD[0] - MAX_SCROLL, HANDLE_WORLD[1]];
  const face = scene.getActorFaceAt(hx, hy);
  assert.ok(face, `nothing at all under the handle at screen (${hx}, ${hy})`);
  assert.equal(face.owner.name, 'a_KotHurd',
    `handle click landed on ${face.owner.name}`);
});

ok('every pixel of the door belongs to the door, not to Mamma or the barrels', () => {
  const { scene, a } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  const b = a.hurd.currentFace.bounds;
  const wrong = new Map();
  for (let y = b.y; y < b.y + b.height; y += 5) {
    for (let x = b.x; x < b.x + b.width; x += 5) {
      const f = scene.getActorFaceAt(x, y);
      const nm = f?.owner?.name ?? '<none>';
      if (nm !== 'a_KotHurd') wrong.set(nm, (wrong.get(nm) ?? 0) + 1);
    }
  }
  assert.equal(wrong.size, 0,
    `door pixels swallowed by ${[...wrong].map(([k, v]) => `${k}x${v}`).join(', ')}`);
});

ok('the three occluders keep their own hitboxes, at the right place', () => {
  const { scene, a } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  // Actor.updateFace: physX - collisionWidth/2, physY - collisionDepth.
  const at = (name, x, y) => {
    const f = scene.getActorFaceAt(x, y);
    assert.equal(f?.owner?.name, name,
      `screen (${x}, ${y}) gave ${f?.owner?.name} instead of ${name}`);
  };
  // Each probe is inside exactly one of the three rectangles.
  // a_Mamma: 213x328 at world (520-106, 450-328) = (414, 122)..(627, 450).
  at('a_Mamma', 450 - MAX_SCROLL, 200);
  // a_KotTunnur1: 189x133 at world (595, 242)..(784, 375); right of Mamma and
  // right of the barrel.
  at('a_KotTunnur1', 770 - MAX_SCROLL, 250);
  // a_Tunna: 127x164 at world (700-64, 420-144) = (636, 276)..(763, 440);
  // below the KotTunnur1 strip.
  at('a_Tunna', 700 - MAX_SCROLL, 400);
});

ok('z-order still decides overlaps: the nearer actor wins', () => {
  // Java Scene.getActorFaceAt keeps the LAST match walking the chain toward the
  // front, and ActorFace.compareTo orders by Actor.getZOrder() == location.y.
  // a_Tunna (y=420) is in front of a_KotTunnur1 (y=242); where they overlap,
  // a_Tunna takes the click. No smallest-area or per-pixel rule exists in 1999.
  const { scene } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  // world (700, 300) is inside both hotspots. -> screen (300, 300)
  const f = scene.getActorFaceAt(700 - MAX_SCROLL, 300);
  assert.equal(f.owner.name, 'a_Tunna');
});

ok('a scrolling==false terrain does not move with the viewport', () => {
  // t_Corners carries the state icon, the small inventory and the subtitle
  // line. The old paint-time translate slid all three off the left edge.
  const { scene, a } = kot();
  const before = { ...a.states.currentFace.bounds };
  scene.setScrollPosition(MAX_SCROLL, 0);
  const after = a.states.currentFace.bounds;
  assert.equal(after.x, before.x, 'HUD drifted with the scroll');
  assert.equal(after.y, before.y);
  assert.equal(after.x, 0);
  assert.equal(after.y, 0); // y=1000, z=1000 -> physY 0
  assert.equal(scene.getActorFaceAt(20, 20)?.owner?.name, 'a_States');
});

ok('an unscrolled scene is unchanged — bounds are world and screen at once', () => {
  const { scene, a } = kot();
  assert.equal(scene.scrollX, 0);
  assert.equal(a.hurd.currentFace.bounds.x, 996);
  // ...and off an 800px canvas, which is exactly why the room scrolls.
  assert.equal(scene.getActorFaceAt(770, 250)?.owner?.name, 'a_KotTunnur1');
});

ok('every scroll step re-lays-out the scene, and only when it changes', () => {
  const { scene, a } = kot();
  const door = a.hurd.currentFace;
  for (const s of [0, 30, 120, 300, MAX_SCROLL]) {
    scene.setScrollPosition(s, 0);
    assert.equal(door.bounds.x, 996 - s, `stale bounds at scroll ${s}`);
  }
  // Clamped past the right edge, and a no-op call must not shift anything.
  scene.setScrollPosition(9999, 0);
  assert.equal(scene.scrollX, MAX_SCROLL);
  assert.equal(door.bounds.x, 996 - MAX_SCROLL);
});

ok('entering the scene re-places faces against the scroll it kept', () => {
  const { scene, a } = kot();
  scene.setScrollPosition(MAX_SCROLL, 0);
  scene.offStage();
  // Something happens off stage: the door swaps to a differently sized face.
  a.hurd.addState('open', hotspot('af_OpinHurd', 197, 463), null, 0, 0, 0);
  a.hurd.setState('open');
  scene.onStage();
  assert.equal(a.hurd.currentFace.bounds.x, 996 - MAX_SCROLL);
});

console.log(`\n  ${n} passed`);
