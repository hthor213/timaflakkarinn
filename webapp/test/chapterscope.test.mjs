// Chapter name scoping.
//
// The regression: every chapter's GML was parsed into one container that was
// never cleared, and every by-name lookup — performSequence above all — read
// out of it. Forward-only play never noticed, because each chapter's parse
// overwrote the previous one's names just before they were needed. Returning to
// a chapter you had already visited ran the *other* chapter's sequences.
//
// The 1999 engine also used a single Hashtable, but emptied it at every screen
// transition (Timaflakkarinn.clearContainer -> hashtable.clear(), then
// parseStoryPage re-parses the .gml from disk), so exactly one chapter's names
// existed at any moment. The port kept the container and dropped the clear.
// This is therefore a port bug, and the fix restores the 1999 guarantee — one
// chapter's names visible at a time — without paying for the re-parse.
//
// These cases run the real GMLParser over the real 1998 chapter files. Nothing
// here is a fixture: the collision census, the sequence contents and the
// cross-chapter reference audit are all read off the shipped content.
import assert from 'node:assert/strict';
import { build } from 'esbuild';
import { pathToFileURL, fileURLToPath } from 'node:url';
import { mkdtempSync, readFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const GML_DIR = fileURLToPath(new URL('../../web_import/gml/', import.meta.url));
const MAIN = ['landnam', 'kristnit', 'sidaskip', 'tyrkran'];
const ALL = ['intro', ...MAIN, 'extro'];

// ---------------------------------------------------------------------------
// Enough DOM for GMLParser to run under node, and no more.
//
// The GML is simple XML by construction — verified across all six files: no
// CDATA, no entity references, no element text content, and no '<' or '>'
// inside any attribute value. So a tag tokenizer is a faithful reader of it,
// not an approximation.
// ---------------------------------------------------------------------------
class El {
  constructor(tagName, attrs) {
    this.tagName = tagName;
    this.nodeName = tagName;
    this.attrs = attrs;
    this.children = [];
    this.textContent = '';
  }
  getAttribute(n) { return n in this.attrs ? this.attrs[n] : null; }
  hasAttribute(n) { return n in this.attrs; }
  *descendants() {
    for (const c of this.children) { yield c; yield* c.descendants(); }
  }
  getElementsByTagName(tag) {
    return [...this.descendants()].filter(e => e.tagName === tag);
  }
  querySelector(tag) {
    for (const e of this.descendants()) if (e.tagName === tag) return e;
    return null;
  }
}

function parseXML(text) {
  const src = text.replace(/<!--[\s\S]*?-->/g, '');
  const root = new El('#doc', {});
  const stack = [root];
  const TAG = /<(\/?)([A-Za-z0-9_]+)((?:\s+[A-Za-z0-9_]+\s*=\s*"[^"]*")*)\s*(\/?)>/g;
  for (const m of src.matchAll(TAG)) {
    const [, closing, tag, attrText, selfClose] = m;
    if (closing) { stack.pop(); continue; }
    const attrs = {};
    for (const a of attrText.matchAll(/([A-Za-z0-9_]+)\s*=\s*"([^"]*)"/g)) attrs[a[1]] = a[2];
    const el = new El(tag, attrs);
    stack[stack.length - 1].children.push(el);
    if (!selfClose) stack.push(el);
  }
  return {
    documentElement: root.children[0],
    querySelector: () => null,
  };
}

globalThis.DOMParser = class { parseFromString(t) { return parseXML(t); } };
globalThis.TextDecoder = globalThis.TextDecoder;
globalThis.fetch = async (url) => {
  const file = join(GML_DIR, url.split('/').pop());
  const buf = readFileSync(file);
  return { ok: true, arrayBuffer: async () => buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteLength) };
};
// TextActorFace.setText measures against a canvas; node has no document.
globalThis.document = {
  createElement: () => ({
    getContext: () => ({ set font(_v) {}, measureText: t => ({ width: t.length * 11 }) }),
  }),
};

const out = join(mkdtempSync(join(tmpdir(), 'tt-')), 'c.mjs');
await build({
  stdin: {
    contents: `
      export { GMLParser } from './src/engine/GMLParser';
      export { ChapterScopes } from './src/game/ChapterScopes';
      export { Sequence } from './src/engine/Sequence';
      export { Actor } from './src/engine/Actor';
    `,
    resolveDir: process.cwd(),
    loader: 'ts',
  },
  bundle: true, format: 'esm', outfile: out, logLevel: 'silent',
});
const { GMLParser, ChapterScopes, Sequence, Actor } = await import(pathToFileURL(out));

let n = 0;
const ok = async (d, f) => { await f(); n++; console.log('  ok  ' + d); };

// ---------------------------------------------------------------------------
// Parse every chapter for real, each into its own scope, recording every name
// the parser asked for and did not find.
// ---------------------------------------------------------------------------
const scopes = new ChapterScopes();
const misses = {};       // chapter -> Set of names looked up but not declared
const CHAPTER_ID = Object.fromEntries(ALL.map((c, i) => [c, i]));

{
  const quiet = console.log, quietWarn = console.warn;
  console.log = () => {}; console.warn = () => {};
  try {
    for (const ch of ALL) {
      const objects = scopes.open(CHAPTER_ID[ch]);
      const missed = new Set();
      misses[ch] = missed;
      const parser = new GMLParser({}, { pulser: {} }, '', '');
      parser.setContainer({
        objects,
        get: (name) => {
          const v = objects.get(name);
          if (v === undefined && name !== '') missed.add(name);
          return v;
        },
        put: (name, obj) => { objects.set(name, obj); },
      });
      await parser.parseGMLFile(ch);
    }
  } finally { console.log = quiet; console.warn = quietWarn; }
}

/** The quantum names a sequence actually holds, in order. */
const quantumNames = seq => seq.quanta.map(q => q.gmlName);

// ---------------------------------------------------------------------------

await ok('all six chapters parse, and each into its own scope', () => {
  for (const ch of ALL) {
    const size = scopes.objects(CHAPTER_ID[ch]).size;
    assert.ok(size > 50, `${ch} produced only ${size} objects — did the parse run?`);
  }
  // No object may appear in two scopes: that is what "own scope" means.
  const owner = new Map();
  for (const ch of ALL) {
    for (const obj of scopes.objects(CHAPTER_ID[ch]).values()) {
      const prev = owner.get(obj);
      assert.equal(prev, undefined, `an object is shared between ${prev} and ${ch}`);
      owner.set(obj, ch);
    }
  }
});

// The census, measured off the shipped content by the same method as the fix's
// justification, so a future GML edit moves this number here rather than in
// play. `name` is excluded from the canonical form; everything else — every
// attribute and the whole child subtree — is compared.
await ok('the collision census: 111 shared container keys, 56 textual and 90 semantic', () => {
  const declared = {}, references = {};
  for (const ch of MAIN) {
    const text = readFileSync(join(GML_DIR, `${ch}.gml`), 'latin1');
    const doc = parseXML(text.replace(/<!DOCTYPE[^>]*>/g, ''));
    const d = new Map(), r = new Map();
    const canon = e => {
      const a = Object.entries(e.attrs).filter(([k]) => k !== 'name')
        .sort(([x], [y]) => (x < y ? -1 : 1)).map(([k, v]) => `${k}=${v}`).join(';');
      return `${e.tagName}[${a}]{${e.children.map(canon).join('|')}}`;
    };
    for (const e of doc.documentElement.children) {
      const name = e.getAttribute('name');
      if (name === null) continue;
      d.set(name, canon(e));
      // The parser registers two more kinds of key than the GML spells out.
      if (e.tagName === 'Text') d.set(name + '_face', canon(e));
      if (e.hasAttribute('collision')) d.set(e.getAttribute('collision'), canon(e));
      // Every other name this declaration mentions: attribute values that are
      // themselves declared names, plus the <Quantum name=…> child references
      // that make up a sequence.
      const refs = new Set();
      const walk = (el, isRoot) => {
        for (const [k, v] of Object.entries(el.attrs)) {
          if (isRoot && k === 'name') continue;
          if (v !== name) refs.add(v);
        }
        el.children.forEach(c => walk(c, false));
      };
      walk(e, true);
      r.set(name, refs);
    }
    declared[ch] = d;
    references[ch] = r;
  }

  const shared = [...declared[MAIN[0]].keys()].filter(n => MAIN.every(ch => declared[ch].has(n)));
  const textual = shared.filter(n => new Set(MAIN.map(ch => declared[ch].get(n))).size > 1);
  assert.equal(shared.length, 111, `${shared.length} names shared by all four main chapters`);
  assert.equal(textual.length, 56, `${textual.length} of them differ in their own XML`);

  // The textual figure badly understates it. s_prepare is spelt identically in
  // all four chapters and is still a different sequence in each, because the
  // quanta it names are redefined per chapter. Close over that: a name differs
  // if its own XML differs, if it references a name that differs, or if it
  // references a name the four chapters do not all share.
  const sharedSet = new Set(shared);
  const differs = new Set(textual);
  for (const name of shared) {
    if (MAIN.some(ch => [...references[ch].get(name) ?? []]
        .some(ref => declared[ch].has(ref) && !sharedSet.has(ref)))) differs.add(name);
  }
  for (let changed = true; changed;) {
    changed = false;
    for (const name of shared) {
      if (differs.has(name)) continue;
      if (MAIN.some(ch => [...references[ch].get(name) ?? []].some(ref => differs.has(ref)))) {
        differs.add(name); changed = true;
      }
    }
  }
  assert.equal(differs.size, 90,
    `${differs.size} shared names resolve to something different depending on the chapter`);
  for (const name of ['s_begin', 's_always', 's_prepare', 's_final']) {
    assert.ok(differs.has(name), `${name} was scored identical across chapters`);
  }
  assert.equal(new Set(MAIN.map(ch => declared[ch].get('s_prepare'))).size, 1,
    's_prepare stopped being the textually-identical case that proves the point');
});

// The decisive case. Visit landnam, visit kristnit, come back to landnam.
await ok('returning to a chapter resolves that chapter\'s s_begin, not the last one parsed', () => {
  const landnam = scopes.objects(CHAPTER_ID.landnam).get('s_begin');
  const kristnit = scopes.objects(CHAPTER_ID.kristnit).get('s_begin');
  assert.ok(landnam instanceof Sequence && kristnit instanceof Sequence);
  assert.notDeepEqual(quantumNames(landnam), quantumNames(kristnit),
    'pick a name that actually differs, or this case proves nothing');

  scopes.current = CHAPTER_ID.landnam;      // A
  scopes.current = CHAPTER_ID.kristnit;     // B
  scopes.current = CHAPTER_ID.landnam;      // back to A
  assert.equal(scopes.lookup('s_begin'), landnam,
    'landnam ran kristnit\'s s_begin');
  assert.deepEqual(quantumNames(scopes.lookup('s_begin')), quantumNames(landnam));

  // …and the other direction, so this is not an artefact of parse order.
  scopes.current = CHAPTER_ID.kristnit;
  assert.equal(scopes.lookup('s_begin'), kristnit);
});

await ok('the same trip through one shared container returns the wrong sequence', () => {
  // What the old code did, reproduced: one map, last parse wins. This is the
  // bug, pinned, so the fix cannot be quietly undone.
  const shared = new Map();
  for (const ch of [CHAPTER_ID.landnam, CHAPTER_ID.kristnit]) {
    for (const [name, obj] of scopes.objects(ch)) shared.set(name, obj);
  }
  const landnam = scopes.objects(CHAPTER_ID.landnam).get('s_begin');
  assert.notEqual(shared.get('s_begin'), landnam,
    'the shared container happened to keep landnam — reproduction is not valid');
  assert.equal(shared.get('s_begin'), scopes.objects(CHAPTER_ID.kristnit).get('s_begin'));
});

// Strictness has to be free: if any chapter depended on a name another chapter
// declared, removing the fallback would have silently unbound it.
await ok('no chapter references a name another chapter declares', () => {
  // Every name the real parser asked for and did not find, across all six
  // files. There are three kinds and no others:
  //
  //  * action_look/take/talk/use — reactor *roles*, not objects. No file
  //    declares one; GMLParser.Reaction routes them to the StateController
  //    precisely when the container misses.
  //  * q_Ahvarerhjorleifur (landnam, in s_bless1) and s_Fjolin (tyrkran) —
  //    known content defects, declared in no file at all.
  //  * qh_TextToggi — a forward reference: s_EgHefSvolitidMerkilegt names it at
  //    kristnit.gml:3628, the UpdateQuantum that declares it is at 3811. The
  //    1999 TTParser is single-pass too, so that sequence was short one quantum
  //    in the shipped game as well. Same chapter, so scoping is not involved.
  const EXPECTED = new Set([
    'action_look', 'action_take', 'action_talk', 'action_use',
    'q_Ahvarerhjorleifur', 's_Fjolin', 'qh_TextToggi',
  ]);
  const declaredAnywhere = new Set();
  for (const ch of ALL) for (const name of scopes.objects(CHAPTER_ID[ch]).keys()) declaredAnywhere.add(name);

  for (const ch of ALL) {
    for (const name of misses[ch]) {
      assert.ok(EXPECTED.has(name), `${ch}.gml looks up ${name}, which it does not declare`);
      // The real point: with the sole exception of that one forward reference,
      // none of these resolve in a *different* chapter either — so removing the
      // fallback to a global union cannot have unbound anything that worked.
      if (name === 'qh_TextToggi') continue;
      assert.equal(declaredAnywhere.has(name), false,
        `${name} is declared in another chapter — strict scoping just unbound it`);
    }
  }
  assert.ok(misses.landnam.has('q_Ahvarerhjorleifur'), 'the known typo stopped being detected');
  assert.equal(misses.intro.size + misses.extro.size, 0);
  // The forward reference resolves inside its own chapter, just too late.
  assert.ok(scopes.objects(CHAPTER_ID.kristnit).has('qh_TextToggi'));
  assert.equal(scopes.lookup('qh_TextToggi', CHAPTER_ID.landnam), undefined);
});

await ok('the Thorshamar and the cross never needed a cross-chapter scope', () => {
  // The story's central object, and the thing a shared fallback scope would
  // have been built for. Both are declared in kristnit.gml and nowhere else,
  // and the trade happens inside that chapter (s_GuessCorrect).
  for (const name of ['a_Thorshamar', 'a_Kross']) {
    const homes = ALL.filter(ch => scopes.objects(CHAPTER_ID[ch]).has(name));
    assert.deepEqual(homes, ['kristnit'], `${name} is declared in ${homes.join(', ')}`);
    assert.ok(scopes.lookup(name, CHAPTER_ID.kristnit) instanceof Actor);
    assert.equal(scopes.lookup(name, CHAPTER_ID.landnam), undefined);
  }
});

await ok('a sequence in a chapter we have left is still reachable to be stopped', () => {
  // Deliberately unscoped, and the reason `all()` exists: stopAllSequences, the
  // Enter fast-forward and the debug active list must reach the loser of a name
  // collision, or a sequence performing in an abandoned chapter runs forever.
  scopes.current = CHAPTER_ID.kristnit;
  const landnamBegin = scopes.objects(CHAPTER_ID.landnam).get('s_begin');
  assert.equal(scopes.lookup('s_begin'), scopes.objects(CHAPTER_ID.kristnit).get('s_begin'));

  let found = false, total = 0;
  for (const [, obj] of scopes.all()) { total++; if (obj === landnamBegin) found = true; }
  assert.ok(found, 'landnam\'s s_begin is unreachable — it could never be stopped');
  // Every scope, de-duplicated by identity, and no chapter shares objects.
  const sum = ALL.reduce((a, ch) => a + scopes.objects(CHAPTER_ID[ch]).size, 0);
  assert.equal(total, sum);
});

await ok('an unparsed chapter resolves nothing rather than borrowing', () => {
  const fresh = new ChapterScopes();
  fresh.current = 99;
  assert.equal(fresh.lookup('s_begin'), undefined);
  assert.deepEqual([...fresh.values()], []);
  assert.equal(fresh.has(99), false);
  // Re-opening a chapter replaces its scope; a re-parse cannot merge with its
  // own ghost the way the shared container did.
  fresh.open(2).set('s_begin', 'first');
  assert.equal(fresh.lookup('s_begin', 2), 'first');
  fresh.open(2);
  assert.equal(fresh.lookup('s_begin', 2), undefined);
});

console.log(`\n  ${n} passed\n`);
