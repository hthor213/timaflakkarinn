# Contributing

## The workflow

- **PRs target `dev`** (the default branch). Merging to `dev` auto-deploys
  https://tt-dev.spliffdonk.com.
- **`main` is the public site.** Promotion is a reviewed `dev` → `main` PR;
  merging it deploys https://tt.spliffdonk.com.
- CI runs `npm run check` (typecheck + the full test suite) on every PR. It
  must be green.

## Before you file a bug

Play at https://tt-dev.spliffdonk.com and check
`docs/known-issues.md` — it is the project's running ledger and most
misbehaviour is already catalogued there.

Every bug gets classified, and the classification decides what happens to it:

| Label | Meaning | What happens |
|---|---|---|
| `1998-bug` | The original game did this too | Deliberately preserved for now; the remaster decides its fate |
| `port-bug` | The port diverges from the original | Fixed, with a test |
| `missing` | Content/asset the port can't find | Sourced, not patched around |
| `design-improvement` | Better than the original would be | A decision, not a fix — goes through specs |

The reference for "what did the original do" is the decompiled Java in
`src/dimon/` and the GML in `web_import/gml/`. Questions about the original
team's *intent* go to Hjalti (`hjalti@gmail.com`), who was there.

## Things that will surprise you

- **GML and chapter files are ISO-8859-1**, not UTF-8. Plain `grep` silently
  finds nothing; use `grep -a` or `git grep`.
- **The 1998 masters in `web_import/` (LFS) are read-only in spirit**: never
  edited, never re-encoded in place. Derived assets are regenerated from them
  by `tools/pipeline/`.
- **Adding new LFS assets is maintainer-only** — the LFS store lives on the
  project's own server and writing to it needs an account there. PRs that need
  new assets: attach them to the PR and a maintainer lands them.
- The port is *faithful first*. If the original's behaviour looks wrong, it
  probably is wrong on purpose — see the taxonomy above before "fixing" it.

## Running the checks

```sh
cd webapp
npm ci
npm run check          # what CI runs: tsc --noEmit + all tests
python3 ../tools/lint_gml.py ../web_import   # content lint; 5 known 1998 gaps are expected
```
