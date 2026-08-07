# Project state — 2026-07-26

## What exists

| | |
|---|---|
| Repo | `git.spliffdonk.com/hjalti/timaflakkarinn`, branch `import/web-mirror` (private, HTTPS-only, git-lfs required) |
| Contents | engine build output, 6 `.gml` chapters + `scene.dtd`, 1 211 LFS media files (188 MiB) |
| Prototype deploy | `835c0363.timaflakkarinn.pages.dev` (Cloudflare Pages, throwaway URL) |
| Intended host | `timaflakkarinn.spliffdonk.com` — not set up yet |

The engine and format are documented in [engine-and-gml.md](engine-and-gml.md).
Who owns the game, who contributed the recreation, and what has to happen before
any public release: [ownership-and-provenance.md](ownership-and-provenance.md).

## Verified this session

- Cloned with LFS intact: **1 211/1 211 objects real binaries**, zero pointer
  stubs, `git lfs fsck` clean, and all 1 220 files byte-exact against
  `web_import/SHA256SUMS`.
- Re-derived the asset reference list independently from the `.gml` files using
  the engine's own `resolvePath()`: **1 215 referenced, 1 211 present, 4 missing,
  0 orphans.** Every stored file is used; the provenance record is accurate.
- **The game runs.** Served locally, it boots, plays the intro, jumps between
  chapters, renders scenes (~94 % of the canvas painted), plays audio, and
  throws **zero JavaScript exceptions**.

## Open problems, most to least serious

### 1. There is no engine source

`web_import/assets/index-CXa83YST.js` is a 64 KB minified bundle — build output
from someone's Vite project. The source tree is not in this repo. Every engine
change today means editing minified JavaScript.

This is the single biggest blocker to further work. The source is presumably
Halldór's (halldor@eldjarn.net). Getting it is worth more than any other task
on this list.

### 2. The Völva name puzzle is unimplemented, and probably soft-locks

`GuessQuantum` is parsed and then does **nothing** — its `execute()` is empty.
It is used exactly once, in `kristnit.gml`:

```
s_ThuHeitir:  qh_TextVolva → q_Freeze → q_Guess
```

The sequence hides the seeress's text, freezes input, calls the no-op, and ends.
Nothing in that sequence unfreezes. The debug panel's manual unfreeze button
suggests this was known. Needs confirming in play, but it looks like a dead end
in the middle of Kristnitaka.

### 3. Save/load does not exist

`F1` logs `"Save/Load menu - not yet implemented"`. Condition flags already
carry `save="true"` and `SentenceContainer`/`Text` have `save` attributes, so
the data model anticipates it — only the mechanism is absent. For a
four-chapter adventure this matters.

### 4. Four assets are missing upstream

Referenced by the content, absent from both the repo and the deployment. They
must come from the CD-ROM ISO or from Halldór.

**Update 2026-08-07:** the ISO has been located — see
[ownership-and-provenance.md](ownership-and-provenance.md), "The original ISO".
It was a Forgejo release attachment, uploaded 2026-08-03, unnoticed for four days.
Note the disc carries **668 WAVs, the same count as the mirror**, so if the three
absent voice lines are not on it either they were never shipped — a 1998
authoring defect, not an archival loss. Untested until the diff is run.

| Asset | Used by | Live? |
|---|---|---|
| `LANDNAM/MEDIA/VIFILL/GODRADDA.WAV` | `m_godraddyr` (Vífill) | yes |
| `LANDNAM/MEDIA/VIFILL/AFSAKDUA.WAV` | `m_afsakduhusbondi` (Vífill) | yes |
| `TYRKJARA/MEDIA/HALLDORA/DETTUREA.WAV` | `m_DetturEnginn` (Halldóra) | yes |
| `LANDNAM/ANIMATIA/INGOLFUR/STOP2RIA.PNG` | `ingolfur_stop2right` | **no — its declaration is commented out** |

So only three are real gaps. Missing images degrade to a 1×1 blank and missing
audio to silence, so none of them crash anything.

### 5. One typo'd sequence reference

`landnam.gml:3028`, sequence `s_bless1`:

```xml
<Quantum name="q_Ahvarerhjorleifur"/>   <!-- undefined -->
```

The engine warns `Quantum not found` at runtime and skips it. Reading the
convention (`q_h…` = hide) and the two neighbouring instructions — which hide
the *other* two subtitle actors — this should almost certainly be
**`q_hhvarerhjorleifur`**, hiding the "Hvar er Hjörleifur?" caption. Left as-is
pending Halldór's confirmation; the effect is a subtitle that may linger into
the map transition.

### 6. Smaller things

- `tyrkran.gml:3059` declares `q_ToFjolin` pointing at a scene `s_Fjolin` that
  doesn't exist. No sequence uses the quantum — a cut scene, harmless.
- The debug panel is always on and consumes a 280 px column and a 180 px strip.
  Fine for development, not for `timaflakkarinn.spliffdonk.com`.
- No favicon (a 404 on every load).
- No build, no tests, no CI.

## Recovered this session

`GAME/COMMON/BENDILL1.PNG` and `BENDILL2.PNG` — the two mouse cursors. They are
hardcoded in the engine rather than referenced from any `.gml`, so the original
capture (which derived its file list from `file=` attributes) could not see
them, and the mirror shipped without them. The game ran with **no visible
cursor at all**, since the page sets `cursor: none` and relies entirely on the
custom one.

Both were still present on the Cloudflare deployment and have been pulled in and
verified (30×30 PNGs). This was luck: that URL is disposable.

**Lesson for any future capture:** deriving the asset list from content alone is
not sufficient — the engine has hardcoded paths too. Grep the bundle for string
literals that look like paths.

## Tooling added

`tools/lint_gml.py` — validates the chapters against the engine's actual
behaviour: dangling quantum/object references, missing asset files, and
undeclared initial states. It models the engine's real quirks (flat per-chapter
namespace, `action_*` built-ins, auto-created states) and skips XML comments,
which matters — a naive pass reports **715** problems against the true **5**.

```bash
python3 tools/lint_gml.py web_import
```

## Suggested order of work

1. Get the engine source from Halldór. Everything else is cheaper afterwards.
2. Confirm and fix the Völva soft-lock.
3. Recover the three missing voice lines from the CD ISO.
4. Make the debug panel toggleable, then stand up
   `timaflakkarinn.spliffdonk.com` (A record → `50.106.10.250`, Caddy block).
5. Implement save/load.

## Operational risk

The rclone Google Drive backup described in
[history/2026-07-13-session.md](history/2026-07-13-session.md) was never
authorised, so the homeserver still holds the only copy of the LFS objects —
which have already gone missing once. The 188 MiB of art and voice recordings is
the irreplaceable half of this project. Finish that backup.
