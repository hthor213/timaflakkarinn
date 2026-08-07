// Pulse cadence. The accumulator must carry its remainder: zeroing it rounds
// every interval up to the next frame boundary, which drifts subtitles late
// against their audio and runs animations slow.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'p.mjs');
await build({ entryPoints: ['src/engine/Pulser.ts'], bundle: true, format: 'esm', outfile: out, logLevel: 'silent' });
const { Pulser } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

/** Count pulses over `ms` of wall time, fed in `frame`-sized steps. */
function pulses(interval, frame, ms) {
  const p = new Pulser();
  let count = 0;
  p.register({ pulse: () => count++, getPulseInterval: () => interval });
  for (let t = 0; t < ms; t += frame) p.update(frame);
  return count;
}

ok('50ms pulse at 60fps fires ~20x/sec, not ~15x', () => {
  const c = pulses(50, 16.7, 1000);
  assert.ok(c >= 19 && c <= 21, `got ${c}/sec, expected ~20 (zeroing gave ~15)`);
});

ok('cadence is independent of frame rate', () => {
  const at60 = pulses(50, 16.7, 5000);
  const at30 = pulses(50, 33.3, 5000);
  assert.ok(Math.abs(at60 - at30) <= 2, `60fps ${at60} vs 30fps ${at30} — should agree`);
});

ok('225ms animation frame holds its rate over 10s', () => {
  const c = pulses(225, 16.7, 10000);
  assert.ok(c >= 43 && c <= 45, `got ${c}, expected ~44`);
});

ok('a long stall does not bank a burst of catch-up pulses', () => {
  const p = new Pulser();
  let count = 0;
  p.register({ pulse: () => count++, getPulseInterval: () => 50 });
  p.update(9000);          // one enormous frame, under the 10s clamp
  const afterStall = count;
  p.update(16.7);
  assert.equal(count - afterStall, 0, 'fired a catch-up pulse after the stall');
});

ok('frozen pulser does not advance', () => {
  const p = new Pulser();
  let count = 0;
  p.register({ pulse: () => count++, getPulseInterval: () => 50 });
  p.freeze();
  for (let i = 0; i < 100; i++) p.update(16.7);
  assert.equal(count, 0);
});

console.log(`\n  ${n} passed`);
