// A SpeechActorMouth with no recording must still show its subtitles.
//
// Three lines shipped that way in 1999 -- the voice edit was unfinished when the
// master left for Sony's UK pressing plant. The team accepted "displayed but not
// spoken". The port cleared the text the moment `finished` went true, which it
// does immediately when there is no audio buffer, turning that into "neither
// displayed nor spoken". A wait="true" sequence also raced straight past.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL } from 'node:url';
import { mkdtempSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'm.mjs');
await build({ entryPoints: ['src/engine/ActorMouth.ts'], bundle: true, format: 'esm', outfile: out, logLevel: 'silent' });
const { SpeechActorMouth } = await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

/** A mouth whose audio never loads, with a fake text face and pulser. */
function silentMouth(sentences) {
  const m = new SpeechActorMouth('m_test', '\\nowhere\\missing.wav');
  const face = { text: '', setText(t) { this.text = t; }, alignment: '' };
  m.setTextActorFace(face);
  m.textActor = { setLocation() {} };
  const reg = [];
  m.pulser = { register: (t) => reg.push(t), unregister: (t) => { const i = reg.indexOf(t); if (i >= 0) reg.splice(i, 1); } };
  for (const s of sentences) m.addSentence(s.text, s.time);
  m.loader = null;          // forces the no-audio path
  m.prepared = true;
  return { m, face, reg };
}

ok('a line with no audio still displays its first sentence', () => {
  const { m, face } = silentMouth([{ text: 'Afsakaðu, húsbóndi!', time: 0 }]);
  m.start();
  assert.equal(face.text, 'Afsakaðu, húsbóndi!', `showed "${face.text}"`);
});

ok('it does not report finished immediately', () => {
  const { m } = silentMouth([{ text: 'Afsakaðu, húsbóndi!', time: 0 }]);
  m.start();
  assert.equal(m.finished, false, 'finished at once — a wait=true sequence would race past');
});

ok('later sentences appear on their authored schedule', async () => {
  const { m, face } = silentMouth([
    { text: 'fyrsta', time: 0 },
    { text: 'önnur', time: 40 },
  ]);
  m.start();
  assert.equal(face.text, 'fyrsta');
  await new Promise(r => setTimeout(r, 90));
  m.pulse(90);
  assert.equal(face.text, 'önnur', `still showing "${face.text}"`);
});

ok('it finishes on its own clock and clears the text', async () => {
  const { m, face } = silentMouth([{ text: 'x', time: 0 }]);   // short text -> 1500ms floor
  m.start();
  let fired = false;
  m.onFinished = () => { fired = true; };
  await new Promise(r => setTimeout(r, 60));
  m.pulse(60);
  assert.equal(m.finished, false, 'finished far too early');
  m.startTime -= 5000;      // jump past the dwell
  m.pulse(16);
  assert.ok(fired, 'never fired onFinished — the sequence would hang');
  assert.equal(face.text, '', 'left the subtitle on screen');
});

ok('the dwell scales with how much there is to read', () => {
  const short = silentMouth([{ text: 'Nei!', time: 0 }]);
  const long  = silentMouth([{ text: 'Nú eru góð ráð dýr. Hvernig eigum við að komast yfir þetta stórfljót?', time: 0 }]);
  short.m.start(); long.m.start();
  assert.ok(long.m.silentDuration > short.m.silentDuration,
    `long ${long.m.silentDuration} should exceed short ${short.m.silentDuration}`);
});

console.log(`\n  ${n} passed`);
