# What bugged us

A living list, sourced from the people who made the game. Started 2026-08-06.

This is the remaster's requirements list. A remaster is the licence to fix the
things the original team shipped and winced at — and they are the only source for
what those are. Most of this cannot be recovered from the code.

Entries are added as they surface. Expect the list to grow substantially once
there is a playable build to replay: recall is triggered by playing, not by
remembering.

---

## 1 — Walking away looks like climbing a wall

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
