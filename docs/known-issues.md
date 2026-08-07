# Known issues

A living list, sourced from the people who made the game. Started 2026-08-06.

This is the remaster's requirements list. A remaster is the licence to fix the
things the original team shipped and winced at — and they are the only source for
what those are. Most of this cannot be recovered from the code.

Entries are added as they surface. Expect the list to grow substantially now
there is a playable build: recall is triggered by playing, not by remembering.

## Tags

Every entry carries an origin tag, because **only one class needs a decision**:

| Tag | Meaning | What happens |
|---|---|---|
| `1998` | Shipped in the original | **Needs a call: preserve or fix?** The remaster question |
| `port` | Introduced by the reverse-engineering | Just fix. No decision to make |
| `missing` | Content the port does not have | Just add |
| `design` | Worked as built, but felt wrong | What the remaster is *for* |

A `port` entry is never a fidelity question — the original is the specification
and the recreation is simply wrong. A `1998` entry always is.

---

## 0 — `1998`+`port` · Three lines are displayed but never spoken

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

Not a blocker either way. **The port regression above should be fixed
regardless**, because "displayed, not spoken" is the shipped behaviour and the
port currently delivers neither.

---

## 1 — `1998` · Walking away looks like climbing a wall

**Reported by:** Hjalti, 2026-08-06 — "when Hjalti is walking up the river there
is no perspective and he doesn't get smaller … it looks like he's climbing a
wall." Refined immediately after: he *does* get smaller, but against a clearly
flat 2D background the shrinking reads as climbing rather than receding.

**Status:** diagnosed, not fixed. Affects every scene, not only the river.

**Diagnosis — corrected 2026-08-06.** An earlier version of this entry claimed
depth scaling worked and only the supporting cues were missing. That was wrong,
and the original report was literally accurate.

**Depth scaling is authored on 23 of 83 terrains — 60 are flat.** Scaling
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
once, and shipped the other 83 terrains flat. Hand-tuning four numbers per
terrain is exactly the tedium that gets cut when time runs out.

**Additionally, the TypeScript port regresses this.** Java falls back to the
authored `defaultScaling` when `a == 0`; the port omits the guard and returns
`b`, which defaults to 1.0. So on 83 of 84 terrains the web version draws
characters uniformly too large — 1.0 where 0.7 or 0.85 was authored. That is a
live bug independent of the remaster.

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

## 2 — `port` · FIXED · The ship appears ~1s before the opening scroll

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

## 3 — `port` · FIXED · Green flash at the top when Karli speaks

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

**It is exactly one element in the whole game.** Every other accumulator —
`a_Vifill_acc`, `a_Extra_acc` — uses `color="white"`. That is why only Karli
does it.

**Fix.** Text authored in the chroma key colour parses as transparent, matching
1999.

**Left open, tagged `1998`:** this means **Karli's dialogue was unsubtitled in
the shipped game.** Whether that was deliberate or a typo for white is unknown,
and it is an accessibility gap either way. Faithful behaviour is invisible;
the remaster may want it white. Hjalti's call.

---

## 4 — `1998` · Green speckles on 13 sprites

**Reported by:** Hjalti, 2026-08-07 — "several places where the green chroma
didn't work perfect."

**Confirmed by measurement, and it is in the disc art, not the port.** 118 pixels
across 13 sprites sit one step off pure green, and the engine keys on *exactly*
`RGB(0,255,0)`, so they survive as specks on moving characters:

```
41 px  TYRKJARA/ANIMATIA/BUNDNIRA/TALK.PNG
24 px  TYRKJARA/ANIMATIA/TUNNALEA/TUNNALEA.PNG
15 px  TYRKJARA/ANIMATIA/MAMMA/TALK.PNG
11 px  KRISTNIA/ANIMATIA/HJALTI/FRONT.PNG
 8 px  TYRKJARA/ANIMATIA/SIGRUN/FRONT.PNG
 …8 more, down to single pixels
```

**Fix (not yet applied).** Key on a tolerance rather than an exact match, at
build time in the asset pipeline. All 118 vanish and no legitimate art is at
risk — no character sprite uses saturated green otherwise. Nobody is nostalgic
for 118 stray pixels, so this is a `1998` entry whose answer is almost certainly
"fix", but it is still a content change and gets recorded as one.

---

## 5 — `missing` · FIXED · The intro film never played

`INTRO.AVI` shipped on the disc, no GML references it, so the capture never
collected it and the port never played it — the same blind spot that hid the
cursors and the five hardcoded PNGs. Now plays after the credits as **Kynning**,
with a skip button. See `tools/pipeline/make-video.sh`.

---

## 6 — `port` · FIXED · Dialogue options are hard to click, and never highlight

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

## 7 — `port` · FIXED · One-shot animations snap back to their first frame

**Reported by:** Hjalti, 2026-08-07 — the öndvegissúla is thrown overboard after
Ingólfur speaks, but "there was animation where it falls over."

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

## 8 — `1998` · Walking into Hallveig, the player keeps walking

**Reported by:** Hjalti, 2026-08-07. The player character walks into Hallveig and
continues for a few seconds, as if trying to walk through her.

Present in the original. **Deferred to Phase 2** — the proxy geometry and real
ground plane give collision something truthful to work against, and fixing it
before then would mean tuning against a stand-in.
