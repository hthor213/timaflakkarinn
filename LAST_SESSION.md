# Last session — 2026-08-08 (environment split)

## The milestone

**There is now a test environment.** Until this session `tt.spliffdonk.com` and
`tt-dev.spliffdonk.com` were **one Caddy block over one serving root** — "dev"
was a client-side debug flag reading the hostname, and both URLs served
byte-identical files from the same directory. Nothing could be tried anywhere
before the public saw it.

| Host | Env | Branch | Directory | Gate |
|---|---|---|---|---|
| `tt.spliffdonk.com` | prod | `main` | `/srv/timaflakkarinn/prod/{repo,web}` | `--promote`, plus Erna on art |
| `tt-dev.spliffdonk.com` | dev | `dev` | `/srv/timaflakkarinn/dev/{repo,web}` | none, deliberately |

`dev` and `main` are branches; the two server directories are **independent
clones**, not git worktrees — a worktree set cannot check out `dev` twice, and
the workspace is on `dev`. 425 MB each.

**The trunk question is closed.** `feat/unify` was renamed `dev`; `origin/main`
was a strict ancestor (54 commits behind, tip still the initial commit) so it
fast-forwarded cleanly. Stale `feat/unify` deleted from the remote.

**Deploying no longer ssh's into itself.** `deploy.sh` had
`SSH_HOST=hjalti@homeserver` and `REMOTE_REPO=/home/hjalti/work/timaflakkarinn`
— the working copy it ran from. Every `remote()` was a loopback ssh that died on
host key verification, and the "server has commits the laptop does not" guard
compared a directory to itself. It now detects that it *is* the deploy host and
runs the same snippets in a subshell. The ssh path is untouched for a real
laptop run.

**Correction to the previous brief:** it said the site was current as of
`aec43cc`. It was not. The deployed bytes were `473b5a8` — two hours later, and
the commit containing the screen-space picking fix. This was worked out by
correlating web-root mtimes against commit timestamps across two timezones,
which is why each root now writes **`/version.json`** recording env, branch,
commit and deploy time. "What is live?" is now a question with an answer.

Verified end to end this session: dev deploys clean at **26 checks**, prod
verifies clean at **14**, and the two hosts serve provably different content
from the same path.

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

**Everything above is browser-verified by real gameplay** (334 screenshots),
including the ones an earlier note wrongly listed as untestable: the Tyrkjaránið
raid firing from its real story beats with `a_Tyrki1` entering from off-screen,
both Lögberg parties walking off, Halldóra with no green flash, the `s_Kot` door
clickable, scrolling rendering cleanly across the full 1200px room, and the
non-scrolling HUD holding its exact screen position at both scroll extremes.

**Still unobserved:** `a_Tyrki2`/`a_Tyrki3` (their traverse is in
`s_UtanDanskaHusid`, not reached), and the drifting log, bottle and barrel. Four
of #17's nine frozen walks are now seen moving.

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

Two parallel tracks, agreed with the owner. **Both now have somewhere to land
that is not the public site** — this was the blocker the environment split
removed.

**How to ship, now:**

```
tools/deploy.sh --env dev                     # test site, no gate
tools/deploy.sh --env prod --dry-run          # see the plan
tools/deploy.sh --env prod --promote          # public
tools/deploy.sh --env prod --verify-only      # read-only health check
curl https://tt-dev.spliffdonk.com/version.json   # what is running there
```

Commit at milestones straight to `dev` and push; the deploy source is
`origin/<branch>`, so an unpushed commit is refused rather than silently
skipped. A range touching `web_import/GAME/` additionally needs the overlay
rebuilt (`tools/make-overlay.sh`) and, for prod, `--art-approved`.

**(a) Bug-test.** He plays through and reports; fixes land per the existing
taxonomy (`1998-bug` / `port-bug` / `missing` / `design-improvement`). Play in
properly rather than using the debug scene jump — the jump tunnels arrival state
and leaves no walkable player, which is what defeated two verification attempts.
Play on **tt-dev** now: it can carry a fix minutes after it lands, and prod stays
put until promoted.

**(b) Graphics.** Blocked on **D2**. Evidence page:
https://claude.ai/code/artifact/d37cdbfb-55b7-475d-9af9-8a8b79db4da3

1. **Decide D2.** Four routes are laid out in `specs/003` and the page above. The
   owner's own proposal — generate *surfaces* and keep the 1998 composition — is
   the strongest of them, because regenerating a whole background moved the
   horizon −60px and the horizon is the datum `scanline1/2/scaling2` calibrate
   against. Needs Erna, since it is new art.
2. **Create `art/` as the canonical location.** It does not exist yet. 128 MB of
   prototype output currently lives outside the repo in
   `timaflakkarinn-disc/work/prototype/out/` and is not committed. Proposed
   shape: `art/<SCENE>/{master,superres,generated,approved}/` — the axis that
   matters is which version Erna signed off, not which technique produced it.
   **`deploy.sh` already enforces that axis**: a prod range touching `art/`
   outside `art/<scene>/approved/` refuses without `--art-approved "<who, when>"`,
   which is then printed in the deploy report. The gate exists before the tree
   does, so the pipeline lands into a rule that already works.
3. **Audit the 23 authored terrains.** `t_HjaVolvul` ramps 1.031x where
   perspective wants 1.63x, so the problem is not only the 61 uncalibrated ones.
4. CI running `npm run check` on push.

## Needs a human

- ~~Forgejo credential~~ **RESOLVED 2026-08-07.** It had been deleted, not
  expired — see `docs/known-issues.md` #20. Token restored, transport is `fetch`
  again, and all 1,215 LFS files resolve as real blobs. The bundle fallback and
  its LFS-pointer limitation no longer apply; a commit touching an LFS-tracked
  file can ship, so the art pipeline's first derived background is not blocked
  on transport.
- **Do NOT ask Halldór for original assets.** He was never on the team — he is
  an enthusiastic customer who had the retail ISO and nothing else, and built
  the TypeScript port from it. Questions about 1998 intent, the PSDs, the
  dangling GML names and the missing hardcoded PNGs go to Hjalti and the
  original team, not to him.
- **The PSDs remain the highest-value unknown** — layers may already encode the
  depth separation D2 is reconstructing, possibly above 800x600.
- **Confirm with the original team (not Halldór)** the two content defects before anyone edits GML:
  the `q_Ahvarerhjorleifur` typo in `s_bless1` and the cut-scene reference
  `q_ToFjolin`.
- ~~**Repo shape**: does `feat/unify` become the trunk?~~ **RESOLVED 2026-08-08.**
  `dev` is the working branch and publishes to tt-dev; `main` is what the public
  sees. Promoting is a fast-forward of `main` and an explicit
  `tools/deploy.sh --env prod --promote`.
- **The first promote has not happened.** `main` is still at `ff1ebec` and prod
  is serving it. Everything since — the environment split, the deploy stamp, the
  rename — is on `dev` only. Nothing on `dev` changes the game itself: the built
  bundle is byte-identical (`index-BhmtPcbb.js` on both), so promoting is safe
  whenever wanted, and mostly just gives prod its `version.json`.
- **The WAV → AAC transcode is not a script.** It was run once by hand and the
  `ffmpeg` invocation survives only as prose in `specs/000`. The 668 derived
  files live in one gitignored directory on one machine. See known-issues #22.
- **The remaster supersedes `docs/ownership-and-provenance.md`'s Phase 1
  framing.** The other IP owners have not been asked.

## Check status

`aidev check` is **red on one item**, deliberately: `lint_gml.py` reports 5
issues, all pre-existing 1998/1999 content gaps, none introduced by the rebuild.
Left red rather than relaxed — see the Done When note in `specs/001`.
`npm run check` (typecheck + 106 cases across 15 files) is green.
