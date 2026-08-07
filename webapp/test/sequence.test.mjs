// The freeze gate, ported from Java Sequence.run()/thaw()/stopPerforming().
//
// A hung sequence is the worst failure this engine has: no error, no log, no
// recovery but reload — the same shape as the Völva soft-lock and the five
// non-terminating walks. So the gate is pinned here rather than trusted.
//
// Java parks the sequence THREAD inside `synchronized (freezeLock)` and wakes
// it with `notifyAll()`; `frozen` is owned by freeze()/thaw() alone, and
// stopPerforming() only raises a `stopping` flag the run loop reads. The port
// diverged on that last point: its stop cleared `frozen`, so a stop — including
// the implicit one when a performing sequence is re-performed — silently thawed
// the sequence and ran quanta that should have stayed parked.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 's.mjs');
await build({ entryPoints: ['src/engine/Sequence.ts'], bundle: true,
  format: 'esm', outfile: out, logLevel: 'silent' });
const { Sequence } = await import(pathToFileURL(out));

let n = 0; const ok = async (d, f) => { await f(); n++; console.log('  ok  ' + d); };

// Sequence.perform() only ever logs through the pulser's clock.
const ctx = () => ({ container: new Map(), world: { pulser: { elapsed: 0 } }, fastForward: false });

/** Let every pending microtask and timer callback run. */
const settle = () => new Promise(r => setTimeout(r, 5));

/** A quantum that records that it ran. */
const mark = (log, tag) => ({
  async execute() { log.push(tag); },
  async tunnel() { log.push(tag + ':tunnel'); },
  finish() {},
});

/** A quantum that blocks until released — a speech line, a pause, a walk. */
const blocking = () => {
  let release;
  return {
    q: {
      execute: () => new Promise(r => { release = r; }),
      tunnel: async () => {},
      finish() {},
    },
    release: () => release?.(),
  };
};

const frozenSequence = (name, log, tags) => {
  const s = new Sequence(name);
  for (const t of tags) s.addQuantum(mark(log, t));
  s.freeze();
  return s;
};

await ok('a frozen sequence runs nothing, and a thaw releases it', async () => {
  const log = [];
  const s = frozenSequence('s_a', log, ['a1', 'a2']);
  s.perform(ctx());
  await settle();
  assert.deepEqual(log, [], 'ran while frozen');
  s.thaw();
  await settle();
  assert.deepEqual(log, ['a1', 'a2'], 'did not resume on thaw');
});

await ok('stopping a frozen sequence does not thaw it', async () => {
  const log = [];
  const s = frozenSequence('s_b', log, ['b1']);
  s.perform(ctx());
  await settle();
  s.stopPerforming();
  s.perform(ctx());
  await settle();
  // In 1999 `frozen` is owned by the world-wide freeze/thaw pair, never by a
  // stop. Clearing it here let one sequence escape a freeze the whole world
  // was still under.
  assert.deepEqual(log, [], `ran after a stop while still frozen: ${log}`);
  s.thaw();
  await settle();
  assert.deepEqual(log, ['b1'], 'lost the run entirely');
});

await ok('re-performing a frozen sequence does not run it', async () => {
  const log = [];
  const s = frozenSequence('s_c', log, ['c1']);
  s.perform(ctx());   // parks at the gate
  s.perform(ctx());   // restart: stops the parked run, then parks its own
  await settle();
  assert.deepEqual(log, [], `restart escaped the freeze: ${log}`);
  s.thaw();
  await settle();
  assert.deepEqual(log, ['c1'], 'the restarted run never resumed');
});

await ok('a stop releases a parked run instead of stranding its promise', async () => {
  // Every run is a promise somebody may await — SubSequenceQuantum with
  // wait="true" is exactly that. A parked run that is never released is a hang
  // in the calling sequence, not just a paused one.
  const s = frozenSequence('s_d', [], ['d1']);
  let settled = false;
  s.perform(ctx()).then(() => { settled = true; });
  await settle();
  assert.equal(settled, false, 'should still be parked at the gate');
  s.stopPerforming();
  await settle();
  assert.equal(settled, true, 'stopped run never settled — its caller waits forever');
});

await ok('one thaw releases every sequence frozen together', async () => {
  // The 1999 shape: World.freeze() broadcasts a FreezeEvent to every parsed
  // sequence at once (GMLParser.java:1774), and thaw() notifyAll()s them back.
  const log = [];
  const all = ['e1', 'e2', 'e3'].map((t, i) => frozenSequence(`s_e${i}`, log, [t]));
  for (const s of all) s.perform(ctx());
  await settle();
  assert.deepEqual(log, []);
  for (const s of all) s.thaw();
  await settle();
  assert.deepEqual(log.sort(), ['e1', 'e2', 'e3'], 'a thaw stranded a parked run');
});

await ok('a freeze landing on the heels of a thaw re-parks the run', async () => {
  // Why the gate is a `while` and not Java's `if`: the flag has to be re-read
  // after waking, or a freeze raised between the thaw and the resumption is
  // simply ignored and the sequence runs on.
  const log = [];
  const s = frozenSequence('s_f', log, ['f1']);
  s.perform(ctx());
  await settle();
  s.thaw();
  s.freeze();          // same tick, before the parked run resumes
  await settle();
  assert.deepEqual(log, [], `ran despite being frozen again: ${log}`);
  s.thaw();
  await settle();
  assert.deepEqual(log, ['f1']);
});

await ok('a freeze mid-quantum holds the next one until thaw', async () => {
  const log = [];
  const s = new Sequence('s_g');
  const slow = blocking();
  s.addQuantum(slow.q);
  s.addQuantum(mark(log, 'g2'));
  s.perform(ctx());
  await settle();
  s.freeze();
  slow.release();
  await settle();
  assert.deepEqual(log, [], 'ran the next quantum despite the freeze');
  s.thaw();
  await settle();
  assert.deepEqual(log, ['g2']);
});

console.log(`\n  ${n} passed`);
