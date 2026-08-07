// Frame-advance behaviour, ported from Java CelledAnimated2DActorFace.
// A one-shot animation must REST ON ITS LAST FRAME. Wrapping to frame 0
// visibly un-does the action — Ingólfur snapping back to an upright
// öndvegissúla after throwing it overboard.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'a.mjs');
await build({ entryPoints: ['src/engine/ActorFace.ts'], bundle: true,
  format: 'esm', outfile: out, logLevel: 'silent' });
const { AnimatedActorFace } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

/** Drive an animation and record which frame is shown at each tick. */
function run(frames, repeats, ticks) {
  const f = new AnimatedActorFace('t', 'p', frames, 100, repeats);
  let finished = false;
  f.onAnimationFinished = () => { finished = true; };
  f.reset();
  const seen = [f.currentFrame];
  for (let i = 0; i < ticks; i++) { f.pulse(100); seen.push(f.currentFrame); }
  return { seen, finished, face: f };
}

ok('one-shot rests on the LAST frame, not frame 0', () => {
  const { seen, finished } = run(10, 1, 12);
  assert.equal(seen.at(-1), 9, `ended on frame ${seen.at(-1)}, expected 9`);
  assert.ok(finished, 'should have fired onAnimationFinished');
});

ok('one-shot never wraps back to 0 after the last frame', () => {
  const { seen } = run(10, 1, 12);
  const last9 = seen.indexOf(9);
  assert.ok(last9 !== -1, 'never reached the final frame');
  assert.ok(seen.slice(last9).every(v => v === 9), `wrapped after finishing: ${seen.join(',')}`);
});

ok('frame 0 gets its own interval (dontAdvance)', () => {
  const { seen } = run(10, 1, 3);
  assert.deepEqual(seen.slice(0, 3), [0, 0, 1], `got ${seen.slice(0,3).join(',')}`);
});

ok('every frame is shown exactly once', () => {
  const { seen } = run(10, 1, 12);
  for (let i = 0; i < 10; i++) assert.ok(seen.includes(i), `frame ${i} never shown`);
});

ok('infinite animation loops and never finishes', () => {
  const { seen, finished } = run(4, -1, 20);
  assert.ok(!finished, 'infinite animation must not fire finished');
  assert.ok(seen.filter(v => v === 0).length > 2, 'should have wrapped repeatedly');
});

ok('repeat=4 plays four passes then holds the last frame', () => {
  const { seen, finished } = run(3, 4, 40);
  assert.equal(seen.at(-1), 2, `ended on ${seen.at(-1)}, expected 2`);
  assert.ok(finished);
});

console.log(`\n  ${n} passed`);
