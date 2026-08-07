// Green speckles on the 1998 sprites (docs/known-issues.md #4).
//
// The engine keyed on an EXACT RGB(0,255,0), and the disc art does not quite
// oblige: 116 pixels across 12 sprite sheets sit one palette step off pure
// green and so survived the key and painted as bright specks on moving
// characters.
//
// The cause is not anti-aliasing. Measured on the disc: the 12 sheets expose
// 73,336 backing-boundary pixels between artwork and key, and only 116 pixels
// anywhere are near-green — 0.16% coverage, where anti-aliasing would be near
// 100%. 66% of them are isolated single pixels and 85% do not touch the
// backing at all. What they are is stray green specks in the artwork, snapped
// by the 8-bit palette export onto a *second* near-green entry: 197 files
// carry an unused (4,244,4) at palette index 212 alongside the reserved
// (0,255,0) at index 254. So the right instrument is a slightly wider binary
// key, not alpha feathering — there is no coverage ramp to feather.
//
// The safety question is whether a wider key eats artwork that is genuinely
// green. It does not, with room to spare, and the last three cases hold that
// line against the real 545 PNGs rather than against a fixture.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL, fileURLToPath } from 'node:url';
import { mkdtempSync, readFileSync, readdirSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { inflateSync } from 'node:zlib';

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'k.mjs');
await build({
  stdin: {
    contents: `
      export { CHROMA_TOLERANCE, keyChromaPixels } from './src/engine/AssetLoader';
      export { isChromaKey } from './src/engine/GMLParser';
    `,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
});
const { CHROMA_TOLERANCE, keyChromaPixels, isChromaKey } =
  await import(pathToFileURL(out));

let n = 0; const ok = (d, f) => { f(); n++; console.log('  ok  ' + d); };

const KEY = [0, 255, 0];
const cheb = (r, g, b) => Math.max(Math.abs(r), Math.abs(g - 255), Math.abs(b));

/** RGBA buffer from a list of [r,g,b] triples, all opaque. */
const rgba = (px) => Uint8ClampedArray.from(px.flatMap(([r, g, b]) => [r, g, b, 255]));

// ---------------------------------------------------------------------------
// A minimal PNG reader. The whole disc tree is 8-bit non-interlaced, colour
// type 2 (11 files) or 3 (534), so this handles exactly that and throws on
// anything else rather than quietly mis-reading it.
// ---------------------------------------------------------------------------
function decodePNG(buf) {
  assert.equal(buf.readUInt32BE(0), 0x89504e47, 'not a PNG');
  let p = 8, ihdr = null, plte = null;
  const idat = [];
  while (p < buf.length) {
    const len = buf.readUInt32BE(p);
    const type = buf.toString('latin1', p + 4, p + 8);
    const body = buf.subarray(p + 8, p + 8 + len);
    if (type === 'IHDR') {
      ihdr = {
        w: body.readUInt32BE(0), h: body.readUInt32BE(4),
        depth: body[8], ctype: body[9], interlace: body[12],
      };
    } else if (type === 'PLTE') plte = body;
    else if (type === 'IDAT') idat.push(body);
    else if (type === 'IEND') break;
    p += 12 + len;
  }
  const { w, h, depth, ctype, interlace } = ihdr;
  assert.equal(depth, 8, 'unexpected bit depth');
  assert.equal(interlace, 0, 'unexpected interlacing');
  assert.ok(ctype === 2 || ctype === 3, `unexpected colour type ${ctype}`);

  const bpp = ctype === 2 ? 3 : 1;
  const stride = w * bpp;
  const raw = inflateSync(Buffer.concat(idat));
  const lines = Buffer.alloc(h * stride);

  for (let y = 0; y < h; y++) {
    const filter = raw[y * (stride + 1)];
    const src = y * (stride + 1) + 1;
    const dst = y * stride;
    const up = dst - stride;
    for (let x = 0; x < stride; x++) {
      const a = x >= bpp ? lines[dst + x - bpp] : 0;
      const b = y > 0 ? lines[up + x] : 0;
      const c = x >= bpp && y > 0 ? lines[up + x - bpp] : 0;
      let v = raw[src + x];
      if (filter === 1) v += a;
      else if (filter === 2) v += b;
      else if (filter === 3) v += (a + b) >> 1;
      else if (filter === 4) {
        const pa = Math.abs(b - c), pb = Math.abs(a - c), pc = Math.abs(a + b - 2 * c);
        v += pa <= pb && pa <= pc ? a : pb <= pc ? b : c;
      }
      lines[dst + x] = v & 255;
    }
  }

  const px = new Uint8ClampedArray(w * h * 4);
  for (let i = 0, o = 0; i < w * h; i++, o += 4) {
    if (ctype === 2) {
      px[o] = lines[i * 3]; px[o + 1] = lines[i * 3 + 1]; px[o + 2] = lines[i * 3 + 2];
    } else {
      const e = lines[i] * 3;
      px[o] = plte[e]; px[o + 1] = plte[e + 1]; px[o + 2] = plte[e + 2];
    }
    px[o + 3] = 255;
  }
  return { w, h, px };
}

function allPNGs(dir, acc = []) {
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    const p = join(dir, e.name);
    if (e.isDirectory()) allPNGs(p, acc);
    else if (e.name.toUpperCase().endsWith('.PNG')) acc.push(p);
  }
  return acc;
}

// ---------------------------------------------------------------------------

ok('the two drifted greens are keyed, the real art colours are not', () => {
  // Left of the line: the key itself and the two palette-drift greens actually
  // measured on the disc. Right of it: the nearest greens in the whole tree
  // that are not drift, ending with the bush foliage in RUNNI.PNG — the one
  // sprite that is both chroma-keyed and genuinely green.
  const key = [[0, 255, 0], [4, 252, 4], [4, 244, 4]];
  const keep = [
    [12, 236, 4],   // dist 19 — a speck in SVEFNHEA, a background with no backing
    [28, 228, 20],  // dist 28 — a speck on the driftwood in HJORLEIA
    [44, 228, 44],  // dist 44
    [60, 212, 4],   // dist 60 — RUNNI bush, nearest painted green to the key
    [84, 172, 68],  // dist 84 — HJORLEIA grass
    [74, 156, 14], [8, 168, 56], [10, 146, 90],  // the three green subtitles
  ];
  const buf = rgba([...key, ...keep]);
  assert.equal(keyChromaPixels(buf), true);
  key.forEach((c, i) =>
    assert.equal(buf[i * 4 + 3], 0, `${c} survived the key (dist ${cheb(...c)})`));
  keep.forEach((c, i) => {
    const a = buf[(key.length + i) * 4 + 3];
    assert.equal(a, 255, `${c} was keyed out (dist ${cheb(...c)}) — art is being eaten`);
  });
});

ok('an image with no key at all is reported unchanged', () => {
  // applyChromaKey short-circuits on this and skips a toDataURL round trip, so
  // a false positive here would cost 545 re-encodes.
  const buf = rgba([[84, 172, 68], [0, 0, 0], [255, 255, 255], [4, 132, 4]]);
  assert.equal(keyChromaPixels(buf), false);
});

// --- the disc art itself -----------------------------------------------------

const gameDir = fileURLToPath(new URL('../../web_import/GAME/', import.meta.url));
const files = allPNGs(gameDir).sort();

/** Per file: pixels at the exact key, extra pixels the tolerance adds, and
 *  every distinct colour within Chebyshev 96 of the key. */
const survey = files.map((f) => {
  const { w, h, px } = decodePNG(readFileSync(f));
  const colours = new Map();
  let exact = 0;
  for (let o = 0; o < px.length; o += 4) {
    const r = px[o], g = px[o + 1], b = px[o + 2];
    if (r === 0 && g === 255 && b === 0) { exact++; continue; }
    if (r <= 96 && g >= 159 && b <= 96) {
      const k = (r << 16) | (g << 8) | b;
      colours.set(k, (colours.get(k) ?? 0) + 1);
    }
  }
  const copy = px.slice();
  keyChromaPixels(copy);
  let keyed = 0;
  for (let o = 3; o < copy.length; o += 4) if (copy[o] === 0) keyed++;
  return {
    rel: f.slice(gameDir.length), px: w * h, exact, keyed, extra: keyed - exact, colours,
  };
});

ok(`all 12 speckled sprites are cleaned (${files.length} PNGs scanned)`, () => {
  assert.equal(files.length, 545, 'the asset tree changed size — re-measure #4');
  const hit = survey.filter((s) => s.extra > 0)
    .sort((a, b) => b.extra - a.extra).map((s) => `${s.extra} ${s.rel}`);
  // The exact census, so a content change that adds or loses a speckle is
  // visible here rather than in play. #4 estimated "118 px on 13 sprites"; the
  // measurement is 116 on 12, and the 13th file in that report is a background.
  assert.deepEqual(hit, [
    '41 TYRKJARA/ANIMATIA/BUNDNIRA/TALK.PNG',
    '23 TYRKJARA/ANIMATIA/TUNNALEA/TUNNALEA.PNG',
    '15 TYRKJARA/ANIMATIA/MAMMA/TALK.PNG',
    '11 KRISTNIA/ANIMATIA/HJALTI/FRONT.PNG',
    '8 TYRKJARA/ANIMATIA/SIGRUN/FRONT.PNG',
    '4 KRISTNIA/ANIMATIA/HALLUR/STOP.PNG',
    '4 TYRKJARA/ANIMATIA/SIGRUN/JAM.PNG',
    '3 TYRKJARA/ANIMATIA/SIGRUN/KLIFRAR.PNG',
    '2 KRISTNIA/ANIMATIA/HALLUR/LEFT.PNG',
    '2 KRISTNIA/ANIMATIA/HALLUR/RIGHT.PNG',
    '2 TYRKJARA/ANIMATIA/MAMMA/STOP.PNG',
    '1 TYRKJARA/ANIMATIA/SIGRUN/LEFT.PNG',
  ], 'the set of speckled sprites changed');
  assert.equal(hit.reduce((t, s) => t + Number(s.split(' ')[0]), 0), 116);
});

ok('no legitimate green art anywhere is keyed', () => {
  // Two independent guards. First: a file with no exact key has no chroma
  // backing, so every green in it is paint and keying one punches a hole in a
  // painting — 72 files, including the grass backgrounds and the Volva's hut.
  const holed = survey.filter((s) => s.exact === 0 && s.keyed > 0);
  assert.deepEqual(holed.map((s) => `${s.rel} (${s.keyed}px)`), [],
    'the key punched holes in artwork that never used a chroma backing');
  assert.equal(survey.filter((s) => s.exact === 0).length, 72);

  // Second: the adversarial case. RUNNI.PNG is a green bush shot against a
  // green key — legitimate green art and backing in one file. Its foliage must
  // survive intact.
  const runni = survey.find((s) => s.rel.endsWith('HJORLEIA/RUNNI.PNG'));
  assert.equal(runni.extra, 0, `${runni.extra}px of the bush was keyed away`);
  assert.ok(runni.exact > 10000, 'RUNNI lost its backing — wrong file?');
  const foliage = [...runni.colours.values()].reduce((a, b) => a + b, 0);
  assert.ok(foliage > 1000, `only ${foliage}px of near-green foliage — wrong file?`);
});

ok('the tolerance sits in an empty band, not on a knife edge', () => {
  // Every distance that actually occurs, so the choice of 16 can be checked
  // rather than trusted. If new or repaired art lands in the gap, this fails
  // and the number gets re-derived instead of silently becoming marginal.
  const dists = new Set();
  for (const s of survey) {
    for (const k of s.colours.keys()) {
      dists.add(cheb((k >> 16) & 255, (k >> 8) & 255, k & 255));
    }
  }
  const sorted = [...dists].sort((a, b) => a - b);
  const below = Math.max(...sorted.filter((d) => d <= CHROMA_TOLERANCE));
  const above = Math.min(...sorted.filter((d) => d > CHROMA_TOLERANCE));
  assert.equal(below, 11, `nearest keyed colour is at ${below}, expected the drift at 11`);
  assert.equal(above, 19, `nearest surviving colour is at ${above}, expected 19`);
  assert.ok(above - below >= 6,
    `only ${above - below} units of clearance around the threshold`);
  // And the nearest colour that is painted art rather than a stray speck.
  const art = Math.min(...survey.flatMap((s) =>
    [...s.colours.keys()].filter((k) => s.colours.get(k) >= 100)
      .map((k) => cheb((k >> 16) & 255, (k >> 8) & 255, k & 255))));
  assert.ok(art >= 60, `painted green art starts at distance ${art}, too close to ${CHROMA_TOLERANCE}`);
});

ok('widening the image key did not widen the text key', () => {
  // The boundary from #3: subtitle colour stays an EXACT match, because
  // a_Ymsir_acc / a_Oddur_acc / a_kristofer_acc are authored a real dark green
  // and must keep painting. A drifted green is keyed as a *pixel* and not as a
  // *colour*, and that asymmetry is deliberate.
  const drift = { r: 4, g: 252, b: 4 };
  assert.equal(isChromaKey(drift), false,
    'the image tolerance leaked into text colour resolution');
  assert.equal(isChromaKey({ r: 0, g: 255, b: 0 }), true);
  for (const c of [{ r: 74, g: 156, b: 14 }, { r: 8, g: 168, b: 56 }, { r: 10, g: 146, b: 90 }]) {
    assert.equal(isChromaKey(c), false, `subtitle ${JSON.stringify(c)} went invisible`);
  }
  const buf = rgba([[drift.r, drift.g, drift.b]]);
  keyChromaPixels(buf);
  assert.equal(buf[3], 0, 'the same colour must still be keyed as an image pixel');
});

ok('no image newly pays the re-encode round trip', () => {
  // applyChromaKey re-encodes through toDataURL() and a second Image decode,
  // which dominates its cost. Every file the tolerance newly touches already
  // contained exact-key pixels, so the number of re-encodes is unchanged.
  const before = survey.filter((s) => s.exact > 0).length;
  const after = survey.filter((s) => s.keyed > 0).length;
  assert.equal(before, 473);
  assert.equal(after, before, `${after - before} images newly re-encode at load`);
});

console.log(`\n  ${n} passed\n`);
