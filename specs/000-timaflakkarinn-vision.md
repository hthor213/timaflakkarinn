# 000 — Tímaflakkarinn: vision

Status: draft

Supersedes the Phase 1 framing in `docs/ownership-and-provenance.md`, which
described a faithful port. The ambition is larger than that document records.

## The frame: this is a remaster

Same song, played better. Not a port, not a remake.

Borrowed deliberately from record production, because the discipline transfers
exactly:

| Studio practice | Here |
|---|---|
| Remaster from the multitracks, never the vinyl | The WAV and PNG originals in LFS are the masters. Derived assets are always regenerable; masters are never written to |
| You don't re-record the drummer | The 1999 animation *is* the performance. Rigs derive from it; they don't replace it |
| The failure mode is the loudness war | Over-processing — AI over-smoothing, uncanny detail, style clash. "Improved" into worse is the specific risk to instrument against |
| Good remasters A/B constantly | A classic/remastered toggle is a build requirement, not a nice-to-have |

The toggle also resolves the ownership question. `docs/ownership-and-provenance.md`
makes open-sourcing conditional on the IP owners judging the rebuild faithful.
If the original is a switch rather than a casualty, the owners can judge by
flipping it.

## Decisions

**D1 — Characters become 3D, toon-shaded.**
Driven by one requirement: continuous turning. A 2D vector rig (Rive, Spine)
animates beautifully in-plane but cannot rotate a body through depth — it only
blends between fixed facings. Continuous turning, head/eye look-at, and
speed-dependent gait all require a skeleton in three dimensions. Flat ink-outline
art survives the trip: Guilty Gear Xrd, Hi-Fi Rush, Sable.

Rive was the leading candidate before this requirement was known. It is now
superseded for characters.

**D2 — Backgrounds are super-resolved paintings projected onto coarse proxy
geometry.**

Two distinct problems, deliberately solved by different means, because conflating
them leads to vectorizing:

**Resolution.** Sources are 800×600; a 4K display is a 4.8× upscale, and 3D
characters are resolution-independent by construction — crisp characters over a
soft background reads worse than uniform softness. Fixed by **AI
super-resolution to ~4×**, not by vectorization.

The backgrounds were painted digitally in Photoshop in 1998, so there is no
physical original to re-scan; enlargement can only be synthesised. (If the
original **PSDs** survive they are worth pursuing alongside the ISO: layered
files may already encode the foreground/background separation this decision is
otherwise reconstructing, possibly above 800×600.)

**Vector is the chosen direction — owner decision, 2026-08-07.** An earlier
revision of this document rejected it on cost and necessity. That is overruled,
on two grounds the owner stated:

1. **These are not physical paintings.** They were made in Photoshop in 1998, so
   there is no original artefact whose materiality is being lost. The
   "preserve the brushwork" framing was romanticism about a raster file.
2. **Erna signs off.** An approved image is approved regardless of how it was
   produced, which removes fidelity as the deciding argument.

So the plan is **vectorized backgrounds with rich textures, and 3D geometry where
it helps** — true resolution independence rather than a 4× ceiling, which also
ages better against the App Store and Google Play targets and whatever displays
those imply.

**The counter-argument is recorded, not suppressed**, because it may still cost
something: these are soft-shaded painterly images, which is the adversarial case
for tracing — unlike the character cels, which are flat with hard ink outlines.
Vectorizing them is closer to reinterpretation than enlargement, and the result
may look *different* rather than merely sharper. That is a question about the
output, not about principle, and it is cheap to settle: **vectorize one
background, place it beside the super-resolved version of the same frame, and let
Hjalti and Erna look at both.** Until that comparison exists, this decision is
made on reasoning rather than evidence.

**Erna's sign-off is a deploy gate.** No derived background ships without it.

**Depth.** Fixed by **coarse 3D proxy geometry per scene** — a ground plane, a few
vertical planes, the occasional box — with the super-resolved painting projected
on as texture. Deliberately not modelling; AI depth estimation supplies the
starting mesh. This supersedes an earlier flat depth-layer stack, because
geometry does not tear the way separated planes do under camera movement, which
retires the camera-drift budget as a constraint.

Three dividends from the one artifact:

1. Parallax and occlusion become real rather than card-shuffling
2. Rack focus (D3) gets true per-pixel depth
3. **It derives the 60 missing terrain calibrations** — an explicit ground plane
   *is* `scanline1`/`scanline2`/`scaling2`. See `docs/known-issues.md` #1;
   this turns 60 hand-tuned guesses into a computed value

Grim Fandango got depth for free because its backgrounds were pre-rendered from
3D. This reconstructs the geometry that was never there.

**Erna Geirsdottir painted these backgrounds. She approves the derived versions;
she does not produce them.** The distinction is deliberate and load-bearing.

The production loop is: Hjalti creates the art, AI-assisted first pass (via the
`ai-dev` skill across Gemini and ChatGPT) → he brings it to Erna → feedback →
revision → she signs off. She runs a pottery business full time and will not be
drawing. She loves the game and is glad to review anything put in front of her,
and her approval is expected rather than at risk.

So this is a **quality gate, not a capacity constraint** — do not design the
pipeline around her throughput, and do not treat her sign-off as a scheduling
risk. It is the authority behind D4's safe-area rule rather than a substitute for
it: the rule guarantees nothing invented is load-bearing, and she confirms that
what was invented is *right*.

One consequence worth engineering for: **on depth, ask questions rather than
delivering piles.** A monocular model infers what is behind what; the person who
painted the scene knows. But that value is captured by surfacing only the regions
the model is least confident about — a handful of "is this rock in front of the
bank?" questions — not by handing her 304 depth maps to audit. Same information,
a fraction of her time, and it respects that reviewing is a pleasure for her only
so long as it stays one.

**D7 — Recreate per asset, not per scene. Characters and backgrounds are
different problems.** Owner decision, 2026-08-07.

The 1998 team already separated these, and that separation is what makes the
remaster tractable:

- **Characters are sprites**, composited at runtime at engine-controlled
  coordinates. Redrawing one breaks no hotspot, no polygon, no scaling. Each is
  done **once and reused in every scene** — ~46 characters, five of which carry
  ~40% of all animation cells.
- **And the player is one character, not four.** Owner, 2026-08-07: *"vifill,
  hjalti, and even the woman in tyrkjaran level — it's always the same character
  'Denni' (he was our chairman), the character stays the same, just wears
  different clothes and is called different names."* Confirmed in the art:
  `VIFILL`, `HJALTI` and `SIGRUN` share one face, build and hair colour and
  differ only in costume. **`GISSUR` is Denni too** — the bishop's mitre and
  vestments make the sprite look like a different person at 75px, but the owner
  confirmed it: *"always denni"*. The rule is simply **the character that walks
  when Moving is selected is always the protagonist.**

  Denni is the boy from the intro storybook, modelled on Dímon's chairman. The
  film opens with *"Einu sinni var strákur sem hét Denni"*; he puts on a necklace
  and travels back, then forward, then forward, until he gets home. The four
  names are the four eras he lands in. The necklace is the **Þórshamar** — the
  object the Völva trades the cross for in Kristnitaka, and the one the whole
  story turns on.

  So the protagonist is **one rig with costume variants**, not four rigs — a 4×
  reduction on the highest-value work in the project, and it restores the
  original "rig one character first" instinct that an earlier revision of this
  document wrongly retracted. The four turnaround sets are then *four views of
  the same character*: more identity reference for holding likeness, not four
  separate problems. **The binding constraint is likeness**: an
  AI reimagining of the ship scene produced excellent water and a generic viking
  rather than Karli. The disc's orthographic turnarounds — `FRONT`/`BACK`/`LEFT`/
  `RIGHT` per character — are exactly the multi-view identity reference needed to
  hold likeness, and are why this is solvable.
- **Backgrounds carry geometry.** Every scene positions its objects against the
  painting at exact pixel coordinates — `a_Sula` at `x="480" y="120"`, the
  walkable polygon, `zmin`/`zmax`/`defaultscaling`. Regenerate freely and every
  one of those is wrong, across 304 scenes. So backgrounds need
  **structure-preserving** treatment and **depth preserved** (D2's proxy
  geometry), where characters need none.

Practical consequence: the character pass is the smaller job *and* the one the
player looks at continuously. It should lead.

**D3 — Cinematic camera.** Drift, rack focus, cuts for dialogue. Reference target
is Grim Fandango's staging. Explicitly *not* its controls (see D5).

**D4 — Design aspect 16:9; author to ~21:9; the original 4:3 frame is the safe area.**
All gameplay-relevant content — hotspots, characters, exits — stays inside the
1999 frame by construction. Outpainted margins carry atmosphere only. Consequences:
classic mode is a pure crop rather than a separate render path; phone, tablet and
desktop all frame within one canvas; and nothing an AI invents can ever be
load-bearing.

**D5 — The verb system stays.** Moving/Taking/Looking/Talking/Using, as authored
in every `ActorMoused` in the content. Marked "for now" — revisit once the camera
work lands, because point-and-click walk targets get genuinely harder once the
camera cuts between angles. **This is the hard design problem hiding inside D3
and it is not yet solved.**

**D6 — Keep the GML interpreter and the AGT engine. Swap only presentation.**
The content layer is the game: ~1.2 MB of hand-authored GML across six chapters.
Every alternative stack considered (Godot, Unity, Rust/WASM) loses on the same
point — it forces a rewrite of the interpreter, which is the asset, while
improving nothing that matters.

## Why this is incremental, not a rewrite

`ActorFace` (`webapp/src/engine/ActorFace.ts:7`) is a genuine interface with four
implementations. A new face type is a drop-in alongside `CelledAnimated2DActorFace`.

**Characters can therefore be remastered one at a time, in content that is never
touched, shipping continuously.** That turns a 46-character rewrite into 46
independent reversible increments, and it is what makes the classic/remastered
toggle nearly free.

Already true and not to be rebuilt:
- **Depth scaling exists as a mechanism**, `Terrain.getScaling()` at
  `Scene.ts:156` — but it is only *authored* on 23 of 83 terrains. The other 60
  scale by a constant. The machinery does not need building; the data does. See
  `docs/known-issues.md` #1.
- **Pointer input is already normalized** through `getBoundingClientRect()` to an
  800×600 logical space, so resolution independence is CSS plus input mapping.
- **Turn transitions were already attempted in 1999** — `STOP2LEA` on 8
  characters, `STOP2RIA` on 7, `STOP2BAA` on 4. The original team reached for
  continuous turning and could only afford discrete cells.

## Art budget

| | Count | Treatment |
|---|---|---|
| Character cells | 241 filmstrips, ~46 characters | 3D model + rig, derived from existing frames |
| Backgrounds/props | ~304 PNGs | Depth decomposition + outpaint to 21:9 |

Top-heavy and therefore front-loadable: SIGRUN 36, GISSUR 19, HJALTI 18,
VIFILL 17, INGOLFUR 11 — five characters are ~40% of all cells.

**There are four player characters, not one.** `SetPlayer` reassigns the
protagonist each chapter: `vifill` in Landnám, `a_Hjalti` — the historical Hjalti
Skeggjason — in Kristnitaka, `a_Gissur` in Siðaskipti, `a_Sigrun` in
Tyrkjaránið. Denni, the boy in the intro storybook, is the framing device; the
player inhabits a different historical figure in each era, which is what the
title means.

That is why those four carry the largest cell counts on the disc, and it sets the
character-remaster order: they are ~37% of all animation cells and 100% of the
time the player spends looking at themselves. The tail is 2–8
cells each, mostly near-static stop/talk poses.

**The 1999 art ships orthographic turnarounds.** HJALTI, GISSUR, VIFILL and
SIGRUN each have `FRONT`/`BACK`/`LEFT`/`RIGHT`. That is exactly the reference
input a modeler or an image-to-3D pipeline wants.

## Pipelines

**Audio — done 2026-08-06.** 668 WAVs → AAC-LC `.m4a`, 48 kbps speech / 96 kbps
music, sample rates preserved, mono. 169.34 MiB → 33.41 MiB (5.07×). Masters
mounted read-only and verified bit-identical afterwards. Output at
`GAME_M4A/` on the homeserver. Open: a `libfdk_aac` re-run at 40 kbps should
reach ~28 MiB *with better quality* than the current native-AAC output.

**Chroma key must move to build time.** `AssetLoader.applyChromaKey` currently
runs per image at runtime: `getImageData` over 480,000 pixels, then a synchronous
`toDataURL()` PNG re-encode, then a re-decode. Once per PNG, 545 PNGs. It is the
single worst mobile performance item in the codebase and it is disguised as a
load step. Bake green→alpha in the asset pipeline and delete the function.

**Compression does not fix memory.** `decodeAudioData` yields float32 PCM, so
16-bit source *doubles* on decode and the AAC work buys nothing here. Caches in
`AssetLoader` never evict. A chapter's audio can exceed 90 MiB resident. Eviction
is a separate job from transcoding.

## Known defects in the inherited port

Audited 2026-08-06 against 5,143 lines. Verdict: sound foundation, `strict: true`,
clean single-timer `Pulser`, generation-counter cancellation in `Sequence`.

1. Runtime chroma key (above) — worst mobile item
2. Unbounded asset caches (above)
3. **No touch input at all.** Bindings are `mousemove`/`mousedown`/`keydown`.
   `handleMouseDown` reads coordinates only `mousemove` ever writes, so a first
   tap resolves at stale coordinates. Fix is Pointer Events, ~10 lines
4. **`Pulser` loses its remainder** — `accumulated = 0` instead of
   `-= interval`. A 50 ms speech pulse at 60 fps fires every ~66 ms, so subtitles
   drift progressively late against audio. One-line fix, directly on the
   "same feel" bar
5. **Soft-lock vector in `Sequence`** — a single `frozenResolve` is overwritten
   by concurrent waiters, and a `thaw()` landing before the promise is
   constructed hangs that sequence permanently
6. **Assets fail silently** — missing image → 1×1 blank, missing audio → `null`,
   no warning. This is why five hardcoded PNGs went unnoticed for years

## Built but never used

Dímon was founded in May 1998 and shipped Tímaflakkarinn that November — six
months, no AI assistance. The 1999 v1.1 release was bug fixes only; nothing in
this list was revisited. The consistent signature across the codebase is
**engine features built and content never authored to use them**, which is what
that schedule looks like from the inside. Part of the remaster is therefore
switching capabilities on rather than building them.

Swept from `scene.dtd` (55 elements) against all six chapters, comments stripped:

| Element | Status | Why it matters |
|---|---|---|
| `SetSpeedQuantum` | Never used. **Implemented in the port** | Sets an actor's movement speed. **No character has ever walked at other than default speed.** D1's speed-dependent gait presupposes variation the game has never had — the hook exists, the content does not |
| `Animated2DActorFace` (+`Frame`, `Frames`) | Never used. Not implemented in the port | Per-frame animation with individually named images, richer than the filmstrip `CelledAnimated2DActorFace`. Filmstrips won on authoring speed. The only non-filmstrip face shape in the DTD, and therefore the natural precedent for a rigged face type |
| `Images`, `Image`, `Fetch` | Never used | An asset-manifest subsystem |
| `GuessQuantum` | Used once | The Völva puzzle; stubbed in the port. See `docs/ownership-and-provenance.md` |
| `DecrementFlagQuantum` | Used twice | — |

## Missing assets

Five images are hardcoded in the Java and referenced by no GML, so the
content-derived capture missed them. `tools/lint_gml.py` should take `src/` as a
second oracle so this becomes a caught class rather than a lucky find.

| Asset | Purpose |
|---|---|
| `COMMON/GRAPHIC/WAIT.PNG` | wait/loading scene |
| `COMMON/GRAPHIC/KLUKKA.PNG` | clock |
| `COMMON/GRAPHIC/SAVELOAD.PNG` | save menu background |
| `COMMON/GRAPHIC/DIALOG.PNG` | save-name dialog |
| `KRISTNIA/GRAPHIC/DIALOG.PNG` | Völva name-input dialog |

Halldór's port has a pixel-faithful save menu built against `SAVELOAD.PNG`, so
he holds assets this mirror does not. Five small PNGs is a far cheaper ask than
the full ISO.

## Tooling: the depth authoring tool

Proposed by Hjalti 2026-08-06. A local web page that displays each background and
lets him sort what is in front of what.

Correct instinct, and cheap for a specific reason: **ordinal depth is far cheaper
to author than metric depth.** Proxy geometry (D2) needs layer order and rough
plane placement, not per-pixel distance. Sorting is the right interaction.

Two things make it cheaper still:

- **Pre-populate from the GML.** Every hotspot is already a `StaticActor` with
  x, y and **z** plus a collision box, so a partial depth ordering was authored
  in 1998. Draw those over the background, seed the order from an AI depth pass,
  and the task becomes correcting proposals rather than pointing at everything.
- **Author the scaling calibration in the same pass.** Drag a reference figure to
  the near and far edges of the walkable polygon and that *is* `scanline2` +
  `scaling2`. Two drags per scene × 60 scenes closes `docs/known-issues.md` #1
  for the entire game in about an hour.

Output must be GML the existing parser already accepts — the tool emits content,
not a new format. Runs locally against `web_import/GAME`; no network, no service.

## Open

- **Point-and-click under a cutting camera** (D5 × D3). Unsolved, and the
  highest-risk design problem in the project
- **What always bugged you** → now a living list at
  [`docs/known-issues.md`](../docs/known-issues.md). Largely deferred until
  the owner replays it, which makes a playable build a prerequisite for
  gathering remaster requirements rather than merely a milestone before them.
  Entry 1 is already diagnosed and has a fix implementable in the current 2D
  engine: **the game has no shadows at all**, so sprite scaling is its only
  depth cue, and scaling alone is perceptually ambiguous
- **Eye-wander hint system.** Idle for N minutes without progress → gaze drifts
  toward currently-relevant objects. Requires a new authored layer the GML has
  no concept of: per-chapter puzzle-state → salient object. Cheap to author
  alongside the content, expensive to retrofit
- **3D runtime not chosen.** three.js is the leading web candidate; unvalidated
- Style-clash test: one rigged character on one painted background, before
  committing to 46

## Done When

- [ ] `HJALTI` walks across `HJAVOLVU` as a rigged 3D toon-shaded character on a
      depth-layered painted background, at 60 fps on a phone, and it does not
      look like a sticker on a painting
- [ ] The same scene renders in classic mode from the same build, toggled at
      runtime
- [ ] `python3 tools/lint_gml.py web_import` reports zero dangling references and
      zero missing assets, with `src/` as a second oracle
- [ ] A full playthrough of Kristnitaka completes with zero JavaScript
      exceptions, on a phone, using touch only
