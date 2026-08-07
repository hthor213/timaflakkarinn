# 003 — 2.8D prototype: measured findings

Status: **evidence, awaiting owner decision on D2**
Date: 2026-08-07
Scope: one scene, `HJAVOLVU.PNG` (Kristnitaka, the Völva's turf hut)

This is a decision brief, not a spec change. **D2 in `specs/000` is an owner
decision and stands as written.** The prototype was built to test D2's
assumptions, and it found one of them to be false. What follows is the evidence
and the recommendation; changing D2 is Hjalti's call, and if he keeps it the
brief becomes the record of what we knowingly accepted.

Artefacts live outside this repo, in
`timaflakkarinn-disc/work/prototype/out/` — nothing was committed there and
`web_import/` was not touched.

---

## 1. The finding that reframes D2: the master art is dithered

D2's reasoning assumes the backgrounds are *soft-shaded painterly images*, and
that vectorising them therefore recovers smooth regions that a super-resolver can
only guess at. They are not stored that way.

Independently verified in this session, directly against `web_import/`:

| | mode | colours | h-change rate | median constant run |
|---|---|---|---|---|
| `HJAVOLVU.PNG` (background) | 8-bit indexed | **160** | **0.728** | **1 px** |
| `KROSSDIA.PNG` (character) | 8-bit indexed | **12** | **0.082** | — |

A 0.728 horizontal change rate with a 1-pixel median run is Floyd–Steinberg
dithering: 73% of adjacent pixel pairs differ. The "soft" ochre floor is a
two-tone checkerboard (`out/00_dither_proof_floor_12x_nearest.png`).

The soft shading is real to the eye but exists **as pixel-level noise**, and
vectorisation operates on the noise rather than on the shading. The
character/background asymmetry that `specs/000` intuited is real and now has a
number on it: 160 colours against 12, 0.728 against 0.082.

## 2. Vector vs super-resolution: B is not sharper, it is flatter

Best of each family: **A = Real-ESRGAN `high-fidelity-4x`** (`ultrasharp` and
`remacri` hallucinate woven canvas and halftone dots *out of the dither* —
a direct consequence of §1; `digital-art` melts detail). **B = vtracer on the
super-resolved image**, 6,103 paths.

That the winning vectoriser runs *on* A is itself the structural result: the best
available vectorisation is a lossy post-process of super-resolution, so it cannot
contain more than A does.

| | dE00 mean | p95 | **max** | ink stroke, darkest luma |
|---|---|---|---|---|
| MASTER | — | — | — | 20.0 |
| **A** high-fidelity-4x | 1.71 | 5.24 | **8.9** | **16.0** (consolidates the dithered stroke) |
| **B4** vtracer on super-res | 2.12 | 5.05 | **19.6** | 24.1 (50% lighter) |
| B2 de-dither + vtracer | 3.12 | 7.38 | 26.0 | 25.4 |
| B3 potrace ink + vtracer body | 3.17 | 7.53 | 31.6 | — |

The **max** column is where the visible difference lives; the means are close.
Two specific losses:

- **The 1-px black ink outlines dissolve.** They are the painting's structure,
  and they go from luma 20 to 24 — 50% lighter.
- **The walkable floor flattens.** A keeps 3.22% of pixel pairs varying; B is
  **97.3% perfectly flat**, replacing a 105.5→94.8 gradient with three plateaus
  at 103.9 / 101.0 / 93.1. That gradient is the floor's depth cue.

Tried: vtracer (5 configs direct, de-dithered, and on super-res), potrace hybrid,
autotrace (shattered). **Not tried: Vectorizer.AI and Illustrator Image Trace** —
no network or licence was used. No open tool does gradient meshes.

A hand-built gradient mesh would beat all of this — but that is **redrawing, not
tracing**, a different cost model across 304 backgrounds, and it lands squarely on
the Erna sign-off gate.

## 3. Coarse proxy geometry works

Depth Anything V2 Large reads the 1998 painting structurally correctly. Nine
RANSAC planes in (u, v, disparity) came out semantically right: back wall, posts,
ceiling, left wall, floor, four foreground masses.

A camera-pitch sign error was found and fixed mid-run — the tell was the floor
normal carrying an 8.6° Z-tilt. After the fix, floor = (−0.03, −1.00, 0.00) and
ceiling = (+0.04, +1.00, 0.00), exactly horizontal. Independent check: the solver
places the player at **1.77 m** where the cross-ratio says **1.75 m**.

### Parallax budget

Camera height 1.27 m; nearest proxy 2.82 m, farthest 6.92 m.

| lateral | differential parallax | interior disocclusion | biggest hole | proxy-vs-dense p95 |
|---|---|---|---|---|
| 5 cm | 8 px | 0.78% | 32×76 | 1.3 px |
| **10 cm** | **16 px** | **1.30%** | 37×127 | **2.5 px** |
| 20 cm | 32 px | 2.27% | 46×127 | 5.1 px |
| 40 cm | 65 px | 3.84% | 100×96 | 10.1 px |

**Recommended: ±10 cm lateral** (≈8% of camera height) — 16 px of differential
parallax reads as convincingly 3-D at ≤2.5 px p95 geometric error. ±20–25 cm is
the outer limit. **Dolly is ~6× cheaper than lateral** (20 cm dolly = 1.5% holes
vs 6.6%); vertical rise is worst. This is the number D3's camera drift should be
tuned against.

### Two kinds of hole, only one of which is a problem

- **Frame-edge reveal** — 2/3 of all holes. D4's authored 21:9 outpaint already
  covers it.
- **Interior disocclusion** — **saturates near 4–5%**, because the scene is a
  shallow box, and appears at an *enumerable* set of silhouettes: the hide, the
  rope, the cauldron, the bucket, the posts, the runestone.

That second point is the useful one. A one-time authored "what is behind this
object" fill per scene retires interior disocclusion permanently, rather than
needing a runtime inpainter. Fold it into the depth-authoring tool.

## 4. The GML cross-check: one agreement, one problem

**Agreement.** The 1998 walkable polygon `p_HjaVolvu` and the depth-derived
floor/wall junction agree to **mean −1.4 px** on a 600 px frame (0, 0, 0, −2, −4,
−6 px across the clean central span). The 1998 artists and a 2026 monocular depth
model independently place the same ground plane. That is the single strongest
piece of evidence that this pipeline is reading the original art correctly.

**Problem — see `docs/known-issues.md` §1.** `t_HjaVolvul` is one of the 23
terrains that *were* authored, and its ramp is a token 3%. Verified against the
GML this session:

```
<SimplePseudo3DTerrain name="t_HjaVolvul" scene="s_HjaVolvu" polygon="p_HjaVolvu"
	zmin="0" zmax="800" defaultscaling="1.0" scaling2="1.1" scanline1="500" scanline2="800"/>
```

`a = 1/3000`, `b = 5/6`; across the walkable polygon's actual y-extremes (507 to
601) that gives 1.0023 → 1.0337, a ratio of **1.031×**. The painting's own
perspective demands **1.63×**.

So known-issues §1 is worse than "61 terrains are missing calibration": at least
one of the 23 that *have* it carries a value that is not perspective at all.
Re-deriving scaling from proxy geometry is therefore a correction, not only a
gap-fill — and the census itself is now verified at **23 authored of 84, 61
flat** (three prior figures in this repo were wrong; see the commit).

## 5. Characters: he does not look like a sticker

The character vectorises in **56 paths** (potrace on the chroma alpha, vtracer on
the colour) against 13,866 that still fail on the background. That contrast is
the argument in two numbers, and it matches §1's 12-vs-160 colours exactly.

`out/90_walk_on_superres_A.mp4` — the player walks across HJAVOLVU under a
drifting camera with perspective-correct scaling, real depth occlusion (the right
post cuts across him) and a contact shadow. It reads as standing in the room.

Two results worth keeping:

- **On the vector background he looks *more* like a sticker.** His ink outlines
  are hard and black; the vector background's ink is now grey and thin, so nothing
  rhymes with him. On the super-resolved background the ink weights match. This is
  the same 1-px ink loss from §2, showing up as a character-integration failure —
  which is the opposite of what D2 predicted.
- **The contact shadow does most of the planting work.** Compare `_shadow` with
  `_noshadow`. Known-issues §1 is cheap and high-yield.

## 6. Recommendation, and the test that would refute it

**Reverse D2's vector decision for backgrounds; keep vectors for characters.**

The mechanism is not aesthetic preference. It is that the master is dithered
(§1), so tracing has no clean regions to find and destroys the 1-px ink lines
instead (§2) — and those ink lines are exactly what lets a crisp vector character
sit inside the painting (§5). D2's own goal, characters that belong in the scene,
is better served by *not* vectorising the scene.

Note what this does **not** overturn: D2's second half — 3-D geometry, projection
onto coarse proxy geometry — is confirmed working (§3, §4). Only the "vectorised
backgrounds" half is contradicted.

**The falsifying test, if you want one before deciding:** run Vectorizer.AI (or
Illustrator Image Trace) on `HJAVOLVU.PNG` and compare against
`A_superres/hjavolvu_high-fidelity-4x.png` at 1:1 on the beam crop and the floor
crop. If a commercial tracer holds the ink weight and the floor gradient, this
recommendation is wrong. Both are licensed products, so this needs Hjalti to run
it or to authorise the spend — it was deliberately not attempted here.

## Open questions for the owner

1. **D2** — reverse the background half, keep it, or run the Vectorizer.AI test
   first?
2. Hand-built gradient meshes are the only thing that beats super-resolution, but
   that is redrawing 304 backgrounds. In or out of scope?
3. Interior-disocclusion fills are authored per scene at an enumerable set of
   silhouettes. Does that go in the depth-authoring tool, and does authored
   "behind" art need Erna's sign-off like derived background art does?
