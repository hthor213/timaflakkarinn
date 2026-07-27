# The Tímaflakkarinn engine and the `.gml` scene format

GML is an XML format the original team developed to describe the gameplay; it
shipped readable on the CD. What follows describes how the current web engine
implements it, reverse-engineered from `web_import/assets/index-CXa83YST.js`
(the deployed, minified bundle) and the six chapter files in `web_import/gml/`.
Written 2026-07-26. See [ownership-and-provenance.md](ownership-and-provenance.md).

> The bundle is **build output, not source**. No source tree for the engine
> exists in this repository — see [project-state.md](project-state.md).

## 1. Runtime shape

A single ES module drives one `<canvas id="game-canvas">` at a fixed **800×600**
with `image-rendering: pixelated`. Bootstrap is:

```js
const a = new Game(canvas, "/GAME", "/gml");   // resourcePath, gmlBasePath
await a.start();
```

Everything else is data. The engine ships no game content of its own — with two
exceptions, both hardcoded: the mouse cursors `\common\bendill1` (normal) and
`\common\bendill2` (highlight). *"Bendill"* is Icelandic for cursor. These are
invisible to any tooling that derives asset paths from the `.gml` files, which
is how they went missing from the first archival capture.

The game waits for a click before starting, because audio playback needs a user
gesture.

### Chapters

Seven screen slots map to six `.gml` files (slot 0 and 1 are both `intro`):

| # | Chapter | File | Ends on |
|---|---|---|---|
| 0/1 | Intro | `intro` | `s_end → q_Fin` |
| 2 | Landnám | `landnam` | `s_blessingo → q_ThemeFin` |
| 3 | Kristnitaka | `kristnit` | `s_BeginConvHallur → q_ThemeFin` |
| 4 | Siðaskipti | `sidaskip` | `s_HannGaetiVeridHja → q_Fin` |
| 5 | Tyrkjaránið | `tyrkran` | `s_MakaEdalstein → q_Fin` |
| 6 | Extro | `extro` | `s_end → q_Fin → END` |

Chapters are parsed lazily. Starting one runs three sequences in order:
`s_always` → `s_prepare` → `s_begin`. Finishing runs `s_end` → `s_final`.
A `chapterGeneration` counter is bumped on every chapter switch and checked
between awaits, so sequences from an abandoned chapter cancel themselves rather
than writing into the new one.

### Asset resolution

```js
resolvePath(p) {
  p = p.replace(/\\/g, "/");        // GML uses DOS backslashes
  if (p.startsWith("/")) p = p.slice(1);
  p = p.toUpperCase();              // filesystem was case-insensitive
  if (!/\.\w+$/.test(p)) p += ".PNG";   // extension is optional in GML
  return `${basePath}/${p}`;        // basePath = "/GAME"
}
```

Two consequences worth knowing:

- Paths in the content are **DOS 8.3 short names** — directories longer than
  eight characters are truncated with a trailing `A`, e.g. `ANIMATIONS` →
  `ANIMATIA`, `TYRKJARANID` → `TYRKJARA`. The trailing `A` is not a typo.
- A failed image load is **not fatal**: `onerror` substitutes a 1×1 blank image
  and resolves normally. Missing art degrades silently instead of crashing,
  which is why the known-missing assets don't stop a playthrough.

Images pass through `applyChromaKey()` on load, which turns the key colour into
alpha. Transparency lives in the pipeline, not in the PNGs.

## 2. The `.gml` format

XML, **ISO-8859-1**, CRLF line endings, described by `gml/scene.dtd` (55 element
types). The engine strips the `<!DOCTYPE>` and parses with `DOMParser`; the DTD
is documentation and is never enforced at runtime.

Every element with a `name` goes into **one flat per-chapter namespace**. There
are no scopes and no imports — `name` collisions silently overwrite. References
between elements are just strings looked up in that map.

### The object model

```
Scene ── the screen. ScrollingScene adds width/height for larger-than-viewport rooms.
  └── SimplePseudo3DTerrain ── a walkable region: a Polygon plus zmin/zmax.
        Depth is faked by scaling actors between those bounds by their y position.
        └── Actor ── StaticActor or MovingActor (the latter has speed + pathing)
              └── State ── a named mode, each binding at most one Face and one Mouth
                    ├── Face  ── what it looks like
                    └── Mouth ── what it sounds like
```

**Faces** (visuals):

| Element | Meaning |
|---|---|
| `StaticActorFace` | one image |
| `TransparentActorFace` | an invisible box — hit-testing and text anchors |
| `CelledAnimated2DActorFace` | a **vertical sprite-sheet**: one PNG cut into `count` frames stacked top to bottom, `speed` ms each, `repeat` times (`-1` = forever) |
| `Animated2DActorFace` | declared in the DTD, never used, not implemented |

**Mouths** (audio):

| Element | Meaning |
|---|---|
| `JMFActorMouth` | a sound or music loop (`repeat="true"`). "JMF" is a leftover from the original Java Media Framework build |
| `SpeechActorMouth` | a voice line plus its subtitles: child `<Sentence text=".." time="..">` elements give the on-screen text and its timing in ms |

Switching an actor's state switches its picture and its sound together. That
one idea carries most of the game: a character talking is just an actor in a
state whose face is a mouth-flapping animation and whose mouth is the take.

If an actor's initial `state=` isn't declared, the engine **auto-creates an
empty one** rather than failing. This is the established idiom for "starts
invisible/silent" — 45 actors across the game rely on it.

### Control flow: Sequences and Quanta

A **Quantum** is one instruction. A **Sequence** is an ordered list of them,
run as an async chain that can be frozen, cancelled, or fast-forwarded.
Quanta are declared once at the top level and referenced by name, so the same
instruction can be reused across many sequences.

| Group | Elements |
|---|---|
| Scene/actor | `SwitchSceneQuantum`, `MoveActorQuantum`, `MoveTerrainQuantum`, `StopActorQuantum`, `SetDestinationQuantum`, `UpdateQuantum` |
| State | `StateQuantum`, `SwitchStateQuantum`, `PrepareQuantum` |
| Flags | `SetFlagQuantum`, `IncrementFlagQuantum`, `DecrementFlagQuantum`, `RandomSetFlagQuantum`, `CheckConditionQuantum` |
| Timing/AV | `PauseQuantum`, `FadeQuantum` |
| Meta | `ThemeFinishedQuantum`, `GuessQuantum` |

A naming convention runs through all the content, and it is worth internalising
before editing anything:

- `s_…` sequence, `q_…` quantum, `a_…` actor, `af_…` actor face, `m_…` mouth,
  `t_…` terrain, `p_…` polygon, `f_…` condition flag
- on a quantum that acts on a text/prop actor, the letter after `q_` is the
  verb: **`q_h…` = hide**, **`q_s…` = show**. They come in pairs:
  ```xml
  <MoveActorQuantum name="q_hhvarerhjorleifur" actor="hvarerhjorleifur"/>
  <MoveActorQuantum name="q_shvarerhjorleifur" actor="hvarerhjorleifur" terrain="conv_karli"/>
  ```
  "Show" means *move the actor onto a terrain*; "hide" means *move it off*.
  Visibility is position, not a flag.

**Branching** is `CheckConditionQuantum` over a `ConditionFlag`, dispatching to
a sequence per value:

```xml
<CheckConditionQuantum name="q_CheckRope" flag="f_HasRope">
  <Trigger value="0" seq="s_NoRope"/>
  <Trigger value="1" seq="s_HasRope"/>
</CheckConditionQuantum>
```

Flags default to `save="true"` and are the entire persistent game state.

### Player interaction

`StateController` binds the verb system together, wiring the cursor actor, the
inventory actor, the inventory scene and the text actor. Its modes are
`Moving=0, Taking=1, Looking=2, Talking=3, Freeze=4, Using=5, Conversating=6`.

- `ActorMoused` — per-verb hover descriptions for an actor.
- `Reaction` — binds *(verb, actor[, second actor])* to a sequence. `reactor` is
  one of the engine built-ins `action_look`, `action_take`, `action_talk`,
  `action_use`; these are **not** declared in GML.
- `UseText` — the phrasing for using one item on another. The engine keeps a
  `tholfall` (accusative-case) table so it can build grammatical Icelandic:
  *"Nota "* + accusative(item) + *" á "* + accusative(target).

Inventory is a 5-column grid laid out at `x = 55·(i mod 5) + 220`,
`y = 55·⌊i/5⌋ + 190`.

**Keyboard:** `Space` cycles the verb, `Enter` fast-forwards the running
sequences, `F1` is wired to a save/load menu that logs
`"Save/Load menu - not yet implemented"`.

### Debug panel

The engine builds its own overlay: a clickable chapter/scene flow tree that
calls `jumpToScene()`, a live sequence log, a clock, collision-box display, an
intro skip, and a freeze/unfreeze toggle. `index.html` reserves the space for it
(a 280 px right column and a 180 px bottom strip). It is extremely useful and it
is also why the shipped page devotes a third of the viewport to developer chrome.

## 3. Content scale

| | intro | landnam | kristnit | sidaskip | tyrkran | extro |
|---|---:|---:|---:|---:|---:|---:|
| lines | 286 | 4 625 | 5 313 | 6 446 | 7 131 | 323 |
| sequences | 4 | 202 | 210 | 264 | 317 | 5 |
| quantum refs | 122 | 1 466 | 1 653 | 1 772 | 2 210 | 170 |
| actors | 3 | 92 | 60 | 133 | 179 | 2 |
| named objects | 90 | 1 281 | 1 457 | 1 785 | 2 027 | 88 |

Totals: ~24 000 lines, 1 002 sequences, 7 393 quantum references, 469 actors,
707 voiced lines with 1 294 timed subtitles, 617 `Reaction` bindings and 104
condition flags. Media: 1 211 files, 188 MiB.

Every one of the 48 element types the content actually uses is implemented.
The seven declared-but-unused DTD elements (`Animated2DActorFace`, `Frame`,
`Frames`, `Image`, `Images`, `Fetch`, `SetSpeedQuantum`) are dead schema.
