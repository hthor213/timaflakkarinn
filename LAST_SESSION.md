# Last session — 2026-08-06/07

## The milestone

**The game is live at https://tt.spliffdonk.com** (play) and
**https://tt-dev.spliffdonk.com** (debug). First time Tímaflakkarinn has been on
a real URL. Verified end to end: app shell, deep links, `image/png` backgrounds,
`audio/mp4` voice, valid Let's Encrypt on both.

Branch `feat/unify`, pushed to `git.spliffdonk.com`. Not merged to a trunk yet —
the repo's default branch question is still open.

## What happened

**Halldór's push arrived.** `origin/main` carried the TypeScript port, the
CFR-decompiled Java, and the GML — the engine source that `docs/project-state.md`
called the single biggest blocker. Source only: no ISO, no assets.

**The project was re-scoped from faithful port to remaster.** Continuous
character turning, cinematic camera, 3D toon characters on depth-layered painted
backgrounds, app-store publishing under a new HGG entity. Recorded in
`specs/000-timaflakkarinn-vision.md` (vision, D1–D6) and
`specs/001-architecture-and-plan.md` (layers, seams, pipeline, Phase 0–4).

**The repo was unified.** Two unrelated git histories — engine source in one,
188 MiB of LFS assets and docs in the other — merged into one tree. Neither could
run the game alone.

**Audio transcoded.** 668 WAVs → AAC-LC, 169.34 → 33.41 MiB (5.07×). Masters
mounted read-only and verified bit-identical afterwards.

## Bugs found and fixed

- **`getScaling` ignored `defaultScaling`** when a terrain had no calibration
  ramp, returning 1.0 instead. Characters rendered visibly too large on 18
  terrains. Fixed.
- **`webapp/public/gml` was a committed absolute symlink** into Halldór's home
  directory — broken in every clone but his. Fixed.
- **Duplicate `gml/`** after the merge; two copies of the content that could
  silently diverge. `web_import/gml` is canonical now.
- **Lowercase `.m4a` vs uppercase `resolvePath`** — would have 404'd every audio
  file on the case-sensitive server, fallen back to WAV, and found no WAVs.
  Silent total audio loss. Caught during deploy.
- **Missing assets were silent** (1×1 image / `null` audio, no warning). Now
  recorded and warned in the debug deployment.

## Bugs found and NOT fixed

- **Chapter container scoping — the top item.** All GML objects land in one
  global container that is never cleared, and `performSequence()` reads from it.
  88 of the 143 names shared by all four chapters have *differing* definitions,
  including `s_begin`/`s_always`/`s_prepare`. Forward jumps look fine; returning
  to an already-parsed chapter runs the wrong chapter's sequences. This blocks
  reliable chapter navigation, and Halldór's debug panel already exposes it.
- **No touch input at all.** Bindings are mouse-only, and `handleMouseDown`
  reads coordinates only `mousemove` writes, so a first tap lands stale.
- **`Pulser` loses its remainder** (`= 0` instead of `-= interval`), so subtitles
  drift progressively late against audio.
- **`Sequence` freeze race** — a single `frozenResolve` overwritten by concurrent
  waiters; a `thaw()` landing before the promise hangs that sequence forever.
- **Runtime chroma-key** — `getImageData` + synchronous `toDataURL()` re-encode
  per PNG, 545 PNGs. Worst mobile item; belongs in the asset pipeline.
- **Five hardcoded PNGs missing** — `WAIT`, `KLUKKA`, `SAVELOAD`,
  `COMMON/DIALOG`, `KRISTNIA/DIALOG`. Referenced by no GML, so the
  content-derived capture never saw them. Halldór has them.

## Start next session with

1. **Chapter container scoping.** It is what turns the new chapter URLs from
   bookmarks into navigation, and it is a real bug in normal play.
2. Pointer Events, then `Pulser` remainder, then the `Sequence` freeze race.
3. CI running `npm run check` on push.

## Needs a human

- **Renew the Forgejo credential on the homeserver** — expired; the deploy had
  to transfer the branch by git bundle. Blocks the next deploy.
- **Ask Halldór for**: the five hardcoded PNGs, the CD ISO, and — new and
  possibly worth more than the ISO — **the original Photoshop PSDs**, whose
  layers may already encode the depth separation D2 is trying to reconstruct.
- **Confirm with Halldór** the two content defects before anyone edits GML:
  the `q_Ahvarerhjorleifur` typo in `s_bless1` and the cut-scene reference
  `q_ToFjolin`.
- **Repo shape**: `feat/unify` needs a decision — does it become the trunk?
- **The remaster supersedes `docs/ownership-and-provenance.md`'s Phase 1
  framing.** The other IP owners have not been asked.

## Check status

`aidev check` is **red on one item**, deliberately: `lint_gml.py` reports 5
issues, all pre-existing 1998/1999 content gaps, none introduced by the rebuild.
Left red rather than relaxed — see the Done When note in `specs/001`.
`npm run check` (typecheck + 21 tests) is green.
