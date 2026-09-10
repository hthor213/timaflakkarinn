# Tímaflakkarinn

**Tímaflakkarinn** ("The Time Traveller") is an Icelandic point-and-click
adventure game shipped by Dímon Software in November 1998 — built in six
months, with the player travelling through the settlement of Iceland, the
adoption of Christianity at Þingvellir, the Turkish Abductions, and more.

This repository is the living rebuild of that game: a faithful TypeScript
port of the original engine, running the original 1998/1999 content in a
browser, on its way to a full remaster (see `specs/000-timaflakkarinn-vision.md`).

**Play it now:**

- **https://tt.spliffdonk.com** — the game
- **https://tt-dev.spliffdonk.com** — the development build; play mode by default,
  with an **Allows for debug** button for optional tools

## Original and remastered

The project is designed around two editions in one repository, sharing the
game's story, puzzles, interpreter, and simulation:

- **Original** (called **Classic** in the specs) preserves the original 2D
  presentation and gameplay. The goal is the game as the team intended it:
  fixing port defects, restoring missing content, and completing confirmed
  original intentions while preserving the game's character.
- **Remastered** (called **Modern** in the specs) builds on that foundation
  with presentation and capabilities beyond the original engine: improved
  artwork, 3D character presentation, richer scene depth, and camera and
  widescreen work. It is intended to coexist with the original edition.

**Current status:** the playable build uses the original 2D renderer. The
remastered edition and an in-game original/remastered switch are still in
development; they are not two finished games available to select today.
The calibration tool's Classic/Modern controls preview two perspective
models, not two complete game editions. See the
[vision and edition rules](specs/000-timaflakkarinn-vision.md).

## Calibration

The [calibration tool](https://tt-dev.spliffdonk.com/calibrate) helps determine
how large a character should appear at different positions in a scene. Place
and resize a character against the background, then pin those judgements.
**Classic** fits the original engine's front-to-back scaling; **Modern**
previews a surface that can vary sideways and bend through more pins. The
same judgements support both models, and the tool shows how closely the
original engine can reproduce them.

The tool is part of this repo:

- [Calibration page](webapp/public/calibrate.html): scene selection,
  character sizing, pins, perspective previews, and **Copy GML**.
- [Calibration helpers](tools/pipeline/calibration.py): encoding-preserving
  changes to the authored GML terrain data.
- [Save/Publish service](tools/calibrate_server.py): authenticated maintainer
  access for saving work in progress and publishing calibration data.

**Improvements to the calibration page deploy automatically to TT-dev when
their PR merges into `dev`**, along with the game. The deployment also
refreshes the scene index and approved GML changes. The calibration page is
served only on TT-dev; production promotion remains a separate manual action.

The separate Save/Publish service currently runs from the older server
checkout and is **not automatically updated or restarted by that workflow**.
Its legacy Publish route attempts a direct git push and local deployment;
that route has not been migrated to the reviewed GitHub PR workflow. For
contributions, use **Copy GML** and submit the resulting changes in a PR.
Save/Publish require maintainer access; a normal local preview has no API
proxy. The service's update and publishing path is tracked as issue 28 in
[known issues](docs/known-issues.md).

## What's in here

| Path | What it is |
|---|---|
| `webapp/` | The TypeScript engine port (Vite). This is where development happens. |
| `web_import/` | Game content: authored GML chapters and calibration data, plus the 1998 PNG/WAV masters in Git LFS. Media masters are preserved; authored GML fixes and calibrations are reviewed changes. |
| `src/dimon/`, `classes/` | The original Java engine, decompiled (CFR) and as shipped — reference material for porting decisions. |
| `tools/` | Asset pipeline, GML lint, deployment. |
| `specs/` | What we're building and why — vision, architecture, decision records. |
| `docs/` | Ownership, provenance, and the running known-issues ledger. |

## Getting started

You need git, [git-lfs](https://git-lfs.com), and Node 20+.

```sh
git clone https://github.com/hthor213/timaflakkarinn.git
cd timaflakkarinn
git lfs pull        # ~210 MB of original masters, served from git.spliffdonk.com
cd webapp
npm ci
npm run check       # typecheck + test suite
npm run dev         # local dev server
```

The LFS objects are hosted on the project's own server (`git.spliffdonk.com`,
wired via `.lfsconfig`) rather than GitHub — the clone above fetches them
anonymously, no account needed. The GML chapter scripts are plain text in git,
but the test suite also reads the PNG masters, so run `git lfs pull` before
`npm run check` (PNGs alone are enough: `git lfs pull --include="*.PNG,*.png"`).

Note: the GML and chapter files are **ISO-8859-1**, not UTF-8 — configure your
editor accordingly, and use `grep -a` when searching them.

## Contributing

Pull requests target the `dev` branch and deploy automatically to
tt-dev.spliffdonk.com when merged; promotion to the public site is a reviewed
`dev` → `main` PR followed by a separate manual **deploy-prod** workflow run.
See [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow,
the bug taxonomy, and what makes this codebase unusual (it is, pleasantly).

## License

The **source code** — the TypeScript port, tools, and project documentation —
is MIT-licensed (see [LICENSE](LICENSE)).

The **game content** has separate terms under the
[Tímaflakkarinn Game Content License — Pre-v1](LICENSE-CONTENT.md). This
includes artwork, audio, dialogue, scenes and GML chapters, authored
calibration data, remastered assets, and the original 1998/1999 program.
Original content remains copyrighted by the original owners; contributors
retain ownership of their contributions.

Everyone is welcome to build and play locally, develop improvements, keep
contribution forks, and submit PRs and review material. The team evaluates
contributions before merging them. Independent public game releases, public
playable instances, asset redistribution, and reuse of the content in another
game require written permission from the relevant rights holders. The full
license explains the collaboration permissions and contribution terms; these
restrictions do not apply to reuse of the separate MIT-licensed code.

**When the rebuilt game reaches v1, the team will evaluate whether a more
permissive license should apply to the game content.** This does not promise
or automatically trigger a license change.

The owners are on board with this project — see
`docs/ownership-and-provenance.md` for who they are and the project's history.
