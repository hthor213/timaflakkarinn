# 001 — Architecture and plan of execution

Status: draft

Implements the vision in [000](000-timaflakkarinn-vision.md). Scope: Icelandic
first; the English overdub is parked and does not constrain Phase 0–1 beyond the
seams noted below.

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

**Pipeline requirement: derived assets keep the ISO 9660 uppercase convention.**
`AssetLoader.resolvePath` uppercases every path, because the 1998 content is an
ISO 9660 tree. The audio transcode emitted lowercase `.m4a`, which on a
case-sensitive filesystem means every request 404s, the content-type probe falls
back to `.WAV`, and the WAVs are not in the serving tree — **total silent audio
loss, with nothing raising an error.** Caught during the first deploy, before it
shipped. Any stage that emits derived files must uppercase the extension.

## Deployment

Live since 2026-08-07. **Two real environments since 2026-08-08.**

| Host | Env | Branch | Directory | Gate |
|---|---|---|---|---|
| `tt.spliffdonk.com` | prod | `main` | `/srv/timaflakkarinn/prod/{repo,web}` | `--promote`, plus Erna on art |
| `tt-dev.spliffdonk.com` | dev | `dev` | `/srv/timaflakkarinn/dev/{repo,web}` | none, deliberately |

Until 2026-08-08 these were **one Caddy block over one serving root**. "Dev" was
a client-side debug flag reading the hostname, so both URLs served byte-identical
files from the same directory — there was no test environment, and nothing could
be tried anywhere before the public saw it. They are now two of everything:
own checkout, own serving root, own branch, able to sit at different commits.

The Caddy handlers live in a **shared snippet** imported by both site blocks, so
there is exactly one copy of the cache and charset rules. Every one of them is
load-bearing; two hand-maintained copies would drift, and silently.

Cloudflare A records are **DNS-only (grey cloud)**, matching every other record
in the zone — Caddy needs HTTP-01 to reach the origin for Let's Encrypt.

Each serving root's `GAME/` is a **hardlink overlay**: images from that
environment's own `web_import/GAME`, audio from `web_import/GAME_M4A`, WAVs
excluded. It is what actually realises the 169 → 33 MiB audio win. Built by
`tools/make-overlay.sh`, which until 2026-08-08 did not exist — the overlay was
made by hand and existed only on the machine that made it, which is precisely
why a second serving root could not be created. The whole dev root costs 21 MB:
the audio is shared inodes with prod, only the PNGs are distinct, because each
root's art links into its own checkout so it tracks its own branch.

**`web_import/GAME_M4A` is gitignored and is NOT in a fresh clone.** It is
derived from the WAV masters, so it is build output and correctly uncommitted —
but that means it exists in exactly one directory on one machine, and an overlay
cannot be built anywhere that lacks it. See known-issues #22.

### What ships, and how you know

The deploy source is **`origin/<branch>`**, not anyone's working copy. Two
checkouts pull from one Forgejo, so the hub is the only thing they agree on, and
prod is normally deployed from a workspace sitting on `dev`. The workspace is
checked only when it happens to be on the branch being deployed — then it must
be clean *and* pushed, or what you are looking at is not what will ship.

Each deploy writes **`/version.json`** into its own serving root: env, branch,
commit, subject, deploy time. Before this, "what commit is live?" had no answer —
working it out meant correlating web-root mtimes against commit timestamps, and
this document's own session brief had drifted to naming the wrong commit as live
because of it. Caddy serves it from an explicit handler with `no-store`; it must
not fall into the SPA catch-all, or a root without the file answers `200` with
`index.html` and anything asking "what is deployed?" reads a web page as an
answer. That was observed on `tt.spliffdonk.com` before the handler existed.

### The promote gate

`prod` is the public site, and reaching it is a decision rather than a default:

- **`--promote` is required.** Nothing gets there by momentum.
- **A range touching art needs `--art-approved "<who, when>"`**, and the text is
  printed in the deploy report. Art paths are `web_import/GAME/**` and `art/**`
  outside `art/<scene>/approved/` — the approved/ axis from specs/003 is the
  whole point, so only what a human has looked at passes freely. `art/` does not
  exist yet, so today the rule bites only on `web_import/GAME`.
- **`dev` has no gate at all**, deliberately. Testing must never wait on a
  sign-off.

Caddy handles `/GAME/*`, `/gml/*`, `/video/*` and `/assets/*` **before** the SPA
fallback, so a missing asset returns a real 404 instead of being masked by
`index.html`. `try_files {path} /index.html` on the catch-all is what makes
`/chapter1..4` work at all.

### Deploy rules, learned the hard way

**Never copy `dist/GAME` or `dist/gml` into the serving root.** Vite dereferences
the symlinks in `webapp/public/`, so `dist/GAME` is the raw 1 213-file tree with
668 WAVs and no `.M4A` — a plain `cp -r dist/*` silently reintroduces 169 MiB of
WAV and destroys the uppercase-`.M4A` overlay.

**But `gml/` in the serving root is an independent copy, not a hardlink**, and it
*does* need refreshing whenever content changes — from `web_import/gml`, the
authoritative source, never from `dist/gml`. This was discovered on the first
deploy that changed a `.gml`: refreshing only assets/index.html/_headers/video
would have shipped stale scene files and made a landed fix look broken. Making
those copies symlinks into `web_import/gml` would remove the failure mode
permanently; not yet done.

**`webapp/public/_headers` is inert.** It is a Netlify/Cloudflare-Pages
convention and Caddy never reads it. Every live cache and charset rule comes from
`/etc/caddy/Caddyfile`; the file is published for documentation only. An earlier
revision of this document said the gml charset was set "per `_headers`", which
was wrong.

**Changing a GAME master makes the serving root stale, silently.** The overlay is
hardlinks *into* the checkout, and git **replaces** a changed file rather than
writing through it — so new art lands on a new inode while the serving root
keeps pointing at the old one. New art in the repo, old pixels on screen, and
not one error anywhere. `tools/deploy.sh` refuses when the range touched
`web_import/GAME/` and names the `make-overlay.sh` command to fix it. It checks
this *after* transport, since only then does the checkout hold the art to
rebuild from.

**A git bundle cannot carry LFS blobs.** This mattered while the server's Forgejo
credential was dead: a bundle carries git objects, but LFS content lives behind
the same endpoint, so a commit touching an LFS-tracked path would check out a
130-byte pointer where art belongs. `tools/deploy.sh` refuses rather than doing
that. **Resolved 2026-08-07** — the token had been deleted, not expired
(known-issues #20); transport is `fetch` again and all 1,215 LFS files resolve as
real blobs. The bundle path remains as a fallback and for a genuine remote
deploy; it is no longer the normal case.

**Do not ssh to yourself.** `deploy.sh` shipped with `SSH_HOST=hjalti@homeserver`
and `REMOTE_REPO=/home/hjalti/work/timaflakkarinn` — the very working copy it ran
from. Every `remote()` was a loopback ssh that died on host key verification, and
the "server has commits the laptop does not" guard compared a directory to
itself. The script now asks whether it *is* the deploy host and runs the same
snippets in a subshell when it is. The ssh path is unchanged for a real
laptop-to-server run.

**Cache headers must match how a file is named.** `/assets/*` is content-hashed,
so `immutable` is correct. `/gml/*` is **not** hashed, so it revalidates
(`no-cache` + ETag) — otherwise a browser runs a new bundle against an hour-old
scene file, which looks exactly like a regression and wastes a bug report.

### Server-side debt

- **The Forgejo credential on the homeserver was deleted, not expired.** The first deploy
  transferred the branch by verified git bundle instead. Renew before the next.
- The server's clone had a **disjoint history** predating a remote rewrite; it
  now tracks `feat/unify`, with the prior state saved to
  `/home/hjalti/work/PRE_UNIFY_HEAD.txt`.

## Plan of execution

### Phase 0 — Foundation

Unblocks everything. No new capability; existing capability made correct.

- [x] Unify the two git histories into one tree
- [x] `npm install`, build, capture a baseline — typecheck clean, build green,
      dev server verified serving chapters, backgrounds, voice and the cursor
      through the symlinks
- [ ] CI: typecheck + build + test on push (there is none today; `npm run check`
      exists and is what CI should run)
- [x] **`getScaling` fallback** — restore Java's `a == 0 → defaultScaling`.
      Characters render visibly too large on the 18 flat terrains authored at
      `defaultscaling` 0.6–0.9
- [x] **Play/debug deployments + chapter routing** — `tt.spliffdonk.com` (play)
      and `tt-dev.spliffdonk.com` (debug) from one artifact; `/chapter1..4`,
      `/intro`, `/extro`, Icelandic aliases. Play mode scales the canvas to the
      viewport. 21 tests, the project's first
- [x] **Chapter container scoping** — closed, and **narrower than this spec
      originally claimed**. The collision is real but the earlier figure was
      wrong: **111** container keys are shared by all four main chapters, not
      143. **56** differ in their own XML; **90** differ once you close over the
      names they reference, which is the number that matters — `s_prepare` is
      spelt identically in all four chapters and is still a different sequence in
      each, because the quanta it names are redefined per chapter. Measured by
      `webapp/test/chapterscope.test.mjs`, which runs the real parser over the
      real GML.
      It only ever bit through *by-name* lookups. `grep -rn "ctx.container" src/`
      returns **zero hits**: the parser resolves every operand at parse time, so
      quantums hold direct object references and never consult a container while
      running. Name resolution is now **strict per chapter** (`ChapterScopes`) —
      there is no global union left to fall through to, at parse time or at
      runtime. That is the 1999 guarantee: the Java kept one `Hashtable` but
      `clearContainer()` emptied it at every screen transition and re-parsed the
      chapter's `.gml` from disk, so exactly one chapter's names existed at a
      time. There is deliberately **no shared/common scope**, because the content
      needs none — across all six files nothing resolves outside its own chapter
      (`a_Thorshamar` and `a_Kross` are kristnit-only; the trade is intra-chapter)
      — so a fallback would only re-create the failure. `SaveSerializer` and
      `prewarmChapter`, previously left unscoped, now use the chapter's own map;
      `restore()` also goes through `setCurrentChapter`, which it did not.
      **Deliberately unscoped:** `stopAllSequences`, the Enter fast-forward and
      the debug active list, which must reach a sequence still performing in a
      chapter we have left
- [ ] **`Pulser` remainder** — `accumulated -= interval`, not `= 0`. Subtitles
      drift late against audio
- [x] **`Sequence` freeze escape** — *this entry was wrong and is corrected.*
      It claimed a single `frozenResolve` overwritten by concurrent waiters and a
      lost `thaw()`. Neither reproduces: the `new Promise` executor runs
      synchronously, so JS run-to-completion makes check-and-park indivisible —
      the guarantee Java bought with `synchronized` — and the generation check
      sits *above* the gate, so two runs can never be parked at once.
      The real defect was that `stopPerforming()` set `frozen = false`, which
      Java's does not (`frozen` is owned solely by `freeze()`/`thaw()`), so a
      stop or a restart **silently escaped a freeze and ran**. Note the whole
      path is currently unreachable — `FreezeSequenceQuantum` appears in no
      `.gml`, is absent from the DTD, and nothing in the 1999 Java calls
      `World.freeze()` either. Same signature as `SetSpeedQuantum`: built,
      wired, never invoked. Latent-correctness work for when world freeze is
      used
- [x] **Pointer Events** — touch input existed nowhere; a cold first tap
      resolved at (0,0) and every later one wherever the previous tap landed.
      Now `pointerdown`/`move`/`up`/`cancel` with coordinates read from the
      event itself, plus `touch-action: none` so the browser stops claiming taps
      for pan and pinch-zoom. **The affordance is still missing** — touch has no
      hover, so nothing turns the cursor red to show what is interactive. That
      needs a design decision (verb coin, hotspot reveal), not plumbing
- [x] **Asset failures warn in dev** — `AssetLoader.missing` plus a warning in
      the debug deployment. Silent 1×1/`null` fallbacks are why five missing
      PNGs went unnoticed for years
- [x] **`.m4a` extension mapping** in `resolvePath` — probed once by
      content-type, not status code: Vite's SPA fallback answers 200 with
      `index.html` for any missing path, so a status check would "find" m4a
      everywhere and then throw inside `decodeAudioData`
- [x] **Deployed** — see Deployment above
- [ ] `tools/lint_gml.py` takes `src/` as a second oracle for hardcoded assets

**Done when:** the 1998 game runs on desktop and on a phone by touch, characters
are the size authored in 1998, and `lint_gml.py` is clean.

### Phase 1 — Classic, shippable

The faithful port. Gates the open-source trigger, **and** is the instrument that
generates the rest of `docs/known-issues.md` — those requirements cannot be
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
screen time, which means **the four player characters first** — `SetPlayer`
reassigns the protagonist per chapter, so there are four, not one:

| Chapter | Player | Cells |
|---|---|---|
| Tyrkjaránið | `a_Sigrun` | 36 |
| Siðaskipti | `a_Gissur` | 19 |
| Kristnitaka | `a_Hjalti` (Hjalti Skeggjason) | 18 |
| Landnám | `vifill` | 17 |

90 cells, ~37% of the total, and all of the time the player spends looking at
themselves. INGOLFUR (11) is the largest remaining NPC.

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

## Done When

Phase 0 acceptance. Automatable checks first so `aidev check` can run them.

Typecheck and unit tests:

- [x] `cd webapp && npm run check`

Production build:

- [x] `cd webapp && npm run build`

Assets reached by relative symlink — not a duplicated tree, not an absolute path
into someone's home directory:

- [x] `test -L webapp/public/GAME && test -L webapp/public/gml`

SPA fallback serves the app on a deep link, so `/chapter1..4` resolve rather
than 404:

- [x] `curl -sf https://tt.spliffdonk.com/chapter2 | grep -q game-canvas`
- [ ] `python3 tools/lint_gml.py web_import` — currently **5 issues**, all
      pre-existing 1998/1999 content gaps, none introduced by the rebuild:
      3 voice lines absent from the archival master (need the CD ISO),
      1 typo'd quantum reference in `s_bless1`, 1 reference to a cut scene.
      Deliberately left red rather than relaxed — the gaps are real and two of
      them need Halldór's confirmation before anyone edits content
- [ ] The game runs on a phone by touch — **no longer blocked**: Pointer Events
      landed 2026-08-07 with 10 regression cases, and the engine no longer has a
      mouse-only path. Unchecked because nobody has held an actual phone; it is a
      device test now, not an engineering task.

## Sequencing rationale

Phase 0 before all else because **you cannot gather remaster requirements from a
build you cannot play**, and because shipping the classic keeps a working product
under every subsequent change. Phase 2 is deliberately one scene: the
style-clash risk is the project's largest unknown and it is answerable for the
cost of a single background.
