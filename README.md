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
- **https://tt-dev.spliffdonk.com** — the development build, with debug tooling

## What's in here

| Path | What it is |
|---|---|
| `webapp/` | The TypeScript engine port (Vite). This is where development happens. |
| `web_import/` | The original game content: GML chapter scripts, and the 1998 masters (PNG/WAV) in Git LFS. Masters are never modified — derived assets are always regenerable. |
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
`dev` → `main` PR. See [CONTRIBUTING.md](CONTRIBUTING.md) for the workflow,
the bug taxonomy, and what makes this codebase unusual (it is, pleasantly).

## License

The **source code** — the TypeScript port, tools, and project documentation —
is MIT-licensed (see [LICENSE](LICENSE)).

The **game content** — all art, audio, dialogue, the GML chapter scripts, and
the original 1998/1999 program — is © 1998–1999 the owners of Dímon Software's
Tímaflakkarinn, all rights reserved. It is distributed in this repository so
the game can be built, played, studied, and faithfully improved as part of
this project. It is not covered by the MIT grant; don't reuse it outside the
project without the owners' permission.

The owners are on board with this project — see
`docs/ownership-and-provenance.md` for who they are and the project's history.
