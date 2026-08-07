// Green subtitle flash at the top of the screen.
//
// RGB(0,255,0) is the transparency key everywhere in this engine
// (AssetLoader.applyChromaKey strips it from every sprite), so text authored in
// it drew as nothing in 1999 — that was how you hid a text actor. The port
// resolved r/g/b into a literal colour and painted green text at the subtitle
// position, y~30, for the whole of every line the speaker said.
//
// The first fix keyed off the r/g/b attributes and so covered a_Karli_acc
// (landnam.gml:1632) only. a_Halldora_acc (tyrkran.gml:473) writes the same
// colour as color="green", took the named-colour branch, and kept flashing.
// The test is therefore on the RESOLVED colour, and the last case walks the
// shipped content so a third spelling cannot slip through unnoticed.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL, fileURLToPath } from 'node:url';
import { mkdtempSync, readFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

// One bundle: the paint check needs the same TextActorFace the parser marks.
const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'g.mjs');
await build({
  stdin: {
    contents: `
      export { GMLParser, isChromaKey, resolveTextColor } from './src/engine/GMLParser';
      export { TextActorFace } from './src/engine/ActorFace';
    `,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
});
const { GMLParser, isChromaKey, resolveTextColor, TextActorFace } =
  await import(pathToFileURL(out));

let n = 0; const ok = async (d, f) => { await f(); n++; console.log('  ok  ' + d); };

// TextActorFace.setText measures against a canvas; node has no document.
globalThis.document = {
  createElement: () => ({
    getContext: () => ({
      set font(_v) {},
      measureText: (t) => ({ width: t.length * 11 }),
    }),
  }),
};

/** A 2D context that records what was painted. */
function recordingContext() {
  const calls = [];
  return {
    calls,
    set font(_v) {}, set textBaseline(_v) {},
    set fillStyle(v) { this._fill = v; },
    get fillStyle() { return this._fill; },
    fillText(text, x, y) { calls.push({ op: 'fillText', text, x, y, fill: this._fill }); },
    fillRect(x, y, w, h) { calls.push({ op: 'fillRect', x, y, w, h, fill: this._fill }); },
  };
}

function faceFor(color) {
  const f = new TextActorFace('a_test_acc_face');
  f.color = color;
  f.transparent = isChromaKey(color);
  f.setText('Hvað er um að vera?');
  f.setLocation(400, 30);
  return f;
}

await ok('both authoring syntaxes resolve to the same chroma key', () => {
  const viaRGB = resolveTextColor('', 0, 255, 0);          // a_Karli_acc
  const viaName = resolveTextColor('green', 255, 255, 255); // a_Halldora_acc
  assert.deepEqual(viaRGB, { r: 0, g: 255, b: 0 });
  assert.deepEqual(viaName, { r: 0, g: 255, b: 0 },
    'color="green" must resolve to the key, or the named branch escapes the check');
  assert.ok(isChromaKey(viaRGB) && isChromaKey(viaName));
});

await ok('every other authored subtitle colour stays visible', () => {
  // The near-misses matter: three accumulators are genuinely green-ish and must
  // keep painting. a_Ymsir_acc, a_Oddur_acc, a_kristofer_acc.
  const keep = [
    ['', 74, 156, 14], ['', 8, 168, 56], ['', 10, 146, 90],
    ['', 216, 0, 28], ['', 0, 254, 0], ['', 1, 255, 0], ['', 0, 255, 1],
    ['white', 255, 255, 255], ['yellow', 0, 0, 0], ['red', 0, 0, 0],
    ['cyan', 0, 0, 0], ['blue', 0, 0, 0],
  ];
  for (const [name, r, g, b] of keep) {
    const c = resolveTextColor(name, r, g, b);
    assert.equal(isChromaKey(c), false,
      `${name || `${r},${g},${b}`} was keyed out and would go invisible`);
  }
});

/** Drive the real parser over one <Text> element and hand back its face. */
async function parseText(attrs) {
  const parser = new GMLParser({}, { pulser: null }, '', '');
  const el = {
    tagName: 'Text',
    getAttribute: (k) => (k in attrs ? String(attrs[k]) : null),
    getElementsByTagName: () => [],
  };
  const quiet = console.log;
  console.log = () => {};                    // parseElement traces every element
  try { await parser.parseElement(el); } finally { console.log = quiet; }
  return parser.container.get(attrs.name + '_face');
}

// The two real declarations, attribute for attribute. This is the case that
// pins the production path: decision function plus the parser branch that
// applies it.
await ok('the parser hides both chroma-keyed accumulators', async () => {
  const karli = await parseText({                       // landnam.gml:1632
    name: 'a_Karli_acc', terrain: 't_Corners', text: ' ',
    r: 0, g: 255, b: 0, hilite: 'false',
  });
  const halldora = await parseText({                    // tyrkran.gml:473
    name: 'a_Halldora_acc', terrain: 't_Corners', text: ' ',
    color: 'green', hilite: 'false',
  });
  assert.equal(karli.transparent, true, 'a_Karli_acc paints green again');
  assert.equal(halldora.transparent, true,
    'a_Halldora_acc paints green — color="green" escaped the check');
});

await ok('the parser leaves every other accumulator visible', async () => {
  const vifill = await parseText({                      // landnam.gml:1021
    name: 'a_Vifill_acc', terrain: 't_Corners', text: ' ',
    color: 'white', hilite: 'false',
  });
  const ymsir = await parseText({                       // kristnit.gml:328
    name: 'a_Ymsir_acc', terrain: 't_Corners', text: ' ',
    r: 74, g: 156, b: 14, hilite: 'false',
  });
  assert.equal(vifill.transparent, false);
  assert.equal(ymsir.transparent, false, 'a dark-green subtitle went invisible');
  assert.deepEqual(ymsir.color, { r: 74, g: 156, b: 14 });
});

await ok('a chroma-keyed subtitle paints nothing at all', () => {
  const ctx = recordingContext();
  faceFor(resolveTextColor('green', 255, 255, 255)).paint(ctx, {});
  assert.equal(ctx.calls.length, 0,
    `green subtitle painted ${ctx.calls.length} time(s) — the flash is back`);
});

await ok('a normal subtitle still paints, outline and all', () => {
  const ctx = recordingContext();
  faceFor(resolveTextColor('white', 0, 0, 0)).paint(ctx, {});
  const drawn = ctx.calls.filter(c => c.op === 'fillText');
  assert.equal(drawn.length, 5, 'four outline passes plus the fill');
  assert.ok(drawn.some(c => c.fill === 'rgb(255,255,255)'), 'white text was not drawn');
});

// Every <Text> the game actually ships, through the real parser. The previous
// fix was correct and incomplete because it was verified against a grep for
// g="255"; this walks the content instead of sampling it.
await ok('no green pixel reaches the canvas from any subtitle in the game', async () => {
  const gmlDir = fileURLToPath(new URL('../../web_import/gml/', import.meta.url));
  const chapters = ['intro', 'landnam', 'kristnit', 'sidaskip', 'tyrkran', 'extro'];
  const keyed = [];
  let texts = 0;
  let declared = 0;

  for (const ch of chapters) {
    // ISO-8859-1 with CRLF: reading as utf8 mangles the Icelandic letters.
    const gml = readFileSync(join(gmlDir, `${ch}.gml`), 'latin1');
    // Every declaration, however written — so a Text element wrapped across
    // lines (as most SimplePseudo3DTerrains are) cannot slip past the walk
    // below and be scored as clean by not being looked at.
    declared += (gml.match(/<Text[\s>]/g) ?? []).length;
    for (const [el] of gml.matchAll(/<Text\s[^>]*>/g)) {
      texts++;
      const attrs = Object.fromEntries(
        [...el.matchAll(/\b([A-Za-z0-9_]+)="([^"]*)"/g)].map(m => [m[1], m[2]]));
      const face = await parseText(attrs);
      face.setText(attrs.text || ' ');   // the authored text is a placeholder space
      face.setLocation(400, 30);
      const ctx = recordingContext();
      face.paint(ctx, {});
      const green = ctx.calls.some(c => c.fill === 'rgb(0,255,0)');
      assert.equal(green, false, `${ch}.gml ${attrs.name} paints chroma green`);
      if (face.transparent) keyed.push(`${ch}:${attrs.name}`);
    }
  }

  assert.equal(texts, declared,
    `scanned ${texts} of ${declared} Text elements — the rest were never checked`);
  assert.ok(texts > 100, `only ${texts} Text elements found — did the files load?`);
  // Census, so a future content edit that adds a third hidden accumulator shows
  // up here rather than in play.
  assert.deepEqual(keyed, ['landnam:a_Karli_acc', 'tyrkran:a_Halldora_acc'],
    `chroma-keyed text actors changed: ${keyed.join(', ')}`);
});

console.log(`\n  ${n} passed\n`);
