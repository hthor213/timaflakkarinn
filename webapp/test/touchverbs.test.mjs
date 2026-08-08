// Touch input mode, and the verb-selection rules the bar depends on.
//
// The bar is a view: it must never offer a verb the controller would ignore,
// and it must never let a tap put the game somewhere doRightButton could not.
// Both halves are checked here against the real StateController, not a mock.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const dir = mkdtempSync(join(tmpdir(), 'tt-'));

const cfgOut = join(dir, 'cfg.mjs');
await build({ entryPoints: ['src/config.ts'], bundle: true, format: 'esm', outfile: cfgOut, logLevel: 'silent' });
const SC_CFG = await import(pathToFileURL(cfgOut));
const { resolveInput } = SC_CFG;

// ONE bundle for everything the game classes share. Bundling StateController
// and SentenceContainer as separate entry points gives two distinct copies of
// the class, and `terrain instanceof SentenceContainer` is then false for a
// container the test just built — a green-looking failure that says nothing
// about the code.
const scOut = join(dir, 'sc.mjs');
await build({
  stdin: {
    contents:
      `export * from './src/game/StateController';\n` +
      `export { SentenceContainer } from './src/game/SentenceContainer';\n` +
      `export { TextActorFace } from './src/engine/ActorFace';\n`,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: scOut, logLevel: 'silent',
});
const SC = await import(pathToFileURL(scOut));
const { StateController, MOVING, TAKING, LOOKING, TALKING, FREEZE, USING, CONVERSATING,
        SentenceContainer, TextActorFace } = SC;

let n = 0;
const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

// --- input detection -------------------------------------------------------

const loc = (href) => new URL(href);
const none = () => false;
const coarse = (q) => q === '(pointer: coarse)';
const noHover = (q) => q === '(hover: none)';

ok('a mouse is pointer mode',
  () => assert.equal(resolveInput(loc('https://tt.spliffdonk.com/chapter1'), none), 'pointer'));
ok('a coarse pointer is touch mode',
  () => assert.equal(resolveInput(loc('https://tt.spliffdonk.com/chapter1'), coarse), 'touch'));
ok('no hover alone is enough — the queries fail independently',
  () => assert.equal(resolveInput(loc('https://tt.spliffdonk.com/chapter1'), noHover), 'touch'));
ok('?touch=1 forces touch on a desktop',
  () => assert.equal(resolveInput(loc('https://tt-dev.spliffdonk.com/?touch=1'), none), 'touch'));
ok('?touch=0 forces pointer on a phone',
  () => assert.equal(resolveInput(loc('https://tt-dev.spliffdonk.com/?touch=0'), coarse), 'pointer'));
ok('?touch and ?debug are independent axes',
  () => assert.equal(resolveInput(loc('https://tt.spliffdonk.com/?debug=1&touch=1'), none), 'touch'));

// --- canvas subtitles ------------------------------------------------------
//
// 1998 painted subtitles, so a browser paints them. A phone does not, because
// the readable strip under the picture is the subtitle there.
const { resolveCanvasSubtitles } = SC_CFG;
const mem = (v) => { const m = { v }; return {
  getItem: () => m.v ?? null, setItem: (_k, val) => { m.v = val; }, read: () => m.v }; };

ok('a browser paints them by default — 1998 did', () => {
  assert.equal(resolveCanvasSubtitles('pointer', loc('https://tt.spliffdonk.com/'), mem(null)), true);
});
ok('a phone never paints them, whatever is stored', () => {
  assert.equal(resolveCanvasSubtitles('touch', loc('https://tt.spliffdonk.com/'), mem('1')), false);
});
ok('?subs=0 turns them off in a browser', () => {
  assert.equal(resolveCanvasSubtitles('pointer', loc('https://tt.spliffdonk.com/?subs=0'), mem(null)), false);
});
ok('a stored "off" is honoured on a later load', () => {
  assert.equal(resolveCanvasSubtitles('pointer', loc('https://tt.spliffdonk.com/'), mem('0')), false);
});
ok('?subs=0 is remembered', () => {
  const store = mem(null);
  resolveCanvasSubtitles('pointer', loc('https://tt.spliffdonk.com/?subs=0'), store);
  assert.equal(store.read(), '0');
});
ok('?subs=1 does not override a phone', () => {
  assert.equal(resolveCanvasSubtitles('touch', loc('https://tt.spliffdonk.com/?subs=1'), mem(null)), false);
});
ok('missing localStorage (Safari private mode) still defaults on', () => {
  assert.equal(resolveCanvasSubtitles('pointer', loc('https://tt.spliffdonk.com/'), null), true);
});

// --- the verb rules --------------------------------------------------------

// Enough of a controller to exercise the rules. The state actor only has to own
// a states map and accept setState; nothing here paints.
function makeSC({ playerCanMove = true } = {}) {
  const face = () => ({ setLocation() {}, alignment: '' });
  const actorish = (states) => ({
    states: new Map(states.map(s => [s, {}])),
    currentStateName: 'stand',
    setState() {}, addState() {}, setLocation() {}, stopMoving() {},
    currentFace: face(),
  });
  const world = { currentScene: null, setCurrentScene() {} };
  const stateActor = actorish(['moving', 'taking', 'looking', 'talking', 'freeze', 'using']);
  const sc = new StateController(world, stateActor, actorish([]), actorish([]));
  sc.mainActor = actorish(playerCanMove ? ['stand'] : []);
  return sc;
}

ok('all four verbs are choosable in ordinary play', () => {
  const sc = makeSC(); sc.setState(MOVING);
  for (const v of StateController.VERBS) assert.equal(sc.canSetVerb(v), true, `verb ${v}`);
});

ok('setVerb picks directly rather than cycling', () => {
  const sc = makeSC(); sc.setState(MOVING);
  sc.setVerb(TALKING);
  assert.equal(sc.getState(), TALKING);   // the cycle would have given TAKING
});

ok('FREEZE refuses every verb — a cut-scene owns the controller', () => {
  const sc = makeSC(); sc.setState(FREEZE);
  for (const v of StateController.VERBS) assert.equal(sc.canSetVerb(v), false, `verb ${v}`);
  sc.setVerb(LOOKING);
  assert.equal(sc.getState(), FREEZE);
});

ok('CONVERSATING refuses every verb', () => {
  const sc = makeSC(); sc.setState(CONVERSATING);
  for (const v of StateController.VERBS) assert.equal(sc.canSetVerb(v), false, `verb ${v}`);
});

ok('a player with no face for its movement state cannot be told to walk', () => {
  const sc = makeSC({ playerCanMove: false }); sc.setState(TAKING);
  assert.equal(sc.canSetVerb(MOVING), false);
  sc.setVerb(MOVING);
  assert.equal(sc.getState(), TAKING);
  // ...but the other three still work, so the bar is not dead
  assert.equal(sc.canSetVerb(LOOKING), true);
});

ok('nonsense verbs are refused', () => {
  const sc = makeSC(); sc.setState(MOVING);
  for (const v of [FREEZE, USING, CONVERSATING, -1, 99]) {
    assert.equal(sc.canSetVerb(v), false, `verb ${v}`);
  }
});

ok('choosing a verb while holding an item returns it to the inventory', () => {
  const sc = makeSC(); sc.setState(MOVING);
  let returned = null, repositioned = 0;
  const item = { setTerrain(t) { returned = t; }, states: new Map() };
  const inv = { updatePositions() { repositioned++; } };
  sc.inventoryTerrain = inv;
  sc.setStateUsing(item);
  assert.equal(sc.getState(), USING);
  sc.setVerb(LOOKING);
  assert.equal(sc.getState(), LOOKING);
  assert.equal(returned, inv, 'item was not put back — it would be attached to nothing');
  assert.equal(repositioned, 1);
});

ok('the change hook fires so the bar can follow state it did not set', () => {
  const sc = makeSC(); sc.setState(MOVING);
  let fired = 0;
  sc.onStateChanged = () => { fired++; };
  sc.setVerb(LOOKING);
  assert.equal(fired, 1);
  sc.setState(FREEZE);          // the game freezing, not the player tapping
  assert.equal(fired, 2);
});

ok('a refused tap fires nothing', () => {
  const sc = makeSC(); sc.setState(FREEZE);
  let fired = 0;
  sc.onStateChanged = () => { fired++; };
  sc.setVerb(LOOKING);
  assert.equal(fired, 0);
  assert.equal(sc.getState(), FREEZE);
});

ok('with the inventory open only Taka and Skoða are offered', () => {
  const sc = makeSC(); sc.setState(MOVING);
  sc.inventoryScene = { name: 'inv', onStage() {}, offStage() {} };
  sc.actorClicked(sc.inventoryActor, 0);          // open the bag
  assert.equal(sc.isInventoryOn(), true);
  assert.equal(sc.canSetVerb(TAKING), true);
  assert.equal(sc.canSetVerb(LOOKING), true);
  assert.equal(sc.canSetVerb(MOVING), false, 'walking inside the bag means nothing');
  assert.equal(sc.canSetVerb(TALKING), false);
  sc.setVerb(MOVING);
  assert.notEqual(sc.getState(), MOVING);
  // and the same pair doRightButton toggles between there
  const before = sc.getState();
  sc.doRightButton();
  assert.ok([TAKING, LOOKING].includes(sc.getState()));
  assert.notEqual(sc.getState(), before);
});

ok('opening the inventory notifies, even when the state does not change', () => {
  const sc = makeSC(); sc.setState(TAKING);       // already TAKING, so no setState on open
  sc.inventoryScene = { name: 'inv', onStage() {}, offStage() {} };
  let fired = 0;
  sc.onStateChanged = () => { fired++; };
  sc.actorClicked(sc.inventoryActor, 0);
  assert.equal(sc.isInventoryOn(), true);
  assert.ok(fired >= 1, 'bar would still be offering all four verbs');
});

// --- dialogue options offered to the touch list ----------------------------

// A line as the game builds one: an actor in a SentenceContainer whose face
// carries the text. measureText needs a canvas, which node has not got, so the
// text is set on the field directly -- the query reads .text, not the metrics.
function line(text) {
  const face = new TextActorFace('t');
  face.text = text;
  return {
    name: text, currentFace: face,
    location: { x: 50, y: 1170, z: 800 },
    setLocation(x, y, z) { this.location = { x, y, z }; },
  };
}

function conversation(texts) {
  const sc = makeSC();
  const container = new SentenceContainer('sc_talk');
  container.actors = texts.map(line);
  sc.world.currentScene = { name: 's', terrains: [container], onStage() {}, offStage() {} };
  sc.setState(CONVERSATING);
  return { sc, container };
}

ok('the visible options are reported, in stacking order', () => {
  const { sc } = conversation(['Hvað er um að vera?', 'Hvar erum við?', 'Bless!']);
  assert.deepEqual(sc.getVisibleSentences().map(s => s.text),
    ['Hvað er um að vera?', 'Hvar erum við?', 'Bless!']);
});

ok('hidden options are not offered — hideAll parks them off-screen', () => {
  const { sc, container } = conversation(['Hvar erum við?', 'Bless!']);
  container.hideAll();
  assert.deepEqual(sc.getVisibleSentences(), [],
    'a container holds lines that are not currently on offer');
  container.showAll();
  assert.equal(sc.getVisibleSentences().length, 2);
});

ok('nothing is offered outside a conversation', () => {
  const { sc } = conversation(['Bless!']);
  sc.setState(MOVING);
  assert.deepEqual(sc.getVisibleSentences(), []);
});

ok('choosing a row is the same call a click on the canvas makes', () => {
  const { sc } = conversation(['Bless!']);
  const [{ actor }] = sc.getVisibleSentences();
  let ran = 0;
  sc.talkReactions.set(actor, { perform() { ran++; } });
  sc.actorClicked(actor, 0);           // exactly what SentenceList does
  assert.equal(ran, 1, 'the conversation sequence did not run');
});

ok('blank lines are skipped rather than rendered as empty rows', () => {
  const { sc } = conversation(['Bless!', '   ', '']);
  assert.deepEqual(sc.getVisibleSentences().map(s => s.text), ['Bless!']);
});

ok('VERBS is the same set, in the same order, that doRightButton cycles', () => {
  assert.deepEqual(StateController.VERBS, [MOVING, TAKING, LOOKING, TALKING]);
  const sc = makeSC(); sc.setState(MOVING);
  const seen = [sc.getState()];
  for (let i = 0; i < 3; i++) { sc.doRightButton(); seen.push(sc.getState()); }
  assert.deepEqual(seen, StateController.VERBS);
});

console.log(`\n  ${n} passed`);
