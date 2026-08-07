// Debug flow-tree scene jumping.
//
// The regression: clicking a scene ran s_always + s_prepare and switched the
// world to it. Both prepare sequences are PrepareQuantums end to end — they
// load faces and place nobody — so the jump raised the background over an empty
// terrain. In play, arrival always runs more: landnam.gml's
// s_Ingolfshofdi2Hjorleifshofdi attaches vifill and karli to t_Hjorleifshofdil,
// sets f_CurrentScene, and walks them to their marks.
//
// These cases pin the two pure halves of the fix: choosing the sequence the
// game itself uses to arrive, and keeping only its state-establishing quantums.
// The fixtures mirror landnam.gml's real shapes.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

// One bundle, so `instanceof` holds between the fixtures and the code under
// test. Separate bundles would give each its own copy of every class.
const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'j.mjs');
await build({
  stdin: {
    contents: `
      export { findArrivalSequence, arrivalScore, stateQuanta, isStateQuantum }
        from './src/game/Timaflakkarinn';
      export * from './src/engine/Quantums';
      export { Sequence, ConditionFlag } from './src/engine/Sequence';
      export { Scene } from './src/engine/Scene';
      export { Terrain } from './src/engine/Terrain';
      export { Actor, MovingActor } from './src/engine/Actor';
    `,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
});
const M = await import(pathToFileURL(out));
const {
  findArrivalSequence, arrivalScore, stateQuanta, isStateQuantum,
  MoveActorQuantum, MoveTerrainQuantum, SetFlagQuantum, SetDestinationQuantum,
  SwitchSceneQuantum, SwitchStateQuantum, PauseQuantum, PrepareQuantum,
  Sequence, ConditionFlag, Scene, Terrain, MovingActor,
} = M;

let n = 0;
const ok = async (d, f) => { await f(); n++; console.log('  ok  ' + d); };

/** A scene with one walkable terrain, as every playable scene has. */
function sceneWith(name, terrainName) {
  const scene = new Scene(name);
  const terrain = new Terrain(terrainName);
  scene.addTerrain(terrain);
  return { scene, terrain };
}

const seq = (name, quanta) => {
  const s = new Sequence(name);
  for (const q of quanta) s.addQuantum(q);
  return s;
};

await ok('a prepare-only sequence never wins the arrival slot', async () => {
  const { scene, terrain } = sceneWith('s_Hjorleifshofdi', 't_Hjorleifshofdil');
  const vifill = new MovingActor('vifill');
  // sp_Hjorleifshofdi88's real shape: prepare, then show. Populates nothing.
  const prepare = seq('sp_Hjorleifshofdi88', [
    new PrepareQuantum({ prepare: async () => {}, unprepare: () => {} }, true),
    new SwitchSceneQuantum(scene),
  ]);
  const travel = seq('s_Ingolfshofdi2Hjorleifshofdi', [
    new SwitchSceneQuantum(scene),
    new MoveActorQuantum(vifill, 845, 290, 0, terrain),
  ]);
  const pick = findArrivalSequence([prepare, travel], scene);
  assert.equal(pick?.name, 's_Ingolfshofdi2Hjorleifshofdi');
});

await ok('the chapter\'s own <From>2<To> travel sequence outranks a cutscene', async () => {
  const { scene, terrain } = sceneWith('s_Hjorleifshofdi', 't_Hjorleifshofdil');
  const vifill = new MovingActor('vifill');
  const karli = new MovingActor('karli');
  // s_fundumhjorleif also arrives here, but drags puzzle flags along.
  const cutscene = seq('s_fundumhjorleif', [
    new SwitchSceneQuantum(scene),
    new MoveActorQuantum(vifill, 845, 290, 0, terrain),
    new MoveActorQuantum(karli, 950, 290, 0, terrain),
    new SetFlagQuantum(new ConditionFlag('f_GolliMoved'), 1),
    new SetFlagQuantum(new ConditionFlag('f_HjorleifurFound'), 1),
  ]);
  const travel = seq('s_Ingolfshofdi2Hjorleifshofdi', [
    new SwitchSceneQuantum(scene),
    new MoveActorQuantum(vifill, 845, 290, 0, terrain),
  ]);
  // The cutscene scores higher on both moveInto and kept; travel still wins.
  assert.ok(arrivalScore(cutscene, scene).kept > arrivalScore(travel, scene).kept);
  assert.equal(findArrivalSequence([cutscene, travel], scene)?.name,
    's_Ingolfshofdi2Hjorleifshofdi');
});

await ok('a travel name with a variant digit still reads as travel', async () => {
  const { scene, terrain } = sceneWith('s_Kaetan', 't_Kaetan');
  const vifill = new MovingActor('vifill');
  // tyrkran.gml really does name this one s_Dekkid2Kaetan1.
  const s = seq('s_Dekkid2Kaetan1', [
    new SwitchSceneQuantum(scene),
    new MoveActorQuantum(vifill, 10, 20, 0, terrain),
  ]);
  assert.equal(arrivalScore(s, scene).travel, true);
});

await ok('travel naming without arrivals is not enough', async () => {
  // s_To<Scene>44 fades in a close-up and moves nobody. Scoring it as travel
  // on the name alone would let it beat a sequence that actually populates.
  const { scene, terrain } = sceneWith('s_Innihellir', 't_Innihellir');
  const vifill = new MovingActor('vifill');
  const fade = seq('s_ToInnihellir44', [new SwitchSceneQuantum(scene)]);
  const real = seq('s_TakeSprunga', [
    new SwitchSceneQuantum(scene),
    new MoveActorQuantum(vifill, 100, 200, 0, terrain),
  ]);
  assert.equal(arrivalScore(fade, scene).travel, false);
  assert.equal(findArrivalSequence([fade, real], scene)?.name, 's_TakeSprunga');
});

await ok('no sequence switching to the scene reports null, not a guess', async () => {
  const { scene } = sceneWith('s_Nowhere', 't_Nowhere');
  const other = sceneWith('s_Elsewhere', 't_Elsewhere');
  const s = seq('s_Somewhere2Elsewhere', [new SwitchSceneQuantum(other.scene)]);
  assert.equal(findArrivalSequence([s, 'not a sequence', 42], scene), null);
});

await ok('only the four state quantums are replayed', async () => {
  const { scene, terrain } = sceneWith('s_Hjorleifshofdi', 't_Hjorleifshofdil');
  const vifill = new MovingActor('vifill');
  const conv = new Terrain('conv_karli');
  const flag = new ConditionFlag('f_CurrentScene');
  const keep = [
    new MoveActorQuantum(vifill, 845, 290, 0, terrain),
    new MoveTerrainQuantum(conv, scene),
    new SetFlagQuantum(flag, 2),
    new SetDestinationQuantum(vifill, 310, 450, true),
  ];
  const drop = [
    new SwitchSceneQuantum(scene),
    new SwitchStateQuantum({ setState() {} }, 0),
    new PauseQuantum(4000),
    new PrepareQuantum({ prepare: async () => {}, unprepare: () => {} }, true),
  ];
  for (const q of keep) assert.ok(isStateQuantum(q), `${q.constructor.name} should be kept`);
  for (const q of drop) assert.ok(!isStateQuantum(q), `${q.constructor.name} should be dropped`);
  // Order is the authored order, not the whitelist order.
  const s = seq('s_arrive', [drop[0], keep[0], drop[2], keep[3], keep[2]]);
  assert.deepEqual(stateQuanta(s), [keep[0], keep[3], keep[2]]);
});

await ok('replaying leaves the player on the terrain, on his mark', async () => {
  // The regression, end to end over the pure half: before the fix the scene
  // came up with vifill still attached to wherever he was last.
  const { scene, terrain } = sceneWith('s_Hjorleifshofdi', 't_Hjorleifshofdil');
  const elsewhere = sceneWith('s_Ingolfshofdi', 't_Ingolfshofdil');
  const vifill = new MovingActor('vifill');
  const karli = new MovingActor('karli');
  vifill.setTerrain(elsewhere.terrain);
  karli.setTerrain(elsewhere.terrain);
  const flag = new ConditionFlag('f_CurrentScene');

  const arrival = seq('s_Ingolfshofdi2Hjorleifshofdi', [
    new PauseQuantum(4000),                                    // q_4sec
    new MoveActorQuantum(vifill, 845, 290, 0, terrain),         // enters at the edge
    new MoveActorQuantum(karli, 950, 290, 0, terrain),
    new SwitchSceneQuantum(scene),                              // q_ToHjorleifshofdi
    new SetFlagQuantum(flag, 2),                                // q_CurrentHjorleifshofdi
    new SetDestinationQuantum(karli, 400, 435, false, 70),      // q_WalkKarliHjorleifshofdi
    new SetDestinationQuantum(vifill, 310, 450, true),          // q_WalkVifillHjorleifshofdi
  ]);
  assert.equal(findArrivalSequence([arrival], scene), arrival);

  const ctx = {};
  for (const q of stateQuanta(arrival)) await q.tunnel(ctx);

  assert.equal(vifill.currentTerrain, terrain, 'vifill not attached to the scene terrain');
  assert.equal(karli.currentTerrain, terrain, 'karli not attached to the scene terrain');
  assert.equal(vifill.currentTerrain.scene, scene);
  // tunnel() on SetDestinationQuantum teleports to the mark rather than walking.
  assert.deepEqual([vifill.location.x, vifill.location.y], [310, 450]);
  assert.deepEqual([karli.location.x, karli.location.y], [400, 435]);
  assert.equal(vifill.isMoving(), false, 'player should be standing still and controllable');
  assert.equal(flag.value, 2, 'f_CurrentScene not set for the target scene');
});

console.log(`\n${n} scene-jump cases passed`);
