# Known issues

A living list, sourced from the people who made the game. Started 2026-08-06.

This is the remaster's requirements list. A remaster is the licence to fix the
things the original team shipped and winced at — and they are the only source for
what those are. Most of this cannot be recovered from the code.

Entries are added as they surface. Expect the list to grow substantially now
there is a playable build: recall is triggered by playing, not by remembering.

## Tags

Every entry carries an origin tag. The distinguishing question is **factual, not
aesthetic**: *did the 1998 team consider this wrong at the time?*

| Tag | Meaning | What happens |
|---|---|---|
| `1998-bug` | Wrong against the original team's own intent — a shipped defect, **or** something they meant to do and never got to | **Fix it.** No preserve-or-fix debate: the authors already agreed it was wrong, so preserving it would preserve a mistake, not fidelity |
| `port-bug` | Introduced by the reverse-engineering | Fix. The 1999 engine is the specification and the recreation is simply wrong |
| `missing` | Content the port does not have | Add |
| `design-improvement` | Worked exactly as intended in 1998; we want better now | Genuinely optional. This is what the remaster is *for* |

Two notes on using this well.

**`1998-bug` covers unfinished intent, not just defects.** That is the dominant
signature of this codebase — three voice lines cut for a pressing deadline, 60 of
83 terrains never given their scaling calibration, `SetSpeedQuantum` built and
wired and never once used, a sequence literally named `s_UnDecided6`. None of
that is sloppiness; it is a six-month schedule, still visible in the archive.
It needs *finishing*, not deciding.

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

## 1 — `1998-bug` + `design-improvement` · Walking away looks like climbing a wall

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

## 4 — `1998-bug` · Green speckles on 13 sprites

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
