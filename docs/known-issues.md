# Known issues

A living list, sourced from the people who made the game. Started 2026-08-06.

This is the remaster's requirements list. A remaster is the licence to fix the
things the original team shipped and winced at — and they are the only source for
what those are. Most of this cannot be recovered from the code.

Entries are added as they surface. Expect the list to grow substantially now
there is a playable build: recall is triggered by playing, not by remembering.

## Tags

Every entry carries an origin tag. The distinguishing question is **factual, not
aesthetic**: *why is this not right in the 1999 build?*

Since 2026-08-08 the tag also decides **which edition a change lands in.** There
are two products — see `specs/000` D8. The rule is one line: **four tags go to
both editions, one goes to Modern only.**

| Tag | Meaning | Edition |
|---|---|---|
| `1998-bug` | A defect. Wrong against the original team's own intent, and they knew it | **both** |
| `port-bug` | Introduced by the reverse-engineering | **both** |
| `missing` | Content the port does not have but the disc does | **both** |
| `cut-for-time` | Intended, achievable on the 1999 engine, lost to the schedule | **both** |
| `modern-only` | Cannot or should not be in Classic — the archetype is *"we wanted this and wished we had a better engine"* | **Modern** |

Two further tags exist and sit **outside** the edition axis entirely, because
they are about the project rather than the game: `infrastructure` (tooling,
servers, credentials) and `provenance` (what the artefacts are and where they
came from). Neither ships.

Three notes on using this well.

**`cut-for-time` is not a defect, and it still goes in Classic.** This is the
dominant signature of the codebase — three voice lines cut for a pressing
deadline, 61 of 84 terrains never given their scaling calibration,
`SetSpeedQuantum` built and wired and never once used, a sequence literally
named `s_UnDecided6`. None of it is sloppiness; it is a six-month schedule,
still visible in the archive. It was intended and it was *achievable* — the
engine could have done it — so finishing it is completing the 1999 game, not
modernising it. It needs *finishing*, not deciding.

**`modern-only` is a disposition, not a provenance.** Every other tag states a
fact about the past. This one states where the change ships. It therefore holds
two things that feel different but behave identically: what the team wanted and
the engine could not do, and what nobody in 1998 thought of at all. Both are
Modern-only, both are optional, and neither belongs in Classic. The engine-wish
cases are the more valuable half — they are recoverable only from the people who
were there.

**The line between `cut-for-time` and `modern-only` is the whole taxonomy.**
Both sound like "we wanted it and didn't ship it". The question that separates
them is: *could the 1999 engine have done it?* If yes, it is `cut-for-time` and
Classic gets it. If it needed an engine they did not have, it is `modern-only`.
When the answer is not known, it is a question for the original team and for
nobody else.

### Re-tagging still owed — needs Hjalti

`cut-for-time` was split out of `1998-bug` on 2026-08-08 and no existing entry
has been moved, because the distinction is *"did we get it wrong"* versus *"did
we run out of time"* and only the people who were there know which. Both still
ship to both editions, so nothing is blocked by this — but the two are different
facts and the record should say the right one.

The six entries currently tagged `1998-bug`, and how they look from here:

| # | Entry | Reads as |
|---|---|---|
| 0 | Three lines displayed but never spoken | **`cut-for-time`** — its own text says cut for a pressing deadline |
| 1 | Walking away looks like climbing a wall | unclear; also carries `modern-only` |
| 4 | Green speckles from palette drift | `1998-bug` — invisible on correct hardware, so never a decision |
| 11 | Hand on yourself inconsistent across chapters | `1998-bug` — inconsistency, not an unfinished plan |
| 12 | Moonwalking | `1998-bug` — owner confirms it annoyed the team at the time |
| 13 | Sword can't be picked up; hotspot on empty grass | unclear — abandoned plan, or defect? |

Also `docs/unfinished-1998.md` §4 "Built and never aimed" is `cut-for-time` by
construction — a mechanism wired in 1998 and never pointed at anything is the
definition of the tag.

**And the question that actually matters more than the re-tagging:** the
`modern-only` list is currently one entry long. That list is where *"we wanted
this and wished we had a better engine"* lives, and it is recoverable from
nobody but the original team. `STOP2LEA`/`STOP2RIA`/`STOP2BAA` — reaching for
continuous turning and affording only discrete cells — was found in the content
rather than reported, which suggests there are more.

**The only entries that need a decision from the owner are the ones where we
cannot tell whether something was intended.** Karli's subtitles being coloured
with the chroma key is the live example: deliberate hiding, or a typo for white
that went unnoticed because it rendered invisible? That question is answerable by
the people who wrote it, and nobody else.

---

## 0 — `1998-bug` + `port-bug` · PORT HALF FIXED · Three lines are displayed but never spoken

**Reported by:** Hjalti, 2026-08-07, from memory of the original production —
and confirmed against the disc the same day.

**Status:** the 1999 behaviour is understood and was deliberate. **The port
regresses it**, and that regression is unfixed.

Three `SpeechActorMouth` elements reference WAV files that **do not exist on the
retail disc**:

| Mouth | Line | Speaker |
|---|---|---|
| `m_godraddyr` | *Nú eru góð ráð dýr. Hvernig eigum við að komast yfir þetta stórfljót?* | Vífill |
| `m_afsakduhusbondi` | *Afsakaðu, húsbóndi!* | Vífill |
| `m_DetturEnginn` | *Nei! Mér dettur bara enginn felustaður í hug einmitt núna.* | Halldóra |

**This was never an archival loss.** Earlier docs recorded these as assets that
"must come from the CD-ROM ISO." The ISO is now in hand and they are not on it:
668 WAVs on the disc, 668 in the mirror, all byte-identical, nothing disc-only.
They were never pressed.

**Why, in Hjalti's words.** He oversaw the voice recordings, directed the
actors, and edited the takes himself — listening through multiple readings of
every sentence to pick the intonation. He did not finish. The master was being
pressed by Sony in the UK and had to physically travel from Iceland, against a
hard drop-dead date. The team accepted the defect knowingly: **three lines would
display as subtitles and not be spoken.**

That is a triage decision under an external constraint, not a mistake, and the
distinction matters for how the remaster treats it.

**The regression.** Both engines are pulse-driven, but they order the checks
differently:

- **Java** (`SpeechActorMouth.java:53`) calls `pulse(0L)` *synchronously inside*
  `start()`. With `time=0 >= times[0]=0`, `setText(sentences[0])` fires before
  audio state is consulted at all. The subtitle appears regardless.
- **TypeScript** (`ActorMouth.ts`) checks `if (this.finished)` **first** in
  `updateSpeech()` and clears the text — and `playNow()` sets `finished = true`
  as soon as it finds no audio buffer. A prewarmed asset never renders the line
  at all; a lazily-loaded one flashes it for one failed fetch.

So the port converts *"displayed but not spoken"* into *"neither displayed nor
spoken"*, and does it silently, because a missing asset is precisely the case
that raises no error.

**Fix.** Subtitles must not be gated on audio availability. `updateSpeech()`
should advance the sentence timeline on its own clock and only clear on genuine
completion — matching the Java, where the text is driven by `times[]` and the
sound merely runs alongside it. For a line with no audio, hold the last sentence
for a sensible duration rather than ending instantly.

**Consequence for `tools/lint_gml.py`:** these three stop being "missing assets"
and become known, accepted, permanently-absent content. They should be an
explicit documented allowlist, not errors — the linter's red is currently
reporting a 1998 decision as a defect.

**Whether to record the three lines at last: TBD, deferred to the team.** The
actors are still active, but they were in their thirties in 1998 and their
voices have changed. That is not a scheduling objection, it is a remaster
problem: the 1999 performances *are* the artifact, and the same performers
today are different instruments. Recording them would produce three lines that
are authentic in casting and audibly foreign in the middle of a 1998 cast.

Not a blocker either way. **The port regression is now fixed** (2026-08-07): a
`SpeechActorMouth` with no recording runs its sentence timeline on its own clock,
so the subtitle displays as it did in 1999 and a `wait="true"` sequence still
waits instead of racing past. The dwell on the closing line scales with its
length, because the authored timings only say when each sentence *starts* — the
recording used to say when it ended. Five tests in
`webapp/test/silentline.test.mjs`.

That fix is also what made issue #15's Irna response possible without a
recording: the new line is carried entirely by its subtitle.

---

## 1 — `1998-bug` + `modern-only` · Walking away looks like climbing a wall

**Reported by:** Hjalti, 2026-08-06 — "when Hjalti is walking up the river there
is no perspective and he doesn't get smaller … it looks like he's climbing a
wall." Refined immediately after: he *does* get smaller, but against a clearly
flat 2D background the shrinking reads as climbing rather than receding.

**Status:** diagnosed, not fixed. Affects every scene, not only the river.

**Diagnosis — corrected 2026-08-06.** An earlier version of this entry claimed
depth scaling worked and only the supporting cues were missing. That was wrong,
and the original report was literally accurate.

**Depth scaling is authored on 23 of 84 terrains — 61 are flat.** Scaling
requires `scanline1`, `scanline2` and `scaling2`: two (screen row, scale) pairs
defining the ramp. Where they are absent, `setScalingParameters` is never called,
`a` stays 0, `getScaling` returns a constant, and the character does not shrink.

| Chapter | Terrains | Calibrated | Flat |
|---|---|---|---|
| `intro` | 2 | 0 | 2 |
| `landnam` | 18 | 4 | 14 |
| `kristnit` | 20 | 5 | 15 |
| `sidaskip` | 19 | 6 | 13 |
| `tyrkran` | 22 | 8 | 14 |
| `extro` | 2 | 0 | 2 |

*(An earlier revision of this entry claimed 1 of 84, from a grep that only
matched single-line tags. Most `SimplePseudo3DTerrain` declarations wrap across
two lines. The corrected figure is above; the conclusion is unchanged, since a
clear majority of scenes are still flat.)*

The engine's maths is not at fault: `a * y + b` is *correct* perspective for a
flat ground plane — apparent size is proportional to distance below the horizon,
the standard pinhole result. The 1999 team built per-scene calibration, used it
on 23 terrains, and shipped the other 61 flat. Hand-tuning four numbers per
terrain is exactly the tedium that gets cut when time runs out.

**Additionally, the TypeScript port regresses this.** Java falls back to the
authored `defaultScaling` when `a == 0`; the port omits the guard and returns
`b`, which defaults to 1.0. So on 61 of 84 terrains the web version draws
characters uniformly too large — 1.0 where 0.7 or 0.85 was authored. That is a
live bug independent of the remaster.

**And at least one of the 23 authored ramps is not perspective either.**
`t_HjaVolvul` (the Völva's hut) declares `defaultscaling="1.0" scaling2="1.1"
scanline1="500" scanline2="800"`. Across the actual y-extremes of its own
walkable polygon `p_HjaVolvu` (507 to 601) that yields 1.0023 → 1.0337 — a
**1.031x** ramp, where the painting's perspective demands **1.63x**. A token 3%
is what you author when you are checking the feature works, not when you are
calibrating a scene. So this issue is not purely "61 are missing"; the 23 that
exist need auditing too, and re-deriving scaling from proxy geometry is a
correction rather than only a gap-fill. Measured in `specs/003`; the ramp
arithmetic was independently re-verified against the GML and against
`Terrain.getScaling`.

Compounding it, **scaling was never the only missing cue.** A grep of the engine
finds zero shadows, zero ground-contact rendering, and no atmospheric perspective
of any kind.

A figure that shrinks while moving up-screen is perceptually ambiguous — it can be
read as receding along a ground plane or as ascending a vertical surface. The
brain needs a second cue to disambiguate, and the primary one is **ground
contact**. With no shadow anchoring the feet and a painted background offering no
perspective grid, "climbing a wall" is the correct perceptual reading of what is
actually being drawn.

So neither the art nor the scaling maths is at fault. The cue that resolves them
was never there.

**Confirmed by a natural experiment.** Hjalti, same session: scenes with many
objects read correctly — "it's clear he's walking into the scene" — while a river
and a lot of green "just made it look amateur-ish."

That is precisely what the model predicts. Object-rich scenes supply three cues an
empty one cannot: **occlusion** (passing behind an object fixes depth order
unambiguously), **relative size** (recognisable objects at differing depths
calibrate the character's scaling), and **texture gradient** (detail density
compressing toward the horizon). Flat green offers none, leaving scaling as the
sole signal with nothing to check it against.

The complaint is therefore not that the art is wrong but that those scenes are
*under-cued*.

**Triage falls out of this for free.** Cue-poverty is measurable without doing any
remaster work: low detail/texture variance plus few hotspot actors predicts a
failing scene. Ranking all ~304 backgrounds on that concentrates production
effort where the perceptual deficit actually is, and puts the scenes that most
need judgement in front of Erna first.

A river is a special case worth noting: it is a natural convergence line and could
carry perspective on its own. Restoring or strengthening that convergence — with
her approval — may fix those scenes more cheaply than layering them.

**Fixes, cheapest first:**

1. **Contact shadow.** A soft ellipse at the feet, scaled by the same
   `getScaling()` that already sizes the character. Implementable in the current
   2D engine, testable before any remaster work begins, and free once characters
   are 3D (D1). Highest value per unit of effort in this entire document.
2. **Depth-layered backgrounds** (D2). Motion parallax is the strongest depth cue
   available, and it is what finally makes the existing scaling *read*. This is a
   second, independent justification for D2 — it is not only about camera drift.
3. **Atmospheric perspective.** Slight desaturation and contrast loss as the
   character recedes. A trivial shader; disproportionate effect.
4. **Depth of field** (D3). Requested directly by Hjalti in the same breath, and
   dependent on the same depth maps as D2.

**Note:** items 2–4 all depend on the background depth decomposition, which
routes through Erna as reviewer and approver. Item 1 does not, and should not
wait for them.

---

## 2 — `port-bug` · FIXED · The ship appears ~1s before the opening scroll

**Reported by:** Hjalti, 2026-08-07, playing the build.

Landnám's ship and its characters flashed on screen for about a second before
the opening scroll.

**Cause.** `landnam.gml:4623` declares `<BeginningScene scene="s_Skipingolfs"/>`,
and the port's parser reacted by switching the world to that scene **during
parsing** — so the ship was shown, then asset prewarm ran (the visible second),
then `s_prepare`'s `q_ToBlack` blacked it out and `s_begin` finally showed the
scroll.

**The 1999 engine never did this.** `TTParser` dispatches on 48 element names
and `BeginningScene` is not among them: the element is declared in `scene.dtd`,
present once per chapter, and silently ignored by the shipping game. The flash
was invented by the recreation.

**Fix.** `BeginningScene` is recorded and never displayed. What is on screen
stays the business of `s_always` / `s_prepare` / `s_begin`, as in 1999.

---

## 3 — `port-bug` · FIXED · Green flash at the top when Karli speaks

**Reported by:** Hjalti, 2026-08-07 — "green blip when Karli starts to talk,
like there is text at the top which is then suppressed." Every line, not just one.

**Cause.** `landnam.gml:1632`:

```xml
<Text name="a_Karli_acc" terrain="t_Corners" text=" " r="0" g="255" b="0" hilite="false"/>
```

Karli's subtitle actor is coloured **pure chroma-key green**. Green is the
transparency key throughout this engine, so in 1999 text drawn in it rendered as
nothing — it was how you hid a text actor. The port parses `r`/`g`/`b` into a
literal colour and paints green text at the subtitle position, screen y≈30.

**Fix.** Text authored in the chroma key colour parses as transparent, matching
1999.

### Correction, 2026-08-07: it was two elements, and the first fix only caught one

This entry originally said "exactly one element in the whole game." That was
wrong, and wrong in a way the fix inherited: the claim came from a grep for
`g="255"`, so it could only ever find the elements written as `r`/`g`/`b`.

`tyrkran.gml:473` writes the same colour the other way:

```xml
<Text name="a_Halldora_acc" terrain="t_Corners" text=" " color="green" hilite="false"/>
```

`NAMED_COLORS.green` is `(0,255,0)` — the identical triple — but it takes the
named-colour branch, which the first fix did not guard. **Halldóra flashed green
on all 19 of her lines in Tyrkjaránið**, exactly as Karli did in Landnám, and
would have been reported as a new bug the moment the owner reached chapter 4.

The check now runs on the **resolved** colour rather than on one authoring
syntax (`isChromaKey`, `GMLParser.ts`). Full census of the shipped content: 146
`<Text>` elements, 26 of them speech accumulators, exactly 2 chroma green —
`a_Karli_acc` and `a_Halldora_acc`. Three others are genuinely green-ish and
must keep painting (`a_Ymsir_acc` 74,156,14; `a_Oddur_acc` 8,168,56;
`a_kristofer_acc` 10,146,90), so a tolerance-based key would be wrong here even
though it is the right answer for the sprite art in issue #4.

Covered by `webapp/test/chromatext.test.mjs` (7 cases), which walks every
`<Text>` in all six chapters through the real parser and asserts nothing paints
`rgb(0,255,0)`. Verified to fail on the previous code with
`tyrkran.gml a_Halldora_acc paints chroma green`.

**Left open, tagged `1998`:** this means **Karli's and Halldóra's dialogue was
unsubtitled in the shipped game.** Faithful behaviour is invisible; the remaster
may want it white. Hjalti's call.

Two things now bear on that question that did not before. The same trick appears
**twice, in two chapters, written two different ways** — which is a weak
argument for a typo and a decent one for a known convention: you do not make the
same mistake in two notations. And it collides with issue #0: Halldóra's
`m_DetturEnginn` is one of the three lines that were never recorded, so the fix
that restored its subtitle now renders that subtitle invisible. That line is
currently neither spoken nor readable. If any part of this gets a white, it
should be that one.

---

## 4 — `1998-bug` · PARTLY FIXED · Green speckles from palette drift

**Reported by:** Hjalti, 2026-08-07 — "several places where the green chroma
didn't work".

**Measured, 2026-08-07:** all 545 PNGs (78.2M pixels) scanned, then every number
re-verified with an independent pure-JS PNG decoder inside the test. It is **12
sprite sheets and 116 pixels**, not 13/118 — the 13th file is a *background*,
and its pixels sit further out (see below). Only **two** off-key colours exist
in the whole tree: `(4,252,4)` at Chebyshev distance 4, and `(4,244,4)` at 11.

**It is not anti-aliasing.** That was the working assumption and the measurement
refuted it, which changed the fix:

- The 12 sheets expose 73,336 backing-boundary pixels; only 116 are near-green.
  **0.16% coverage** — real AA would be near 100%.
- **85%** of the specks do not touch the backing at all; their commonest
  neighbour is `(4,4,4)`, the black outline. **66%** are isolated single pixels.
- Zero exact-key pixels are isolated — the backing is one clean region.
- **The tell:** 534 files are 8-bit indexed, and every channel value in them is
  ≡ 0 mod 4 *except* the reserved 255. `(0,255,0)` is palette index 254;
  `(4,244,4)` is index 212 — and **197 files carry index 212 with zero pixels
  using it.** A shared export palette holding two near-identical greens.

So these are stray chroma-green specks left in the 1998 artwork, which the
quantiser snapped onto a ramp entry instead of the reserved key entry.

**Binary tolerance, not feathering.** Feathering scales alpha by coverage and
there is no coverage to scale: at distance 4 it leaves a pixel ~94% transparent,
i.e. a residual speck rather than a removed one. It is also slower (147ms vs
117ms across the tree). Wrong instrument.

**Threshold = 16, chosen because 12–18 is an empty band.** The Chebyshev
distances that actually occur in the tree are 4, 11, 19, 28, 35, 44, 51, 59, 60,
67, 75, 76, 83, 84, 91, 92 — nothing between 12 and 18, so every value there
produces byte-identical output. 16 is the middle of that gap. Painted green art
(the `RUNNI.PNG` bush, `HJORLEIA` grass) first gets touched at **60**, a 3.75×
margin. The test sweep pins the bracket empirically: it fails at ≤10 (drift
survives) and at ≥19 (art eaten).

**Cost: +10ms (+9%) one-time across the entire asset tree** (107→117ms), which
is why the loop is written longhand rather than behind a per-pixel predicate
(134ms). Crucially, **zero new `toDataURL()` round trips** — all 12 affected
files already contained exact-key pixels, so the re-encode count stays at
473/545. That re-encode, not the scan, is the dominant mobile cost.

**SCOPE BOUNDARY — do not widen this to text.** `isChromaKey` in `GMLParser.ts`
stays an exact match, deliberately: three speech accumulators are genuinely
green-ish and must keep painting (`a_Ymsir_acc` 74,156,14; `a_Oddur_acc`
8,168,56; `a_kristofer_acc` 10,146,90). See issue #3. A test asserts the text key
did not widen.

Covered by `webapp/test/chromakey.test.mjs` (7 cases), which carries its own PNG
decoder so it walks the real 545 files rather than a fixture.

### Still open — needs the owner, and probably Erna

Two **backgrounds** carry the same defect further out, and I deliberately did
not widen the threshold to reach them:

- `SIDASKIA/GRAPHIC/SVEFNHEA.PNG` — 11 px at distances 19 and 35, plus 2
  exact-key px the engine already punches out today.
- `LANDNAM/GRAPHIC/HJORLEIA/HJORLEIA.PNG` — 2 px at distance 28, green dots on
  the driftwood.

The reason is stronger than the threshold: **`HJORLEIA.PNG` contains zero
exact-key pixels** — independently confirmed — so it has no chroma backing at
all. Keying anything in it punches a transparent hole in a painting rather than
removing a backing. These want real art repair: repaint 13 pixels. That is
derived art, so it is the Erna sign-off gate, not a threshold change.

Repaired files need a home outside `web_import/`, which is read-only master.
Proposal, not yet built: `art_repair/GAME/<same path>`, overlaid onto the served
tree by the pipeline — master untouched, every repaired pixel a reviewable diff.

**Not verified:** confirmed at pixel level and in tests; nobody has launched the
game and looked at these sprites.

---

## 5 — `missing` · FIXED · The intro film never played

`INTRO.AVI` shipped on the disc, no GML references it, so the capture never
collected it and the port never played it — the same blind spot that hid the
cursors and the five hardcoded PNGs. Now plays after the credits as **Kynning**,
with a skip button. See `tools/pipeline/make-video.sh`.

---

## 6 — `port-bug` · FIXED · Dialogue options are hard to click, and never highlight

**Reported by:** Hjalti, 2026-08-07 — "it's like the mouse pointer is inaccurate…
when there are short answers among the answers the clickable area gets smaller…
I have to move the pointer to the left." Correctly guessed as a conversion bug.

**Cause 1 — the hit box was estimated, not measured.**

```ts
const charWidth = this.fontSize * 0.55;
this.bounds.width = Math.round(this.text.length * charWidth) + 16;
```

A fixed advance per character, against a **proportional** 22px serif. Every line
was wrong by a different amount, depending on its mix of wide and narrow
letters. Where it under-measured, the right-hand part of the option was simply
not clickable — hence aiming left. Where it over-measured, a line stole clicks
from its neighbour, which is why short options behaved worst: `Bless!` measured
89px against real glyphs far narrower, and the long line above it over-reached.

Now measured with `ctx.measureText()` against the exact font used to draw, plus
real ascent/descent for the height. `fontSize` became an accessor that
re-measures, so the box cannot go stale when a caller sets the size after the
text.

**Cause 2 — hover state was never set for game actors.** `mouseOver` was
assigned only inside `SaveScene`, by hand, per actor. So the `hilite` attribute
authored throughout the content did nothing outside the save menu: no game text
ever highlighted. `World` now sets `mouseOver` on the face during the same
enter/exit transition it already tracked.

**New feature, as requested: hovering a selectable line renders it bold.** The
hit box is measured with **bold** metrics — the wider of the two — so the
clickable area never shrinks at the instant the pointer enters and the text
thickens, which would otherwise cause a flicker at the edges.

**To verify:** in the debug deployment, toggle the bounding-box overlay in the
panel. Boxes should now sit tight around the glyphs instead of drifting.

---

## 7 — `port-bug` · FIXED · One-shot animations snap back to their first frame

**Reported by:** Hjalti, 2026-08-07 — the öndvegissúla is thrown overboard after
Ingólfur speaks, but "there was animation where it falls over."

> **This entry did not fully explain the report it is named after.** The
> last-frame fix below is real and its tests are intact, but it was not what
> Hjalti was seeing. The öndvegissúlur throw was invisible for a different and
> upstream reason — Ingólfur never walked onto the deck at all. See **#17**. Two
> genuine bugs happened to share one symptom, and fixing the first made the
> entry look closed.

**Cause.** `AnimatedActorFace.advanceFrame()` wrapped to frame 0 at the end of
the final repetition and froze there. The 1999 engine instead detects the last
frame of the last repetition and, on the next pulse, fires the finished event
and **returns without advancing** — resting on the closing pose.

So Ingólfur played all ten frames, tipped the pillar over the side, splashed —
and then snapped back to frame 0: standing beside an upright pillar, held for
the four-second pause before the fade. The throw visibly un-happened.

**This affected every one-shot animation in the game**, not just this one: give,
chop, sigh, the Völva's cross and dip, every `repeat="1"` face.

**Second difference fixed at the same time:** the original's `dontAdvance` flag,
set by `reset()`, gives frame 0 its full interval after a state change. The port
advanced immediately, so every animation ran a frame ahead and its opening pose
was never really seen.

Both ported verbatim from `CelledAnimated2DActorFace.advanceFrame()`. Covered by
six regression tests in `webapp/test/animation.test.mjs` — the behaviour is
subtle enough that it would regress silently otherwise.

---

## 8 — `port-bug`? · Walking into Hallveig, the player keeps walking

**Reported by:** Hjalti, 2026-08-07. The player character walks into Hallveig and
continues for a few seconds, as if trying to walk through her.

Present in the original. **Deferred to Phase 2** — the proxy geometry and real
ground plane give collision something truthful to work against, and fixing it
before then would mean tuning against a stand-in.

---

## 9 — `port-bug` · FIXED · Cursor hotspot was 15px off

**Reported by:** Hjalti, 2026-08-07, with two screenshots that pinned it exactly:
approaching a menu item from **below**, it highlights while the cursor is
visibly under the text; approaching from **above**, the cursor sits on the text
and it does *not* highlight. The true hit point was consistently up-left of the
drawn pointer.

**Two coupled defects in `CursorFace`:**

1. `xOffset`/`yOffset` were declared `0` and never populated. The 1999
   constructor sets them to `width/2`, `height/2`
   (`CursorFace.java:98-99`).
2. The sign was wrong. `setLocation` did `bounds.x = x + xOffset`, copying the
   `StaticActorFace` convention.

The original deliberately distinguishes the two: for a normal face the offset is
a **draw offset** and is added (`ActorFace.java:235`); for a cursor it is a
**hotspot** and is subtracted (`CursorFace.java:45-46`). The port flattened that
distinction, so `bounds` top-left landed on the mouse point and the arrowheads —
which converge on the centre of a 30×30 image — rendered 15px down and right of
the point being hit-tested.

**Only the draw position changed.** `CursorFace` is a separate `Scene.cursorFace`
field, never a member of `Scene.faces`, so `getActorFaceAt()` never consults
these bounds. `mouseX`/`mouseY` and both hit-test call sites are untouched:
clicking accuracy is unaffected, only where the arrow appears.

Note this compounded issue #6 — a mis-measured hit box *and* a 15px cursor
offset, in the same interaction. Either alone is annoying; together they made
dialogue options feel arbitrary.

---

## 10 — `port-bug` · FIXED · The walker never re-aims, and wall-follows to a corner

**Reported by:** Hjalti, 2026-08-07 — talking to Karli in Ingólfshöfði sends
Vífill to the far right of the screen instead of stopping at his left.

**Cause.** `MovingActor.updateMovement` slid along a blocked axis while keeping
the course it computed **once**, in `setDestination`. It never re-aimed. So the
first time the terrain polygon deflects the actor, the stale course carries him
past the target and he wall-follows to a polygon corner.

`p_Ingolfshofdi` has a raised ledge whose right wall runs (260,424)→(260,470)
(`landnam.gml:397-408`). Standing on that lip, the straight line to the authored
`(360,550)` crosses the wall. Reproduced headlessly against the real polygon:
`(240,430) → (798,598)`, precisely the reported endpoint. A grid sweep found
**7 of 879 walkable start points** land at the screen edge, all in the band
x∈[220,255], y∈[425,455] — the ledge lip.

**The 1999 engine has a detour state machine the port dropped entirely**:
`control` / `xFailed` / `yFailed` / `tempDest` in `MovingActor.java`. On an
invalid position it stores the real target in `tempDest` and re-derives `course`
for an axis-aligned leg; `destinationReached()` switches legs on arrival and only
reports true near the real target. When both axes fail it stops **and still fires
the reached event**, so a `wait="true"` sequence continues. Ported verbatim.

**It also fixed five hangs.** Across 8,400 randomised walks over all 83 terrain
polygons in all five chapters, five walks *never terminated* before the fix and
zero do after. A `SetDestinationQuantum wait="true"` on one of those would have
frozen its sequence permanently.

Residual: 129/343 blocked-line walks still miss. That is Java-faithful — the
original is a two-leg Manhattan detour, not a pathfinder, and gives up on concave
geometry.

Covered by `webapp/test/walker.test.mjs` (5 tests), which fails on the previous
code with `from 220,425 ended at 798,598`.

### Three divergences found alongside, reported not changed

1. **Walk speed is ~35% slow on scaled terrains.** The port multiplies speed by
   `terrain.getScaling()` for dynamic-scaling actors — 0.63 in Ingólfshöfði.
   Java declares `speedScalingFactor` but **never assigns it anywhere**; it is
   always 1.0. The port invented this. Changing it re-times every scripted walk
   in the game, so it needs a deliberate decision.
2. **`Terrain.contains` is a point test.** Java validates the actor's whole
   collision-box footprint (`Pseudo3DCollisionBox.validLocation`, 9–27 sample
   points) plus terrain transitions and **actor-vs-actor blocking**. The port has
   none of that, so characters walk up to walls and through each other. **This is
   very likely issue #8 (walking through Hallveig), which was filed as `1998` on
   the assumption it was original — it may well be `port`.**
3. `SetDestinationQuantum.leap()` in Java has a 240s watchdog that force-sets the
   location. The port's `await` has no timeout.

---

## 11 — `1998-bug` · FIXED · Using the hand on yourself was inconsistent across chapters

**Reported by:** Hjalti, 2026-08-07 — "I'm pretty sure there was some funny response
when using hand on himself... now he just says sæll." Then, on being told the
content did exactly that: *"but it's a bug :-) ... omission by us, the intent was
always to answer with something from the random pool when trying to pick up
yourself — we should have same behavior throughout the game."*

**Filed first as not-a-bug, which was wrong.** The content did do what it said, so
by mechanism nothing was broken. But the axis that matters is intent, and an
omission the author can name is a defect. Corrected.

**What each player character did.** `SetPlayer` makes the protagonist different
per chapter, so this had to be checked four times:

| Chapter | Player | Hand-on-self |
|---|---|---|
| Landnám | `vifill` | `s_LookVifill` — the greeting, identical to look and talk |
| Kristnitaka | `a_Hjalti` | `s_TakeHuman` → *"Láttu ekki svona!"* |
| Siðaskipti | `a_Gissur` | `s_LookGissur` — the greeting |
| Tyrkjaránið | `a_Sigrun` | **`s_UnDecided6`**, then `s_LookSigrun` |

One chapter in four had a take-specific response, and even that one was a single
fixed line rather than the pool. **`s_UnDecided6` is named "undecided"** — a 1998
TODO left in the content, and about as direct a confirmation of the stated intent
as the archive could offer.

`s_randomTake` — the 13-line refusal pool in `COMMON/MEDIA/TAKE/`, including
*"Ég gæti aldrei haldið á þessu!"* — already existed in all four chapters. The
intended behaviour was wired and simply never pointed at.

**Fix.** Every `action_take` reaction on a player actor now targets
`s_randomTake`. Seven reactions across four chapters.

**Note on editing content.** `specs/001` treats the GML as sacred, edited only to
fix authored defects. This qualifies, on the owner's explicit statement of
original intent. The edit was made byte-wise: a first attempt through Python's
text mode silently converted CRLF to LF across four files and was reverted.
Any future content edit must read and write bytes — the files are ISO-8859-1 with
CRLF and both are load-bearing.

---

## 12 — `1998-bug` · Moonwalking: feet move faster than the character does

**Reported by:** Hjalti, 2026-08-07 — "this annoyed the 'crap' out of us... it
looks like the main character is moonwalking, his feet move faster than his speed
across the screen." Known and disliked at the time, so `1998-bug` by the
definition above. **Not being worked on — logged only.**

**Mechanism.** A cel walk cycle has an implied *stride*: the ground distance the
character should cover in one loop, baked into the art by where the feet plant.
Read it right and the contact foot appears stationary against the ground. The
walk reads correctly only when

```
translation speed  ==  stride per cycle  ×  cycles per second
```

Nothing in the engine enforces that. Animation rate is authored on the face
(`CelledAnimated2DActorFace speed=`, ms per frame, with `count=` frames) and
movement speed is authored separately on the actor and on
`SetDestinationQuantum speed=`. The two were tuned by eye and never tied
together, so any mismatch shows as skating (too fast) or moonwalking (too slow).
Example: `karli_left` is 8 frames at 60 ms — a 480 ms cycle — and its translation
speed is set nowhere near it by construction.

**The port very likely makes it worse.** `MovingActor.updateMovement` multiplies
speed by `terrain.getScaling(location)` for dynamic-scaling actors — about **0.63
in Ingólfshöfði**, so roughly 35% slower than authored. The 1999 Java declares
`speedScalingFactor` and **never assigns it anywhere**; it is always 1.0. So the
port invented a speed reduction while leaving the animation rate untouched, which
is precisely the moonwalk failure mode, amplified.

**Consequence for the pending decision.** "Should we remove the port's invented
35% speed scaling?" was filed as a fidelity question needing a deliberate call
because it re-times every scripted walk. It is now also **a candidate fix for
this entry** — worth measuring before treating the two separately.

**Proper fix, for the remaster.** Derive translation speed from the animation
rather than authoring both independently: measure each cycle's stride once, then
drive speed from it — or drive the animation rate from the actual speed, which is
also what makes D1's speed-dependent gait possible. Either way the two stop being
free to disagree.

---

## 13 — `1998-bug` · The sword can't be picked up; a discovery hotspot points at empty grass

**Reported by:** Hjalti, 2026-08-07 — hovering the sword in Hjörleifshöfði reads
**"Taka Hjörleif"** and clicking gives a refusal. "If I recall we should pick up
the sword, there is no such option."

**The engine is behaving correctly.** Verified against the 1999 original: Java's
`Scene.getActorFaceAt` walks the face chain keeping the last match, `ActorFace.contains`
is a plain rect test, and the port's backward-walk-first-match is equivalent.
No collision-box simplification on this path, no alpha test to have lost.
**Not a `port-bug`. Content.**

**The sword is background paint, not an object.** It is drawn into
`LANDNAM/GRAPHIC/HJORLEIA/HJORLEIA.PNG` at roughly x 634–670, y 465–554. No sword
actor exists in any chapter — a search of all six `.gml` files for
`sver`/`sword`/`sax`/`vopn`/`brand` returns only spoken dialogue.

What the pointer actually hits is `a_Hjorleifur` (`landnam.gml:562-565`), a
123×82 `TransparentActorFace` at `x=566 y=408 z=-100`, giving bounds
**(566,508)–(689,590)**. Cropping exactly that rectangle from the background
shows Hjörleifur's boots and legs on the left **and the lower half of the sword
blade on the right**. So the label is right for the actor and wrong for what the
player thinks they are pointing at.

### The unfinished intent

`landnam.gml:673-676` declares a hotspot named **`a_hmmm`**, labelled
**"Hmmm... Hvað er þetta?"** — 94×78 at `x=500 y=300`, bounds (500,300)–(594,378).
That rectangle, cropped from the background, is **empty grass.**

It is the last entry in the `<!-- transparent aukahlutir -->` block, the only
actor there without `random="true"`, its name is a placeholder, and its label is
the classic "there is something here" tease. It sits ~150px up and left of the
sword. Someone authored a discovery hotspot in 1999 and never moved it onto the
sword or wired a take reaction — the same species as `s_UnDecided6` and the
hand-on-self omission.

**Falsifying test before acting**, since the geometry claim is sharp: hover the
sword's **hilt and pommel**, above y≈508 — nothing should highlight. Slide down
onto the lower blade and it should snap to "Taka Hjörleif". A boundary anywhere
else means the measurements are wrong.

**Proposed repair (content, needs owner sign-off):** move `a_hmmm` onto the sword
— roughly `x="634" y="465"` with a ~40×90 face — and give it a take reaction.
Open questions only Hjalti can answer: does taking the sword belong in the
inventory, is it used later, and what should the line be?

---

## 14 — `port-bug` · FIXED · Debug scene-jump landed in an empty room

**Reported by:** Hjalti, 2026-08-07 — clicking `s_Hjorleifshofdi` in the debug
flow tree showed the background with **no characters**. In Halldór's original dev
build, jumping to a stage set things up as though earlier puzzles were solved.

**Cause.** `jumpToScene` only ever *prepared*. It ran `s_always`, `s_prepare`,
`setCurrentScene`, `setState(MOVING)` — and both prepare sequences are
`PrepareQuantum`s end to end, which decode faces and place nobody. The log the
owner sent was therefore complete and correct: the jump did everything it was
written to do.

What real arrival runs (`landnam.gml:4224-4269`) and the jump did not: two
`MoveActorQuantum`s attaching Vífill and Karli to the terrain, a
`MoveTerrainQuantum` for the conversation terrain, `SetFlagQuantum` for
`f_CurrentScene`, two `SetDestinationQuantum`s putting them on their marks, and
the exit-hotspot toggles. The furniture appeared because statics are attached at
parse time by their `terrain=` attribute; only the *characters* were missing.

*(Hjörleifur is not a missing character — he is painted into the background with
a `TransparentActorFace` hotspot over him, same as `a_Hus` and `a_Skreid`.
Independently confirmed by the agent on issue #13.)*

**Fix.** Replay the game's own arrival sequence, keeping only the quantums that
*establish* state — `MoveActor`, `MoveTerrain`, `SetFlag`, `SetDestination` —
and dropping speech, fades, music, pauses and scene switches. Execution goes
through the engine's own `tunnel()` path, so destinations land on their mark
instead of walking. **No invented coordinates anywhere: dev mode reaches a state
the engine itself produces.**

Sequence selection was validated against the real GML for **all 40 flow-tree
scenes across six chapters**. 25 place the player directly; the rest are covered
by a fallback or are scenes the player never occupies (`s_Map`, `s_BeginScene`,
intro/extro). Where it cannot reproduce a real state it now **logs an `ERR`
line** rather than silently showing an empty room — that log is the honesty
contract for anything found in dev mode.

**Two further bugs found and fixed en route:**

1. `setCurrentSceneFlag` only looked for `f_CurrentScene`/`q_Current<Scene>`.
   **Kristnitaka names them `f_CS`/`q_CS<Scene>`** (`kristnit.gml:166-175`), so
   that chapter's flag was never set and `s_prepare` would prepare whatever the
   flag happened to hold.
2. `stopAllSequences`, Enter-fast-forward and the active-sequence panel iterated
   only the winner of each name collision, so a sequence still performing in a
   chapter you had left could never be stopped.

**Not covered:** puzzle progress. Only the SetFlags inside the chosen sequence
fire, so first-time dialogue will trigger and inventory is whatever the session
left. Uneven but honest.

7 new tests in `webapp/test/scenejump.test.mjs`; 44 cases total.

---

## 15 — `port-bug` · FIXED · The Völva's name puzzle soft-locked Kristnitaka

**Found by:** the systematic sweep, 2026-08-07. Not reported from play — the
owner had not reached it yet.

**The most serious defect found in the port.** `kristnit.gml:4136-4141`:

```xml
<Sequence name="s_ThuHeitir">
	<Quantum name="qh_TextVolva"/>   <!-- hide the dialogue options -->
	<Quantum name="q_Freeze"/>       <!-- lock the controller -->
	<Quantum name="q_Guess"/>        <!-- open the name-entry dialog -->
</Sequence>
```

In 1999 `q_Guess` opens a text prompt (`GuessQuantum.java` →
`Timaflakkarinn.showDialog2()`); the answer is compared to `"erna"` at
`Timaflakkarinn.java:552` and routed to `s_GuessCorrect` or `s_GuessWrong`, both
of which restore the controller.

**The port implemented `GuessQuantum` as an empty stub.** So the sequence hid the
dialogue options, set `FREEZE`, and returned. `StateController` has no `FREEZE`
case and the inventory button is gated on `state !== FREEZE`, so **nothing the
player clicked did anything.** No error, no log, no way out but reload.

`s_GuessCorrect` is also the only path that runs `q_MoveKross2Inventory` and
`q_MoveThorshamar` — the Völva trading the cross for the Þórshamar. That
necklace is the game's time-travel device and the object the whole story turns
on, so this was not merely a stuck puzzle.

**Fix.** `GuessQuantum` now shows a prompt and performs the content's own
`s_GuessCorrect` / `s_GuessWrong` by name. Rendered as a **DOM overlay**, not on
the canvas: the 1999 engine drew its own text widget because a Java applet had
no choice, whereas a DOM input gets mobile keyboards, IME and the Icelandic
letters for nothing — and the project's fidelity bar is explicitly "feel rather
than pixels". The dialog cannot be dismissed without answering, since the calling
sequence has already frozen the controller.

**One deliberate departure from 1999:** the comparison is `trim()`ed as well as
case-insensitive. The original compared untrimmed input while `charNotAllowed`
admitted the space character, so `"erna "` was rejected identically to a wrong
answer with nothing to distinguish them. Trimming accepts only input the original
unambiguously intended to accept — it preserves a decision, not a bug. Approved
by the owner.

**Still outstanding, and content:** the owner asked for a distinct response when
a player types **`irna`** — the reading a correct Younger Futhark chart lookup
produces, since ís (ᛁ) writes both /i/ and /e/. His line: *"Ég heiti reyndar
Erna, en rúnaletur greinir ekki á milli I og E. Þú leystir þrautina."* That needs
a new sequence in `kristnit.gml` and runs into issue #0 — the port clears
subtitles for a mouth with no audio — so it wants both changes together.

---

## 16 — `port-bug`? · UNVERIFIED · `a_Rope`'s hotspot may sit ~90px from the rope

**Found incidentally** by the art-assessment agent, 2026-08-07, while computing
hotspot bounds for the ship scene. Reported rather than asserted.

Using the same anchoring convention that puts `a_Tunnur` (barrels) and `a_Kista`
(chest) exactly on their objects, `a_Rope`'s computed bounds land on **empty
deck**, while the rope appears roughly **90 px higher** in the rendered scene.

Two readings, unresolved: the sprite's anchor differs from the others (a content
quirk), or the port places it wrongly (a `port-bug`). The agent declined to draw
a box it could not stand behind, which is the right call — but it means someone
should click the rope in Landnám's ship scene and see whether it responds where
it looks.

Cheap check: in `s_Skipingolfs`, hover the coiled rope on the deck. If nothing
highlights there but something does ~90 px below, this is real.

---

## 17 — `port-bug` · FIXED · Actors with no collision box could not move at all

**Found by:** the investigation into #7, 2026-08-07. Not separately reported —
the owner saw only the missing öndvegissúlur animation.

**Cause.** Java validates a move *only when the current state declares a
collision box* (`src/dimon/agt/Actor.java:90`):

```java
if (this.currentTerrain != null && this.currentCollisionBox != null
    && !this.currentCollisionBox.validLocation(f, f2, f3)) { throw new InvalidPositionException(); }
```

The port tested `terrain.contains()` unconditionally. `ingolfur2` declares five
states, **none with a `collisionbox`**, and sits at z=327 against
`t_Skipingolfs` (`zmin="-7" zmax="0"`) — so every step was rejected. Reproduced
headlessly against the real engine classes: both `wait="true"` walks reported
*reached* instantly at the unchanged start position, screen y=860 on a 600px
canvas. Nothing hung and nothing logged. He spoke off-screen, pushed off-screen,
and the pillar simply vanished.

The animation itself was never the problem: `ingolfur_push` is a 10-frame,
225 ms one-shot (`landnam.gml:1822`), its frames exist as
`GAME/LANDNAM/ANIMATIA/INGOLFUR/PUSH.PNG` (510×4860 = 10 cells), and composited
at the engine's computed coordinates it lands on the deck to the pixel — frame
height 486 at draw-y 113 ends at 599 against a 600px canvas. Nothing was cut in
1998, and no GML edit was needed.

**Boxless is a 1998 convention, not an oversight.** It is exactly what the
content uses for actors that enter or leave frame, whose destinations are
outside the walkable polygon *by design*. Nine such walks across three chapters
were frozen:

| Chapter | Actor | Intended movement |
|---|---|---|
| Landnám | `ingolfur2` | comes up on deck, throws the pillars |
| Landnám | `a_Drumbur2` | log drifting to (82,900) |
| Kristnitaka | `a_HeidnirLogberg`, `a_KristnirLogberg` | the two parties leaving Lögberg |
| Tyrkjaránið | `a_Tyrki1/2/3` | raiders entering from x=1100, leaving to x=-100 |
| Tyrkjaránið | `a_Flaska`, `a_SigrunATunnu` | bottle drifting; Sigrún on the barrel |

**Verification status is uneven and worth knowing.** `ingolfur2` was verified
end to end. The other eight were verified *arithmetically only* — each was
blocked before the fix and is unblocked now — but **nobody has watched them in a
browser**. The Tyrkjaránið raiders entering frame is the one to look at first.

Covered by `webapp/test/collisionbox.test.mjs` (4 cases), which reads PUSH.PNG's
IHDR from the master so it breaks if the asset changes. Confirmed to fail on the
pre-fix code.

**A test was passing vacuously.** `walker.test.mjs` built its `MovingActor` with
no state at all, so after this change its five cases still passed — while the
walker strode straight through the ledge wall. The fixture now carries Vífill's
real `vifill_cb` (100×15×292), which is what the test always claimed to model.
Without that, the #10 regression coverage was silently dead.

**Left unfixed, deliberately.** Java's z-test is strict (`z > zMin && z < zMax`);
the port uses `>=`/`<=`. It only ever makes the port *more* permissive, and the
collision-box gate makes it moot for boxless actors. Tightening it could newly
block a boxed actor resting exactly on a boundary, which is a worse trade than
the divergence.

---

## 18 — `port-bug` · FIXED · Returning to a chapter ran another chapter's sequences

**Found by:** the systematic sweep; the debug flow tree's chapter jump exposes it
directly.

**Cause.** Every chapter's GML was parsed into one container that was never
cleared, and every by-name lookup — `performSequence` above all — read out of it.
Forward-only play never noticed, because each chapter's parse overwrote the
previous one's names just before they were needed. Going back to a chapter you
had already visited ran the *other* chapter's `s_always` / `s_prepare` /
`s_begin`.

**Census, re-measured.** The previous figure ("88 of 143") was wrong on the base.
Method: parse the six shipped `.gml` files, take every top-level element with a
`name`, plus the two derived keys the parser also registers (`<Text name=X>` also
registers `X_face`; an actor's `collision=` attribute registers its own name).
Canonicalise each declaration as its tag, its attributes minus `name`, and its
whole child subtree.

| | count |
|---|---|
| container keys shared by all four main chapters | **111** |
| of those, differing in their own XML | **56** |
| of those, differing once closed over the names they reference | **90** |

The transitive figure is the one that matters. `s_prepare` is spelt *identically*
in all four chapters and is still a different sequence in each, because the quanta
it names are redefined per chapter — so a textual census understates the damage,
and de-duplication would have been the wrong fix. By category, the 111 shared keys
are 33 quanta, 29 sequences, 21 mouths, 8 faces, 8 actors, 5 terrains, 3 scenes,
2 flags, 1 polygon, 1 StateController. The 21 that survive unchanged are 6 faces,
5 quanta, 4 terrains, 3 scenes, 2 flags and 1 polygon — every sequence, every
mouth and every actor of the 111 differs.

**What 1999 did — this decides the fix.** The Java engine also used a single
`Hashtable` (`Timaflakkarinn.screenContainer`, forced onto the parser at
`Timaflakkarinn.java:120` and `:356`), but it **emptied it at every screen
transition**: `clearContainer()` (`Timaflakkarinn.java:314-341`) calls
`unprepare()` on every `Preparable`, `kill()` on every `Killable`,
`Groups.clearAll()`, then `hashtable.clear()`. The next chapter's `.gml` was then
re-parsed from disk. Returning to an already-visited chapter was possible only
through Load-game, and that path re-parses too (`displayScreen2` →
`clearContainer` → `parseStoryPage`, `Timaflakkarinn.java:275-297`). So exactly
one chapter's names existed at any moment. **The port kept the container and
dropped the clear — a port bug, not inherited behaviour.**

**Fix.** `webapp/src/game/ChapterScopes.ts`: one map per chapter, resolved
**strictly** — no fallback to a global union, at parse time or at runtime. That
restores the 1999 guarantee without paying for the re-parse (which the web port
would also have to re-prewarm 500+ PNGs for).

**No shared/common scope, deliberately.** The obvious shape — per-chapter scope
with a fallback to a common one — was rejected on evidence: the content has
nothing to put in a common scope. Running the real parser over all six files, the
only names looked up and not found in their own chapter are the four `action_*`
reactor *roles* (never object names anywhere; `Reaction` routes them to the
StateController precisely when the container misses), two known content defects
declared in no file at all (`q_Ahvarerhjorleifur` in landnám's `s_bless1`,
`s_Fjolin` in tyrkjaránið), and one intra-chapter forward reference (below).
**Even the Þórshamar and the cross are chapter-local**: `a_Thorshamar` and
`a_Kross` are declared in `kristnit.gml` and nowhere else, and the trade happens
inside that chapter in `s_GuessCorrect`. A fallback would have preserved exactly
the failure being removed.

**Two more bugs fixed en route,** both previously logged as deliberately
unscoped and both real: `SaveSerializer.serialize` walked every chapter ever
parsed, so saving in one chapter recorded another chapter's `a_Player` position
under the same name; and `restore()` assigned `currentScreen` directly instead of
going through `setCurrentChapter`, so a loaded game ran with the last-parsed
chapter's StateController.

**New content finding, tagged `1998`:** `qh_TextToggi` is a **forward
reference**. `s_EgHefSvolitidMerkilegt` names it at `kristnit.gml:3628`; the
`UpdateQuantum` that declares it is at `:3811`. The 1999 `TTParser` is single-pass
too, so that sequence was short one quantum in the shipped game as well — it
would have failed to hide Toggi's conversation text. Same chapter, so scoping is
not involved. Not fixed: it is a content edit and wants Halldór's confirmation,
alongside the other two dangling names.

Covered by `webapp/test/chapterscope.test.mjs` (8 cases), which parses all six
1998 files through the real `GMLParser` and asserts, among others, that after
landnám → kristnitaka → landnám the game resolves *landnám's* `s_begin` — and
that the same trip through one shared container still returns the wrong one, so
the regression cannot be quietly re-introduced. 97 cases total.

**Not verified in a browser.** Typecheck, build and the suite are green;
nobody has yet clicked back into a visited chapter in the debug panel.

---

## 19 — `port-bug` · FIXED · Picking was done in world space, painting in screen space

**Found by:** browser verification, 2026-08-07. Not reported by the owner —
found because it *blocked three other tests*.

**Reported as** "several background actors' hover/click hitboxes are far larger
than their visible sprites"; the concrete case was Tyrkjaránið's `s_Kot`, where
the door's handle pixel resolved to `a_Mamma`, `a_KotTunnur1` or `a_Tunna` and
**the door could not be clicked at all**.

**The hitboxes were the right size in the right shape. They were in the wrong
coordinate space** — displaced by exactly the scroll offset, which reads as
"too big" when you probe an unfamiliar scene by hovering.

### The 1999 rule, from `src/dimon/agt/`

Three facts settle it, and all three come from the decompiled source:

1. **Hit-testing is a plain rectangle test against `bounds`.**
   `ActorFace.contains(n, n2)` is `n > 0 && n < bounds.width && n2 > 0 &&
   n2 < bounds.height` and **no subclass overrides it** — not
   `StaticActorFace`, not `CelledAnimated2DActorFace`. There is no per-pixel
   alpha test in the original, so the chroma-key hypothesis is dead: a 1999
   sprite has always been clickable on its transparent corners.
2. **Overlaps are resolved by z-order, frontmost wins — nothing else.**
   `Scene.getActorFaceAt` walks the chain from `firstFace` toward the front and
   keeps the *last* match; the chain is ordered by `ActorFace.compareTo`, which
   compares `Actor.getZOrder()` — and that is just `location.y`
   (`Actor.java:107`). No smallest-area rule, no declaration order. The port
   already did this correctly.
3. **The scroll offset belongs to the layout, not to the painting.**
   `SimplePseudo3DTerrain.getPhysicalXCoord/YCoord` subtract
   `((ScrollingScene) myScene).getScrollPosition()` whenever the terrain is
   scrolling, and `ScrollingScene.setScrollPosition` then re-runs
   `actor.setLocation(actor.getLocation())` over **every actor of every
   terrain** so the whole scene re-lays-out on each 30px step. `bounds` is
   therefore always in screen space — the same space `getActorFaceAt(mouseX,
   mouseY)` is called in.

The port did the opposite. `Actor.updateFace()` passed a hard-coded
`scrollX = 0` (`// ScrollingScene handles this`) and `ScrollingScene.paint()`
did `ctx.translate(-scrollX, -scrollY)` instead. That draws correctly and picks
wrongly: `bounds` stayed in **world** space while the pointer stayed in
**screen** space. `StateController.handleMouseEvent` did convert — it adds
`scrollX` to get a walk destination — which is why walking still worked while
clicking objects did not, and why the failure looked capricious rather than
systematic.

Also killed by measurement, since it was the leading hypothesis: **sprite sheets
are divided per cell in both engines.** `CelledAnimated2DActorFace.setImageSize`
does `frameHeight = n2 / numCells`, and the port's `AnimatedActorFace.prepare()`
does `Math.floor(naturalHeight / numFrames)`. Mamma's `TALK.PNG` is 205×3300
over `count="10"` → 205×330 in both.

### Measured scope

All six chapters, arithmetic replayed from the GML and the real PNGs (script
kept out of the tree; method: reimplement `Actor.updateFace` + the terrain
physical-coordinate maths, then sweep every scroll offset in 25–50px steps and
ask, for each interactive actor, whether *any* pixel of where it is drawn
resolves to it).

| | count |
|---|---|
| actors carrying an `ActorMoused` (i.e. clickable) | 239 |
| ... on a scrolling terrain inside a `ScrollingScene` | 92 |
| **fully unpickable at some scroll offset, before the fix** | **89** |
| fully unpickable at some scroll offset, after the fix | 7 |
| clickable but under half their own rect, after the fix | 10 |

`a_KotHurd` was unreachable at *every* scroll offset, not merely most: its rect
starts at world x=996 and a screen x of 996 does not exist on an 800px canvas.

**The residual 7 are 1998 content, not a port defect**, and are left alone. Each
is a small actor whose rect sits wholly inside a nearer, larger one *in its
initial state* — `a_Edalsteinn` under the closed `a_Lok`, `a_Thorshamar` behind
the heathen party at Lögberg, `a_Hjorleifur` behind `a_Bush`, and so on. That is
concealment by design, it is exactly what the 1999 rect-and-z rule produces, and
`a_KotPokar1` is only covered while Sigrún herself is standing in front of it.

The "hitbox larger than the sprite" observation is also real and also faithful:
11 of 171 image-backed actors have a visible (non-chroma) bounding box under half
their rect, worst being `a_Batur` at 17%. Both engines rect-test, so this is 1998
behaviour and must not be "fixed".

### The fix

- `Actor.updateFace()` reads `terrain.scene.scrollX/scrollY` instead of 0.
- `Scene` grows `scrollX`/`scrollY` (always 0); `ScrollingScene` owns them.
- `ScrollingScene.setScrollPosition()` early-returns when unchanged and
  otherwise calls `relayout()`, which runs `updateFace()` over every actor of
  every terrain — Java's `setLocation(getLocation())` loop without the
  `onMoved` event storm this port would re-enter `updateScroll()` with.
- `ScrollingScene.onStage()` relayouts, because a scene keeps its scroll offset
  between visits and actors can change state while it is off stage.
- `ScrollingScene.paint()` is **deleted**; the inherited screen-space paint is
  now correct. That also stops the translate dragging the `scrolling="false"`
  terrains — the corner HUD and the subtitle containers — sideways with the
  viewport, which is very likely why Halldóra's dialogue could not be verified.

Covered by `webapp/test/picking.test.mjs` (9 cases) built from the real `s_Kot`
geometry in `tyrkran.gml`; the decisive case asserts the door is picked at its
handle. Confirmed to fail on the pre-fix code (`996 !== 596`).

**Not verified in a browser.** Typecheck, build and the 106-case suite are
green; nobody has yet walked Sigrún to the cottage door and clicked it.

Note the interaction with #17: boxless actors are a separate concept
(`collisionbox` governs *movement*) and were not involved. #9 measured *text*
bounds and was likewise unrelated.

**Left alone, deliberately.** Java's `contains` excludes the left and top edge
column (`n > 0`, not `n >= 0`); the port includes them, a 1px difference in the
player's favour. Java breaks z-order ties by face *name*
(`ActorFace.compareTo`), the port by insertion order. And `ScrollingScene`
never centres on the player the way `ScrollingScene.centerActor()` does —
`centerOnActor()` exists but nothing calls it, and the port's version uses
`y - z` where 1999 uses `y`. None of these change picking; all three are
camera/tie-break polish for a separate pass.

### Browser verification of #17 and the chapter-scoping fix, same session

Run locally under Playwright; 97 screenshots retained.

- **Chapter round-trip: VERIFIED.** Landnám→Kristnitaka→Landnám, the reverse,
  and a three-chapter trip. Every return shows `StateController → landnam` then
  Landnám's own `s_begin [1/18]` with `qp_Skipslag` — never Kristnitaka's
  `[1/26]`/`qp_Kortalag` nor Siðaskipti's `[1/42]`. No wrong-chapter content
  ever appeared.
- **Ingólfur's throw: VERIFIED — the owner's original report.** `ingolfur2`
  walks in from off-frame, scaling up under pseudo-3D, arrives at the mast;
  `q_HideSula` then `q_Ingolfur_push` fire, the carved pillar leaves the deck
  and a mass enters at frame right; `q_PlaySplass` plays `m_Splass`. The two
  `SetDestinationQuantum` log lines are 4.5s apart — real traversal, where the
  pre-fix engine reported arrival instantly.
- **Bold-on-hover: VERIFIED**, and it tracks each line's own measured width —
  a short line bolds on its glyphs and reverts past them.
- **No green flash for Karli: VERIFIED** by burst capture at 150ms straddling
  the `q_conversating` log line. Halldóra unreachable (see above).
- **Cursor under pointer: VERIFIED.**
- **Still unwatched:** the Tyrkjaránið raiders, the Lögberg walk-offs, and the
  drifting log/bottle/barrel. All blocked by trigger-reachability, not by any
  evidence against the fix. The raiders remain the first thing to watch.

### Verification status of the screen-space picking fix (#19), 2026-08-07

**All of it verified in a browser, by real gameplay rather than scene jumps.**
334 screenshots retained. An earlier note here said several of these were
"could-not-test" and that the verifying agent had died; both were wrong — it ran
96 minutes and reported in full. The interim finding it superseded (that `s_Kot`
renders correctly at scroll 0) still holds and is subsumed below.

- **Scrolling renders correctly.** Sigrún walked the full 1200px width of
  `s_Kot` against the 800px canvas: smooth, no doubled offset, no jitter, and
  actors stay planted on the background — the barrel and Mamma keep the same
  floorboards across the walk.
- **Non-scrolling elements now hold still — the predicted improvement,
  confirmed.** The corner state icon `a_States` occupies the *identical* screen
  position at both true scroll extremes while the background behind it is
  completely different. Quantified with `compare -metric AE` over the icon
  region: 292 of 5,400 px differ (~5%), consistent with background texture
  bleeding into the crop edge, not icon movement.
- **The door works.** Hover-probing a grid around `a_KotHurd` shows it reporting
  cleanly across its own band with neighbours reporting immediately outside it —
  no conflation with `a_Mamma` or the barrels. It shows its own "Hurð" tooltip,
  and a click walks Sigrún up to reach for the latch.
- **The Tyrkjaránið raid fires, and a raider walks on screen.** Reached by
  playing the real beats — Halldóra to "Bless!" (`f_AskurTaken` 0→2), take the
  `Askur` (→3), then the door, which correctly evaluated `f_AskurTaken==3` and
  fired `s_Action`. `a_Tyrki1` spawns at world x=1100, off an 800px screen, and
  visibly enters from the right. **Caveat kept: only Tyrki1 was observed.**
  Tyrki2/Tyrki3's x=1100→−100 traverse is scripted in `s_UtanDanskaHusid`, which
  this session did not reach. The mechanism is proven; that pair is not.
- **Halldóra: no green flash.** 36 frames burst-captured at 250ms through her
  opening exchange, checked with `-fuzz 15% -opaque rgb(0,255,0)` over the top
  canvas region across 8 sampled frames — zero matching pixels.
- **The Lögberg walk-offs happen.** `a_KristnirLogberg` exits right toward
  x=805 and `a_HeidnirLogberg` exits left toward x=−250, both captured mid-walk,
  with a clean end state and nobody stuck.
- **No regression in a non-scrolling scene.** Ordinary new-game flow into
  Landnám's ship: hover names the actor, click walks the player to him and
  triggers the interaction that reveals the hidden chest.

That closes #17's "nine frozen walks" — of the nine, Ingólfur, Tyrki1 and both
Lögberg parties are now seen moving. Remaining unobserved: Tyrki2, Tyrki3, the
drifting log `a_Drumbur2`, `a_Flaska` and `a_SigrunATunnu`.

**One new pre-existing quirk found en route, not part of this fix:** an
oversized `a_HjaHestasveini2HeidnarBudir` collision zone intercepts early
movement in `s_HjaHestasveini` and has to be routed around. That is a *portal*
collision zone, not a picking rect, so #19's fix does not address it. Worth its
own look.

---

## 20 — `infrastructure` · The server's Forgejo token was deleted, not expired

**Diagnosed:** 2026-08-07, after the owner declined to re-issue credentials
without a cause. That call was correct and is the reason this entry exists.

**The error nobody had seen.** `deploy.sh` tested the credential with
`git ls-remote ... >/dev/null 2>&1`, discarding stderr on every run. Git's own
message is generic ("Credentials are incorrect or have expired"); the API is
not:

```
HTTP 401  {"message":"access token does not exist [sha: <redacted>]"}
```

That is the row-not-found path. Forgejo personal tokens have **no default
expiry**, so "expired" was never a possible reading of this failure.

**What actually happened.** Five tokens have been issued on this account and one
survives: id=4, `Timaflakkarinn`, created 2026-07-26 23:17, scopes
`write:issue,write:repository`, in daily use from the laptop. The server's token
file is dated 2026-07-25 07:40 — a day *before* id=4 existed — so it holds one
of the deleted ids. User `halldor` was created 2026-07-26 22:22, **55 minutes
before** the surviving token: the churn happened while setting up Halldór's
access. The laptop received the new token; the server was never updated.

**Ruled out with evidence:** network, DNS and TLS (server reaches Forgejo on
`127.0.0.1:3000` in 0.66ms and the public host over verified TLS; laptop and
server take genuinely different routes but land on the same instance); repo
rename (repo and branch both present); and a version upgrade tightening token
policy (chronologically impossible — the container predates the token file).

**The worse finding.** `.git/FETCH_HEAD` on the server reads
`branch 'feat/unify' of /tmp/tt-deploy-*.bundle`, and `refs/remotes/origin/`
has not moved since 2026-07-25. **Thirteen days with no successful origin
fetch**, silently falling back every time — invisible precisely because the
error was discarded. Fixed: the check now reports the server's verbatim reason.

**How this became "fact".** A comment guessing "expired" was written next to the
silenced check, and was then repeated in `LAST_SESSION.md` and twice in
`specs/001` — including by this session, which restated it as established. A
crisp label hardened a weak inference. All four sites corrected.

### Recommendation — do not mint a sixth token

A user-scoped PAT shared between machines is what caused this: rotating it for
one silently breaks the other, with no signal. Prefer an **SSH deploy key
scoped to this repository** for the server — immune to PAT churn, revocable
independently of the owner's own access, and per-machine. Owner's decision;
nothing has been changed or rotated.

**Live footgun, unrelated to the fix:** Forgejo's 401 body echoes the presented
token back in the error string, so any log or CI transcript capturing that
response leaks the credential verbatim. The token in question is already dead.

---

## 21 — `provenance` · The disc is the 1999 build, and there were two engines

**Established 2026-08-07** by mounting `FLAKKARI.ISO` — which we have had all
along, and whose `MAC/`, `WIN/` and `DIRECTX/` directories nobody had opened.
`web_import/` is a capture of the deployed website, not an ISO extraction, so it
contains only `GAME/` and `INTRO.AVI`.

**The disc is the November 1999 build, not the 1998 original.** Everything is
stamped Nov 16–18 1999; only `INTRO.AVI` keeps its **Dec 5 1998** date, because
the video was rendered once and carried forward.

| path | bytes | dated |
|---|---|---|
| `INTRO.AVI` | 14,197,248 | 1998-12-05 |
| `WIN/SETJAUPP.EXE` | 3,887,070 | 1999-11-18 |
| `WIN/LESTUMIG.TXT` | 4,163 | 1999-11-16 |
| `MAC/SETJAUPP.BIN` | 9,608,450 | 1999-11-17 |
| `MAC/LESTUMIG.TXT` | 4,357 | 1999-11-17 |
| `DIRECTX/DX6CORE.EXE` | 1,598,704 | 1998-11-12 |

**There were two engines, and we reverse-engineered the Mac one.** The Mac
readme requires **Macintosh Runtime for Java 2.1.4** — so the `is.dimon` classes
are the *Mac* build. The Windows build was a separate native implementation
requiring **DirectX 6.0**. Wherever this repo says "the 1999 engine did X", it
means the Mac Java build; the Windows build may well have differed, and no claim
here has been checked against it.

**A 1999 FAQ entry that explains issue #4.** The *Windows* readme — and only the
Windows one — carries this:

> *Myndin er skrýtin, það kemur alltaf grænn kassi í kringum alla hluti sem
> hreyfast...* — "the picture is strange, there's always a green box around
> everything that moves"

with the answer being outdated display drivers. Windows keyed the chroma in
**hardware** via DirectDraw, so on a card with bad drivers the key failed and
players saw green rectangles. That is why stray near-green pixels were never
cleaned out of the artwork: on correct hardware they disappeared, and the art
never had to be exact. Issue #4's classification as `1998-bug` stands, with a
mechanism behind it now.

**Still unaccounted for: the original 1998 pressing.** The game shipped November
1998 and this disc is a year later. Whether the 1998 release differs — content,
voice lines, engine — is unknown, and no copy of it is in hand. Hjalti's OneDrive
copy, made 2014-09-02, matches this disc item-for-item, so it is a second witness
to the 1999 build rather than a new artefact. Valuable as independent
provenance; not a different version.

**`MAC/SETJAUPP.BIN` (9.6 MB) is unexamined** and is the most likely origin of
the decompiled Java. Worth opening if any question about original engine
behaviour becomes load-bearing.


---

## 22 — `infrastructure` · The transcoded audio exists in exactly one directory, on one machine

Found 2026-08-08 while building the second serving root.

`web_import/GAME_M4A` — the 668 AAC files that are the entire 169 → 33 MiB audio
win — is **gitignored**, and correctly so: it is derived from the WAV masters and
is build output, not source. But the consequence had never been stated. Two fresh
clones made that day contained **zero** `.m4a` files, while the workspace had all
668. Both serving roots hardlink their audio from that one workspace directory.

So today:

- Every `.M4A` byte the public hears traces to
  `/home/hjalti/work/timaflakkarinn/web_import/GAME_M4A` on `homeserver`.
- A `GAME/` overlay **cannot be built on any machine that lacks it**.
  `tools/make-overlay.sh` refuses with that reason rather than producing a
  silent, audio-less tree.
- Losing that directory does not break the running site — the serving roots hold
  their own hardlinks to the same inodes, so the data survives as long as *any*
  link does. It breaks the ability to rebuild.

Not urgent, and deliberately not "fixed" by committing it: 35 MB of derived
output in LFS is the wrong answer, and the owner's standing rule is that build
output is never `git add`ed.

**The real fix is to make it reproducible**: the WAV → AAC transcode is not in
`tools/` at all. It was run once, by hand, and the exact `ffmpeg` invocation
survives only in `specs/000` prose (`libfdk_aac`, and an open question about a
40 kbps re-run). Until that is a script, the audio pipeline is a step that
happened rather than a step that can happen again.

Related: `specs/001` "Deployment" and the `--m4a-src` flag on
`tools/make-overlay.sh`.

---

## 23 — `port-bug` · FIXED · A missing `/version.json` answered 200 with the app HTML

Found and fixed 2026-08-08, immediately on introducing the deploy stamp.

`/version.json` is written into each serving root at publish time and records
which commit that environment is running. On first test, `tt.spliffdonk.com`
(which had no such file yet) returned **`200` with `index.html`** rather than
`404`: the path fell into the SPA catch-all, `try_files {path} /index.html`.

That is the same class of failure the `/assets/*` handler already existed to
prevent — a missing thing answering cheerfully — but `/assets/*` was the only
path protected. Anything asking "what is deployed here?" would have received a
web page and could have parsed it as an answer; a monitor checking for HTTP 200
would have called an unstamped root healthy.

Fixed with an explicit Caddy handler ahead of the catch-all, serving the file
with `no-store` (not `no-cache`: this endpoint answers *right now*, never from a
cache). Verified after the change: dev `200` with its stamp, prod `404` because
it has not been promoted yet — which is the honest answer.

---

## 24 — `port-bug` · FIXED · The subtitle was destroyed at the moment the sound started

Found 2026-08-08, while adding a readable subtitle strip for the phone.

**The script exists.** Every voiced line in the game has its words and its
timing in the GML, as `<Sentence text="…" time="…">` children of a
`SpeechActorMouth`:

| | speech mouths | timed sentences | carrying `acc=` |
|---|---|---|---|
| Landnám | 138 | 209 | 138 |
| Kristnitaka | 193 | 410 | 193 |
| Siðaskipti | 204 | 442 | 204 |
| Tyrkjaránið | 173 | 254 | 173 |
| **total** | **708** | **1,315** | **708 (all)** |

**And it is wired.** All 708 mouths name a text accumulator — `acc="a_Vifill_acc"`
and so on — every accumulator is declared before the mouth that references it,
`GMLParser` builds each `<Text>` into an Actor with a `TextActorFace`, and
`SpeechActorMouth` steps the sentences on the audio's clock and moves the
accumulator to `textMiddle` (400, 2030, z 2000) on `start()`.

**None of it shows.** Driven in a real browser against the deployed dev site:
talk to Vífill on the ship, take the first option, watch for 20s. The
conversation demonstrably advanced — four options became three, so the reaction
ran and `m_hvaderum` was performed — and no subtitle appeared, on the canvas or
in the new DOM strip that mirrors it.

Two accumulators are *deliberately* invisible and are not this: `a_Karli_acc`
and `a_Halldora_acc` are chroma green, so they drew as nothing in 1999 and are
painted transparent here on purpose (see the note in `GMLParser` `case 'Text'`).
Vífill's is `color="white"`, and Vífill is who was tested.

**Diagnosed and fixed, same day.** None of the three candidates was it; all
three were measured and cleared. `t_Corners` is `zmin="900" zmax="2000"` and
`contains()` is inclusive, so z=2000 passes; `getPhysicalY` is `y - z`, putting
the line at screen y=30, top centre, where the hover label demonstrably renders.
`Actor.addState` does set `face.owner`, so the actor resolves and is positioned.

The cause was ordering. `SimpleActorMouth.start()` returns EARLY the first time a
line plays — it kicks off an async `prepare()` and defers `playNow()` to the
promise — and `playNow()` begins with `this.stop()`, which for a speech mouth
unregisters the pulser and calls `textFace.setText('')`. The old code set the
text and registered the timeline in `start()`, before that stop:

    start()      -> subtitle appears
    ...load...
    playNow()    -> stop() wipes the text and unregisters the timeline
    audio plays  -> nothing re-establishes either

So the subtitle was destroyed at the exact moment the sound began. A line with no
recording returns from `playNow()` *before* that stop, which is why the three
silent lines of #0 always displayed and everything else looked like it had no
subtitles at all. Only a replayed line — already prepared, so `playNow` runs
synchronously inside `start()` — would have shown one.

Fixed by anchoring the timeline in a `playNow()` override, so it starts when the
audio starts. That also fixes a desync nobody had reported: the sentence clock
used to start when the load was *requested*, so lines ran ahead of the voice by
however long the fetch took.

**Verified** in a browser against the dev build: talk to Vífill on the ship, take
the first option, and six lines appear in order — "Heyrðu Karli!", "Hvað!",
"Hvað er um að vera?", "Þú ert allt of spenntur Vífill!", "Það hefur ekkert
markvert gerst hér ...", "... síðan við lögðum af stað frá Noregi í síðasta
mánuði." Before the fix the same run produced zero.

**Why it matters beyond a bug.** The owner asked whether subtitles were possible
so the game could be played with the sound off — and they were written in 1998,
for every line. If this has never displayed, then 1,315 authored lines have been
invisible since the port began, and the subtitle feature is not a feature to
build but a defect to fix.

Still true and separate: `a_Karli_acc` and `a_Halldora_acc` are chroma green and
therefore deliberately invisible, so Karli's and Halldóra's lines remain
unsubtitled by 1998's own choice. Whether to keep that is a `modern-only`
question, not a defect.

## 25 — `provenance` · A full original-team playthrough passes, and the Þjórsá "bug" never existed

**Reported by:** Georg, 2026-08-13, on Messenger — played the game **start to
finish on his iPhone in one evening**. Tagged `provenance` because both halves
are evidence about the project rather than defects in the game: the strongest
fidelity verification the port has had, from someone who helped make the
original, and a phantom report closed by the only kind of authority that can
close one.

> "Ég gat spilað leikinn til enda á símanum mínum í gærkvöldi - þannig að allt
> virkar frá upphafi til enda og fáir böggar eftir … þetta virkar allt bara 99%
> nákvæmlega eins og þetta var"

(*"I could play the game to the end on my phone last night — so everything
works start to finish and few bugs remain … it all works 99% exactly as it
was."*)

**The Þjórsá crossing was never broken.** The long-suspected bug — that the
axe-tied-to-rope throw across the river doesn't work — was Georg forgetting
the puzzle's own prerequisite:

> "maður þarf að höggva tréið manns megin við bakkann áður en maður reynir að
> kasta öxi-bundinni-við-reipi yfir ána - það virkar ekki að kasta fyrr en
> búið er að höggva tréið fyrst"

(*chop the tree on your own side of the bank first; the throw refuses until
the tree is down.*) That refusal is the 1999 design working as intended. No
entry ever existed for this and none should be opened; this note exists so
nobody chases the ghost.

**Caveat on everything Georg saw:** prod (`tt.spliffdonk.com`) serves
`ff1ebec` (2026-08-07) — a week behind dev, before the save menu (`8fc4479`)
and the subtitle fixes (#24). Which URL he played is not known. If it was
prod, parts of his list below are reports against already-fixed code. **Ask
him which URL** before spending diagnosis time on #27.

## 26 — `port-bug` · FIXED · Touch targets are finger-hostile on a phone

**Reported by:** Georg, 2026-08-13, from the same playthrough:

> "sumt [er] svo smátt á iphone að það er erfitt að sjá það eða taka það
> (t.d. tappi í tunnu í Tyrkjaráni og Þórshamarshálsfesti í Kristnitöku) og ég
> þurfti að reyna oft … velja nákvæmlega réttan punkt til að taka virkaði"

(*Some things are so small on iPhone they are hard to see or take — the tap
in the barrel in Tyrkjarán, the Thor's-hammer necklace in Kristnitaka — many
tries, and only the exactly right pixel works.*)

`port-bug` by the same reasoning as #6 and #9: the 1999 hotspots were sized
for a mouse cursor on a desktop CRT and are right for that world; the port
brought them to a platform where the pointer is a fingertip. Wants a
finger-sized pick tolerance on touch input (a radius around the tap, nearest
eligible hotspot wins), not enlarged hotspots — the authored geometry stays
1999's. His two examples are the test cases.

**Fixed 2026-08-14** (`21c5eba`), exactly as proposed. Touch taps carry a
22-CSS-px slop (half of Apple's 44pt minimum target), scaled through the
canvas fit into logical space; mouse and pen stay exact, so slop 0 remains
the byte-for-byte 1999 hit test. Only faces small enough for a fingertip to
miss (twice the slop per side) attract; an exact hit always wins; nearest
wins among candidates; nothing below the exact hit in z can be picked, so a
covering face keeps covering. Measured against his examples: the barrel tap
is a 16x19 sprite and the Thor's hammer 23x20 — both about ten CSS pixels on
an iPhone, both now magnetic within a fingertip. 8 tests in
`webapp/test/touchslop.test.mjs`; logic verified there and against the real
sprite dimensions. On-device confirmation still owed — ideally by the
reporter.

## 27 — `port-bug`? · UNVERIFIED · Dialogue text sometimes unreadable, and old text lingers

**Reported by:** Georg, 2026-08-13, from the same playthrough:

> "Svo eru e-r glitch í að textinn sjáist þegar verið er að tala - og stundum
> lúrir gamall texti á skjánum"

(*Some glitches in the text showing while someone is talking — and sometimes
old text lurks on the screen.*)

UNVERIFIED because of the #25 caveat: the subtitle pipeline was rebuilt in
#24 *after* the commit prod serves, and "text not showing during speech" is
exactly what #24 fixed. The lingering-text half may be the pre-fix sentence
clock running ahead of the audio (also #24), or may be a real, still-live
staleness bug in the accumulator teardown. Reproduce on current dev first;
if it survives there, this becomes a real entry with its own diagnosis.
