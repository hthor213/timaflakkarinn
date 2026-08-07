# 002 — Vectorized backgrounds: how, and how well

Status: for owner review, against D2 as amended in `specs/000-timaflakkarinn-vision.md`
(owner decision, 2026-08-07 — verified in the file directly, not taken on
relay: D2 now reads "vector is the chosen direction," with your two stated
grounds — no physical artefact to lose, and Erna's sign-off replaces fidelity
as the deciding argument — and it already records the same falsifying test I
land on below, so this brief exists to put numbers and named tools behind it,
not to re-litigate it).

D1 is unchanged and not in question — characters stay 3D toon-shaded. One
line worth keeping from the earlier pass: no shipping 2D vector rig (Live2D,
Spine, Rive) does true continuous body rotation without per-angle art; all of
them fake shallow depth with 2.5D parallax tricks on a flat drawing. That's
consistent with why D1 exists and needs no further scrutiny here.

This brief is scoped to what's actually open: **the direction is decided,
the comparison hasn't been run.** Below is what tools and techniques exist,
what they cost per image across 304 backgrounds, what changes at runtime,
and a concrete recipe for the one-image test D2 already calls for.

## Recommendation

**Run the falsifying test in D2 before committing the full 304 — and run it
as a three-way comparison, not two-way, because the honest fidelity ceiling
for vectorizing painterly art depends entirely on which tool tier you use,
and the tiers differ by roughly an order of magnitude in effort.** The cheap,
automated tier (a modern AI vectorizer) is what "vectorize 304 backgrounds"
actually means at scale; the expensive, semi-manual tier (gradient mesh) is
what "true painterly fidelity" actually requires. Whether those are the same
tier is exactly the open question, and it's cheap to find out on one image
before finding out on 304.

Separately, and worth knowing before you scope the work: **the runtime cost
of "vector backgrounds" is, in the standard engineering path, identical to
the raster path** — WebGL has no native SVG support, so a vector background
gets rasterized to a texture once, same as a super-resolved PNG would be.
"True resolution independence" only becomes real at runtime if you invest in
a GPU vector renderer instead of the bake-once path, which is a materially
larger and unproven-at-this-content-scale piece of engineering (detail in
§4). The vector direction's cost lives almost entirely in the art pipeline,
not the renderer — which is good news, because it means the falsifying test
tells you the real cost before any engine work starts.

---

## 1. What quality ceiling does vectorizing painterly art actually hit?

Two real, very different tiers exist, and sources disagree with each other
across them — which is itself the finding.

**Tier 1 — automated AI vectorizers (Vectorizer.AI, Recraft, similar).**
Fast, one image in seconds, no manual work. Reviews of current tools claim
Vectorizer.AI "handles tricky gradients better than almost anything" and
Recraft blends generation with vectorization. [Best AI image vectorizers 2026, Recraft blog](https://www.recraft.ai/blog/best-image-vectorizers), [PerfectVector comparison](https://perfectvector.com/blog/best-ai-vectorizers-2026)
But this sits against an older, consistent finding from the general
vectorization literature: contour-tracing tools quantize an image into N flat
color regions and outline them, which is why they're "great for logos and
cel art, poor for anything with continuous tonal variation," and
photorealistic tracing with fine gradient control is "the exception where
manual work still wins over AI conversion." [Vectosolve: vectorizing a painting](https://vectosolve.com/guides/en/vectorize-a-painting)
Both claims can't be fully true for the same content at once. The honest
read: modern neural vectorizers are meaningfully better than 2010s-era
Illustrator autotrace at gradients, but nobody's marketing copy is a
substitute for looking at your own painted scenes run through the tool —
which is exactly why the one-image test matters more than the literature
review.

**Tier 2 — gradient mesh (Illustrator manual, or semi-automated research
tooling).** This is the technique that actually reproduces smooth painterly
gradients as vector, because a gradient mesh is a deformable grid of color
patches rather than a flat-fill region. A Microsoft Research paper on
automated gradient-mesh generation reports a test case reconstructing a
photograph with an 18×15 mesh at 0.6-pixel error — genuinely high fidelity —
but the method still requires the user to interactively specify a few guide
lines per image, and is explicitly framed against the alternative of "many
hours" of fully manual mesh work in Illustrator. [Sun, Liang, Wen, Shum — Image Vectorization using Optimized Gradient Meshes, SIGGRAPH 2007](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/imagevectorization_siggraph07.pdf)
That semi-automated technique is nearly 20 years old and not a shipping
one-click tool today as far as I could find — it would need to be
approximated with manual Illustrator gradient-mesh work, which practitioners
independently describe as "very time consuming... unsuitable for commercial
projects" at any real scale. [ITS: gradient mesh guide](https://it-s.com/how-to-create-a-gradient-mesh-in-illustrator/)

**So the quality ceiling is real and high — but only at the tier that doesn't
scale to 304 images without a large time budget.** The tier that scales
(Tier 1, automated) has a contested, unverified quality ceiling on this
specific art. That gap is the whole reason the test in §5 exists.

## 2. "Vector plus texture" — what does that actually mean in practice?

What you asked for isn't pure vector; it's vector structure with texture on
top, and that's a normal, real technique with a normal, real cost profile:

- **Base layer**: flat or gradient-mesh vector fills carry color, large-scale
  shading, and shape — this is the part that's genuinely resolution-independent.
- **Texture layer**: a raster grain/brush-texture pattern (or SVG `<pattern>`
  referencing a small raster tile, or filter noise) laid over the vector
  fills in multiply/overlay mode, to put painterly texture back that flat or
  meshed vector fills don't have on their own. This is standard practice in
  stylized illustration and games that want a "flat but not sterile" look.

**The honest caveat**: that texture layer is itself raster. If it's a small
tiled pattern, it scales fine (tiling is resolution-independent by
construction). If it's meant to carry Erna's actual painted brush texture
rather than a generic grain, it's back to being a raster asset at a fixed
source resolution, same as today — meaning the *background* becomes
resolution-independent but the *texture on the background* doesn't, unless
the texture is also synthesized generically rather than sourced from her
paintings. That's a real design choice hiding inside "vector plus texture,"
worth surfacing to her directly: is the goal to preserve her actual brush
texture, or to give the vector art painterly *character* generically? Those
are different pipelines with different costs, and only one of them keeps her
specific hand in the final image.

**What it looks like at 4K and beyond**: sharper in the flat/gradient-mesh
regions (genuinely, because vector data has no native resolution ceiling),
but the texture layer's own resolution becomes the new bottleneck exactly
where the eye would otherwise notice — which is where "sharper" and
"different" stop being distinguishable in the abstract and need to be looked
at, per D2's own framing of the risk.

## 3. Per-image effort across 304 backgrounds

**ESTIMATE — wide range, explicitly not a measurement of your actual art:**

- Tier 1 (automated vectorizer + spot review): basis is that this is
  essentially a batch job plus a human glance per image, similar in shape to
  the "one automated pass" D2 already described for super-resolution.
  Roughly **15–30 minutes/image** of human time (run tool, check output,
  flag failures for a second pass) → **~75–150 hours across 304 images**.
- Tier 2 (gradient-mesh-quality manual/semi-automated pass, only where Tier 1
  fails Erna's eye): basis is general freelance vector-illustration market
  rates for complex scene work ($1,000–$5,000/project for intricate
  illustration) and independent practitioner accounts that gradient-mesh work
  is measured in hours, not minutes, per image. [Illustration cost guide](https://www.noboringdesign.com/blog/illustration-costs), [Guru: illustrator pricing](https://www.guru.com/blog/how-much-do-illustrators-charge-per-image/)
  Roughly **2–6 hours/image** → **~600–1,800 hours if applied to all 304**,
  which is not a realistic full-set plan — it's the cost of the fallback for
  whatever fraction of images Tier 1 can't handle. If Tier 1 handles, say,
  80% of scenes acceptably and Tier 2 is needed for the remaining 20%
  (~60 images), that's **~120–360 additional hours** on top of Tier 1's pass.

The swing between "150 hours" and "1,800 hours" is the entire reason not to
commit to vectorizing all 304 before the one-image test tells you which tier
your actual art needs.

## 4. Runtime cost — this is where "true resolution independence" gets tested

**Standard path (rasterize once): no runtime cost difference from today's
raster plan.** WebGL has no native SVG support — the browser/engine
rasterizes SVG to a canvas/bitmap and uploads that bitmap as a texture, same
as any PNG. [three.js forum: SVG-based texture scaling](https://discourse.threejs.org/t/svg-based-texture-scaling/15134), [mrdoob/three.js SVG-as-texture issue](https://github.com/mrdoob/three.js/issues/1317)
That means a vector background projected onto D2's proxy geometry, using the
standard/cheap engineering approach, is baked to a fixed resolution at build
time or load time — mechanically the same operation as baking a
super-resolved PNG, with the same texture memory and GPU cost on a
mid-range phone. **This is the finding worth being direct about: the "ages
better against future higher-res displays" benefit is not automatic. It only
exists if you re-bake the vector source at a higher resolution for a future
target — which you could also do by re-running super-resolution at a higher
factor on the raster masters. Vector doesn't remove the need to pick a bake
resolution; it just moves where in the pipeline that choice gets made.**

**The path that would deliver genuine runtime resolution independence**
exists — GPU vector rasterizers like Pathfinder render paths "fully
resolution independent... prepared once and rendered at any zoom level
without loss of quality," and can render vector meshes inside a 3D scene
like Pathfinder 2's stated support for vector paths "in 3D environments."
[Pathfinder: GPU rasterizer for fonts and vector graphics](https://github.com/Pctg-x8/pathfinder)
But every source I found demonstrating this class of renderer targets fonts
and UI-scale vector art — small numbers of paths, sharp edges, no
gradient-mesh-scale painterly complexity. I found no example of this
technique applied to full-bleed, gradient-heavy painted scenes at
texture-fill scale, let alone 304 of them, live, on a mid-range phone.
Building and validating that pipeline is real engineering work with no
existing proof point at this project's content scale — **flagging this as
unverified, not as ruled out.**

**Net for the store targets (App Store / Google Play, mid-range phones)**:
the cheap path ships something with identical runtime cost to the raster
plan and a quality ceiling gated on §1's open question. The path that
actually delivers the stated benefit (true independence, not a re-bakeable
ceiling) is unbuilt and unproven at this scale. Neither point changes the
decision — it changes what "vectorize the backgrounds" should be scoped and
budgeted as: an art-pipeline cost now, and optionally a separate, larger
rendering R&D bet later if the future-display argument turns out to matter
in practice.

## 5. The falsifying test — concrete recipe

D2 already specifies the shape of this test; here's exactly how to run it.

**Scene**: `HJAVOLVU` — already the project's own reference scene (it's the
literal "Done When" test case in `specs/000-...md`), so using it here avoids
a second debate about which background to pick.

**Steps**:
1. Take the 800×600 master PNG for `HJAVOLVU` (copy, not the LFS master —
   masters are never written to).
2. Produce the raster baseline exactly as D2's resolution fix already
   specifies: one AI super-resolution pass to ~4× (3200×2400). Candidate
   tools: Real-ESRGAN (open, scriptable) or Topaz Gigapixel (commercial,
   tuned for painted/illustrated source). If the pipeline tool isn't chosen
   yet, run both — it's one image.
3. Produce **two** vector variants, not one, so the comparison spans the
   real cost range from §1 and §3:
   - **3a. Tier 1**: run the same PNG through a current AI vectorizer
     (Vectorizer.AI or Recraft) at default photo/gradient settings. This is
     what "vectorize 304 backgrounds" costs at scale if it works.
   - **3b. Tier 2**: a time-boxed (~2 hour) manual gradient-mesh pass in
     Illustrator on the same image, or a semi-automated equivalent if
     available. This is the fidelity ceiling — what you're buying if Tier 1
     isn't good enough.
4. Render all three (3200×2400) onto the same proxy-geometry test scene at
   the actual in-engine camera framing, not just side-by-side flat images —
   the comparison that matters is what it looks like in the game, under
   D3's actual camera, not at 100% crop in an image viewer.
5. Crop three representative regions from each: a smooth gradient area (sky
   or shadow falloff — the adversarial case), a hard-edged prop (the easy
   case, useful as a sanity check that nothing regressed), and a textured
   foreground surface (grass, stone, wood grain — tests the "plus texture"
   question from §2).
6. Show Hjalti and Erna the three-way grid together, and ask the specific
   question D2 already poses: **does the vector version look sharper, or
   does it look different?**

**Decision rule this produces**: if 3a (Tier 1, cheap) passes Erna's eye,
the vector direction is viable at the ~75–150 hour scale from §3 and the
decision is cheap to execute across all 304. If only 3b (Tier 2, expensive)
passes, you now have a real number — not an estimate — for what "vectorize
everything" actually costs, and that number, not the format preference,
should decide whether it's all 304 or a prioritized subset (the same
front-loading logic already used for characters in the art budget table
would apply here too).

---

## What I looked for and couldn't verify

- A direct, current (2026) side-by-side of a modern AI vectorizer against
  the same painterly source at gradient-heavy regions — every source found
  was either a tool's own marketing claim or a general discussion of older
  contour-tracing behavior. This is precisely the gap §5's test closes.
- Any shipping example of live GPU vector rendering (Pathfinder-class)
  applied to full-scene painterly textures at production scale on mobile —
  found strong evidence for font/UI-scale use, none for this content class.
- A number for how much of the 304-background set would realistically need
  the Tier 2 fallback — genuinely unknowable before the art itself is run
  through Tier 1, which is the point of testing one image before all 304.
