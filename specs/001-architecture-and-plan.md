# 001 — Architecture and plan of execution

Status: **draft**, 2026-08-07. Implements the vision in
[000](000-timaflakkarinn-vision.md). Scope: Icelandic first; the English overdub
is parked and does not constrain Phase 0–1 beyond the seams noted below.

## The governing principle

**The classic game is never removed.** Every remaster capability lands *behind an
interface*, alongside the 1998 behaviour rather than in place of it.

Three things follow, and they are the reason this plan is shaped the way it is:

1. There is a shippable product at every point after Phase 1
2. The classic/remastered toggle is a consequence of the architecture, not a
   feature someone has to build later
3. The IP owners can evaluate quality by flipping a switch

## Layers

| Layer | Contents | Disposition |
|---|---|---|
| **Content** | 6 GML chapters, 1 211 assets | **Sacred.** Edited only to fix authored defects (e.g. terrain calibration), never restructured |
| **Interpretation** | `GMLParser` → object graph | Keep. Extend for new element types only |
| **Simulation** | `World`, `Pulser`, `Sequence`/`Quantum`, `StateController`, `Terrain`, `Inventory`, save/load | Keep. Fix known defects. **This plus Content is the game** — it is what every alternative stack would have forced us to rewrite |
| **Presentation** | Renderer, animation, audio spatialisation, camera | **Swappable.** Classic and remastered implementations coexist |
| **Platform** | Web, iOS, Android; asset delivery; save sync | New. Thin |

## Seams

Four interfaces carry the whole plan. One exists; three are new.

| Seam | Implementations | Status |
|---|---|---|
| `ActorFace` | `CelledAnimated2D` (classic) · `Rigged3D` (remaster) | **Exists** (`ActorFace.ts:7`). Enables per-character increments |
| `RenderBackend` | `Canvas2D` (classic) · `WebGL` (remaster) | New. Keeps the renderer swap from being a stop-the-world rewrite |
| `AssetSource` | `Bundled` · `OnDemandPack` | New. Web lazy-load, iOS ODR and Play Asset Delivery are one abstraction |
| `SaveBackend` | `IndexedDB` · `iCloud` · `PlayGames` | New. Cheap now, expensive to retrofit |

`ActorFace` is the important one: it turns a 46-character remaster into 46
independent, reversible, individually shippable increments.

## Asset pipeline

A new subsystem at `tools/pipeline/`. It **never writes to the masters** — that
rule was enforced at the kernel level for the audio run and stands permanently.

```
web_import/GAME/  (LFS masters, immutable)
        │
        ├── audio transcode            AAC-LC m4a — DONE (5.07x, 33.4 MiB)
        ├── chroma-key bake            green → alpha at build time
        ├── background super-res       ~4x
        ├── proxy geometry             coarse mesh + ground plane
        └── pack + manifest            per chapter × per language
        │
        ▼
web_import/GAME_BUILD/  (derived, gitignored, regenerable)
```

Per-chapter packing is not an optimisation. Store install limits require it once
backgrounds are super-resolved, and it is the same mechanism as web lazy-loading.

## Plan of execution

### Phase 0 — Foundation

Unblocks everything. No new capability; existing capability made correct.

- [x] Unify the two git histories into one tree
- [ ] `npm install`, run the game, capture a baseline
- [ ] CI: typecheck + build (there is none today)
- [x] **`getScaling` fallback** — restore Java's `a == 0 → defaultScaling`.
      Characters render visibly too large on the 18 flat terrains authored at
      `defaultscaling` 0.6–0.9
- [ ] **`Pulser` remainder** — `accumulated -= interval`, not `= 0`. Subtitles
      drift late against audio
- [ ] **`Sequence` freeze race** — single `frozenResolve` overwritten by
      concurrent waiters; a `thaw()` before the promise hangs forever
- [ ] **Asset failures warn in dev** — silent 1×1/`null` fallbacks are why five
      missing PNGs went unnoticed for years
- [ ] **Pointer Events** — no touch input exists; `handleMouseDown` reads
      coordinates only `mousemove` writes, so first tap lands stale
- [ ] **`.m4a` extension mapping** in `resolvePath` — the transcode is inert
      without it
- [ ] `tools/lint_gml.py` takes `src/` as a second oracle for hardcoded assets

**Done when:** the 1998 game runs on desktop and on a phone by touch, characters
are the size authored in 1998, and `lint_gml.py` is clean.

### Phase 1 — Classic, shippable

The faithful port. Gates the open-source trigger, **and** is the instrument that
generates the rest of `docs/what-bugged-us.md` — those requirements cannot be
gathered without a playable build.

- [ ] Depth authoring tool (see 000) → 60 terrain calibrations + depth ordering
- [ ] Contact shadows — highest perceptual win per unit effort
- [ ] `GuessQuantum`: dialog, `trim()`, `erna`, plus the Irna response
- [ ] Recover the five hardcoded PNGs from Halldór
- [ ] Per-chapter lazy loading; cache eviction (decoded audio is float32 PCM —
      compression does nothing for resident memory)
- [ ] `AssetSource` + `SaveBackend` seams introduced
- [ ] Capacitor shells; store builds
- [ ] Full playthrough, phone, touch only, zero exceptions

**Done when:** Tímaflakkarinn Classic ships in Icelandic on web, App Store and
Google Play.

### Phase 2 — Remaster foundation

One scene, at product quality. This is the style-clash test with real stakes.

- [ ] `RenderBackend` seam; WebGL backend behind it
- [ ] Background pipeline: super-res + proxy geometry, one scene
- [ ] Camera system: drift, rack focus, cuts
- [ ] Classic/remastered runtime toggle

**Done when:** `HJAVOLVU` renders remastered at 60 fps on a phone, toggles to
classic in the same build, and does not look like a sticker on a painting.

### Phase 3 — Character remaster

Rolling and incremental, one character at a time behind `ActorFace`. Order by
screen time: HJALTI, SIGRUN, GISSUR, VIFILL, INGOLFUR — five characters are ~40%
of all animation cells.

- [ ] 3D toon pipeline seeded from the 1998 orthographic turnarounds
- [ ] Rig + curves derived from the existing 8-frame cycles (preserves the
      original animator's timing)
- [ ] Continuous turning, look-at
- [ ] `SetSpeedQuantum` authored into content — **no character has ever walked at
      other than default speed**, so speed-dependent gait needs content, not just
      animation

### Phase 4 — Extensions

- [ ] Eye-wander idle hints (needs a new authored salience layer)
- [ ] Atmospheric perspective
- [ ] English overdub (parked; seams in Phase 1 keep it cheap)

## Sequencing rationale

Phase 0 before all else because **you cannot gather remaster requirements from a
build you cannot play**, and because shipping the classic keeps a working product
under every subsequent change. Phase 2 is deliberately one scene: the
style-clash risk is the project's largest unknown and it is answerable for the
cost of a single background.
