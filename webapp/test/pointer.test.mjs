// Input binding. The engine listened for mousemove/mousedown only, so a phone
// got no game at all — and because handleMouseDown read the coordinates that
// only mousemove ever wrote, the first tap resolved at (0,0) and every later
// one wherever the previous tap had left the pointer.
//
// Pointer Events unify mouse, touch and pen behind one path. What these cases
// pin is where a tap lands: the normalisation into the fixed 800x600 logical
// space (which is what lets the canvas be CSS-scaled), the ordering of
// enter/click, and the browser gestures that would otherwise eat the tap.
//
// Out of scope on purpose: the affordance. Hover turns the cursor red to show
// what is interactive and touch has no hover; restoring that needs a design
// decision, not a bug fix.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'w.mjs');
await build({
  stdin: {
    contents: `
      export { World } from './src/engine/World';
      export { Scene } from './src/engine/Scene';
    `,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
});
const { World, Scene } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

// World binds keydown on window; nothing here fires one.
globalThis.window = { addEventListener() {} };

/** A canvas that records its listeners and reports a CSS box we control. */
function fakeCanvas(rect = { left: 0, top: 0, width: 800, height: 600 }) {
  const listeners = new Map();
  return {
    style: {},
    listeners,
    addEventListener(type, fn) {
      if (!listeners.has(type)) listeners.set(type, []);
      listeners.get(type).push(fn);
    },
    getBoundingClientRect: () => rect,
    getContext: () => ({ imageSmoothingEnabled: true, fillRect() {}, set fillStyle(_v) {} }),
  };
}

function fire(canvas, type, event) {
  const bound = canvas.listeners.get(type);
  assert.ok(bound?.length, `nothing is listening for ${type} — touch input is unbound`);
  for (const fn of bound) fn(event);
}

/** A touch by default: it is the case the mouse path was hiding. */
const at = (x, y, extra = {}) =>
  ({ clientX: x, clientY: y, button: 0, pointerType: 'touch', preventDefault() {}, ...extra });

/** A hotspot the size and shape of a real TransparentActorFace. */
function hotspot(name, x, y, w, h) {
  const owner = { name, entered: 0, exited: 0, clicked: 0 };
  owner.onEntered = () => owner.entered++;
  owner.onExited = () => owner.exited++;
  owner.onClicked = () => owner.clicked++;
  return {
    owner,
    bounds: { x, y, width: w, height: h },
    contains: (px, py) => px >= x && px < x + w && py >= y && py < y + h,
    getZOrder: () => y,
    paint() {},
  };
}

function worldWith(faces, rect) {
  const canvas = fakeCanvas(rect);
  const world = new World(canvas);
  const scene = new Scene('s_test');
  for (const f of faces) scene.addFace(f);
  world.setCurrentScene(scene);
  return { world, canvas, scene };
}

ok('a first tap resolves where the finger is, not at (0,0)', () => {
  const { world, canvas } = worldWith([]);
  const seen = [];
  world.onMouseClicked = (x, y, button) => seen.push([x, y, button]);
  fire(canvas, 'pointerdown', at(410, 380));
  assert.deepEqual(seen, [[410, 380, 0]], 'the tap did not carry its own coordinates');
  assert.equal(world.mouseX, 410);
  assert.equal(world.mouseY, 380);
});

ok('a tap hits the actor under the finger', () => {
  const hjorleifur = hotspot('a_Hjorleifur', 566, 508, 123, 82);
  const { world, canvas } = worldWith([hjorleifur]);
  const clicked = [];
  world.onActorClicked = (actor, button) => clicked.push([actor.name, button]);

  fire(canvas, 'pointerdown', at(600, 540));
  assert.deepEqual(clicked, [['a_Hjorleifur', 0]]);

  fire(canvas, 'pointerup', at(600, 540));
  fire(canvas, 'pointerdown', at(100, 100));   // empty ground
  assert.equal(clicked.length, 1, 'a tap on empty ground hit the previous target');
});

ok('a tap enters the actor before clicking it', () => {
  // A mouse always moves onto a face before pressing, so every actor gets its
  // onEntered first. A finger does not move, and the pair has to stay honest:
  // an exit that was never entered is what leaves text stuck bold.
  const karli = hotspot('a_Karli', 300, 300, 100, 100);
  const { world, canvas } = worldWith([karli]);
  const order = [];
  world.onActorEntered = (a) => order.push('enter:' + a.name);
  world.onActorClicked = (a) => order.push('click:' + a.name);

  fire(canvas, 'pointerdown', at(350, 350));
  assert.deepEqual(order, ['enter:a_Karli', 'click:a_Karli']);
  assert.equal(karli.mouseOver, true, 'hilite state was never set');
});

ok('lifting a finger clears the hover; a mouse keeps it', () => {
  const karli = hotspot('a_Karli', 300, 300, 100, 100);
  const { world, canvas } = worldWith([karli]);

  fire(canvas, 'pointerdown', at(350, 350));
  fire(canvas, 'pointerup', at(350, 350));
  assert.equal(karli.owner.exited, 1, 'a lifted finger left the actor hovered forever');
  assert.equal(karli.mouseOver, false);

  // The mouse still physically hovers after a click, so releasing must not
  // clear it — otherwise every click un-highlights what it just clicked.
  fire(canvas, 'pointermove', at(350, 350, { pointerType: 'mouse' }));
  fire(canvas, 'pointerdown', at(350, 350, { pointerType: 'mouse' }));
  fire(canvas, 'pointerup', at(350, 350, { pointerType: 'mouse' }));
  assert.equal(karli.owner.exited, 1, 'a mouse click cleared its own hover');
  assert.equal(karli.mouseOver, true);
});

ok('taps map through a CSS-scaled canvas', () => {
  // Play mode fits the canvas to the viewport while the backing store stays
  // 800x600 — a phone is always in this case.
  const target = hotspot('a_Hus', 400, 300, 100, 100);
  const { world, canvas } = worldWith([target], { left: 0, top: 0, width: 400, height: 300 });
  const clicked = [];
  world.onActorClicked = (a) => clicked.push(a.name);

  fire(canvas, 'pointerdown', at(225, 175));   // half-scale: logical (450, 350)
  assert.equal(world.mouseX, 450);
  assert.equal(world.mouseY, 350);
  assert.deepEqual(clicked, ['a_Hus']);
});

ok('a tap outside the canvas box is clamped into the scene', () => {
  const { world, canvas } = worldWith([]);
  fire(canvas, 'pointerdown', at(-40, 9000));
  assert.equal(world.mouseX, 0);
  assert.equal(world.mouseY, 599);
});

ok('the drawn cursor follows the tap', () => {
  // The canvas is `cursor: none` — the game draws its own, so it has to be
  // moved by the same event that resolves the hit.
  const { world, canvas, scene } = worldWith([]);
  const seen = [];
  scene.cursorFace = { setLocation: (x, y) => seen.push([x, y]) };
  fire(canvas, 'pointerdown', at(120, 240));
  assert.deepEqual(seen.at(-1), [120, 240]);
});

ok('the browser is not left to claim taps as gestures', () => {
  // touch-action must be off or the browser holds the tap for panning,
  // pinch-zoom and double-tap-zoom and delivers pointerdown late or not at all.
  const { canvas } = worldWith([]);
  assert.equal(canvas.style.touchAction, 'none');
});

ok('the right button still cycles verbs, menu suppressed', () => {
  const { world, canvas } = worldWith([]);
  const seen = [];
  world.onMouseClicked = (x, y, button) => seen.push(button);
  fire(canvas, 'pointerdown', at(400, 300, { pointerType: 'mouse', button: 2 }));
  assert.deepEqual(seen, [2], 'the right button no longer reaches the verb cycle');

  let prevented = false;
  fire(canvas, 'contextmenu', { preventDefault: () => { prevented = true; } });
  assert.ok(prevented, 'the browser context menu would open on every verb change');
});

ok('moving still tracks hover, as the mouse always did', () => {
  const a = hotspot('a_One', 0, 0, 100, 100);
  const b = hotspot('a_Two', 200, 200, 100, 100);
  const { world, canvas } = worldWith([a, b]);
  const trail = [];
  world.onActorEntered = (x) => trail.push('in:' + x.name);
  world.onActorExited = (x) => trail.push('out:' + x.name);

  fire(canvas, 'pointermove', at(50, 50, { pointerType: 'mouse' }));
  fire(canvas, 'pointermove', at(250, 250, { pointerType: 'mouse' }));
  fire(canvas, 'pointermove', at(700, 500, { pointerType: 'mouse' }));
  assert.deepEqual(trail, ['in:a_One', 'out:a_One', 'in:a_Two', 'out:a_Two']);
});

console.log(`\n  ${n} passed`);
