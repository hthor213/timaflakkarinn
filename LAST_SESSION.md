# Last session — 2026-08-06/07

## The milestone

**The game is live at https://tt.spliffdonk.com** (play) and
**https://tt-dev.spliffdonk.com** (debug). First time Tímaflakkarinn has been on
a real URL. Verified end to end: app shell, deep links, `image/png` backgrounds,
`audio/mp4` voice, valid Let's Encrypt on both.

Branch `feat/unify`, pushed to `git.spliffdonk.com`. Not merged to a trunk yet —
the repo's default branch question is still open.

**The site is current as of `aec43cc`.** Deployed via the new `tools/deploy.sh`
and verified: 16 checks passed, gml served byte-identical to master with CRLF
intact, SPA fallback working, missing assets still 404ing. Everything from the
overnight session is playable — the Völva prompt, the Irna response, the pointer
and hit-box fixes, bold-on-hover, spacebar-as-right-button, touch input, the
Pulser cadence and the freeze escape.

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
  to an already-parsed chapter runs the wrong chapter's sequences.
- **Moonwalking.** The player's feet cycle faster than he crosses the screen.
  Classified `1998-bug` by the owner, who confirms it annoyed the team at the
  time. Logged deliberately unworked — it wants the new walk system, not a patch.
- **Walking into Hallveig** — he keeps pushing for several seconds as if trying
  to walk through her. `1998-bug`, deferred to Phase 2.
- **Runtime chroma-key** — `getImageData` + synchronous `toDataURL()` re-encode
  per PNG, 545 PNGs. Worst mobile item; belongs in the asset pipeline.
- **Green speckles** — residual green at 118px on 13 sprites. Distinct from the
  dialogue-start green flash, which is under investigation.
- **Five hardcoded PNGs missing** — `WAIT`, `KLUKKA`, `SAVELOAD`,
  `COMMON/DIALOG`, `KRISTNIA/DIALOG`. Referenced by no GML, so the
  content-derived capture never saw them. Halldór has them.

## Fixed since that list was written

Touch input (Pointer Events throughout), the `Pulser` remainder, the `Sequence`
freeze escape, the cursor hotspot, measured dialogue hit boxes, bold-on-hover,
the animation last-frame hold, scene jump, the Völva soft-lock, and the Irna
near-miss response.

Then, in the morning pass — four bugs where the *diagnosis* was the work:

- **Boxless actors could not move at all.** Java validates a move only when the
  state declares a collision box; the port tested the terrain unconditionally.
  Ingólfur never walked onto the deck, so the öndvegissúlur throw happened
  off-screen — the reported "missing animation" was never an animation bug. Nine
  such walks across three chapters were frozen. Only Ingólfur is browser-verified.
- **Chapter scoping.** 1999 emptied its container at every screen transition and
  re-parsed; the port kept the container and dropped the clear. 111 keys are
  shared across all four chapters and **90 differ once closed over the names they
  reference** — `s_prepare` is spelt identically in all four and is a different
  sequence in each. Two further `SaveSerializer` bugs fell out of it.
- **Chroma-green subtitles.** The earlier fix guarded the `r/g/b` spelling but
  not `color="green"`, which resolves to the same triple. Halldóra was flashing
  green on all 19 of her lines in Tyrkjaránið, unreported.
- **Green speckles.** Not anti-aliasing — 8-bit palette drift, 12 files and 116
  pixels. Keyed at tolerance 16, chosen because distances 12–18 do not occur.
- **Actor picking ran in world space while painting ran in screen space.** Not
  oversized hitboxes, as first logged — displaced ones. **89 of 92 clickable
  actors on scrolling terrains were unpickable at some scroll offset**; the
  `s_Kot` door was unpickable at every offset and every pixel. Walking kept
  working because `StateController` added the scroll and `Actor` did not, which
  is why it looked capricious.

Test suite went from 21 cases to **106 across 15 files**.

**Browser-verified:** the chapter round-trip (three ways), and **Ingólfur's
öndvegissúlur throw — the original report — seen on screen**, pillar leaving the
deck with the two walk quanta 4.5s apart where they used to be simultaneous.
Also bold-on-hover tracking each line's own width, no green flash for Karli, and
the cursor under the pointer.

**Not browser-verified, and listed as such:** the Tyrkjaránið raiders, the
Lögberg walk-offs, the drifting log/bottle/barrel, and the picking fix under
actual scroll. All blocked by trigger-reachability — the debug scene jump
tunnels arrival state instead of replaying the chain that sets up a walkable
player. A real playthrough into `s_Kot` closes all of them at once.

**Tooling:** `tools/deploy.sh` landed complete, and a SIGPIPE race in its verify
stage is fixed — it passed twice then failed three times running, which is the
worst failure mode a deploy tool can have.

## The 2.8D prototype — read `specs/003` before deciding anything

The prototype came back with a result that contradicts **D2**, which is an owner
decision and was therefore *not* changed. The short version: the 1998 master art
is Floyd–Steinberg dithered (160 colours, 73% of adjacent pixels differ, median
constant run 1px), so vectorising it traces the noise — it dissolves the 1px ink
outlines and flattens the floor gradient into plateaus. The character sprites are
12 colours and vectorise beautifully. Counterintuitively, the character looks
*more* like a sticker on a vector background, because his hard black ink no
longer rhymes with anything.

D2's other half — 3D geometry on coarse proxies — is confirmed working. The
depth-derived ground plane agrees with the 1998 walkable polygon to mean −1.4px.
Recommended camera budget: **±10cm lateral**, 16px differential parallax.

## Start next session with

1. **Decide D2** using `specs/003`. Everything in the art pipeline waits on it,
   and the falsifying test is named there (Vectorizer.AI on `HJAVOLVU.PNG`) if
   you want one more data point before committing.
2. **Audit the 23 authored terrains.** `t_HjaVolvul` ramps 1.031x where
   perspective wants 1.63x, so the calibration problem is not only the 61
   missing ones.
3. **Browser-verify the eight unwatched walks.** The Tyrkjaránið raiders
   entering frame is the one to look at first — verified arithmetically only.
4. CI running `npm run check` on push.

## Needs a human

- **Renew the Forgejo credential on the homeserver** — still expired; deploys
  fall back to a verified git bundle, which works for code and GML. But a bundle
  carries LFS *pointers*, not blobs, so **no commit touching an LFS-tracked file
  can ship at all** until this is renewed. That becomes hard-blocking the moment
  the art pipeline emits its first derived background.
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
`npm run check` (typecheck + 97 cases across 14 files) is green.
