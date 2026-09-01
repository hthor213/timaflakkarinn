# Last session — 2026-09-01

## The milestone

**Tímaflakkarinn is open source.** Public at
https://github.com/hthor213/timaflakkarinn (canonical), with a working
PR-driven deploy pipeline, both paths proven end-to-end the same day:

- PR merged into `dev` (default branch) ⇒ GitHub Actions on the homeserver
  runner runs `tools/deploy.sh --env dev` ⇒ **tt-dev.spliffdonk.com**. Proven
  by PR #2.
- Promotion PR `dev` → `main` merged ⇒ `--env prod --promote` ⇒
  **tt.spliffdonk.com**. Proven by PR #3 — **the first prod promotion ever**
  (prod had sat pre-promote at `ff1ebec`): it shipped the Aug 13–21 work
  (calibration tool, touch-picking finger allowance, machine-boundary
  deploy.sh), the open-source shape, and the pipeline itself to the public
  site.

The whole shape is recorded in `specs/004-open-source-and-pipeline.md`
(status: done, every Done When verified on flip day). License split: MIT for
code, game content all-rights-reserved with the owners — LICENSE, README,
`web_import/README.md`.

## What happened

- **GitHub canonical, Forgejo re-roled.** Forgejo (`git.spliffdonk.com`) is
  now the public-read LFS host (~210 MB of 1998 masters — GitHub free LFS
  bandwidth was a non-starter), mirror-target, and backup. `.lfsconfig`
  committed so every fresh clone fetches LFS from Forgejo anonymously.
  Verified with a truly anonymous clone (git config nulled): LFS pull OK,
  `npm run check` green, `BENDILL1.PNG` byte-identical to the local master.
- **Branches settled** — the question open since Aug 7: trunk = `main`
  (public site), integration = `dev` (default, PRs land here). `feat/unify`
  deleted (was identical to `main`); `import/web-mirror` kept on Forgejo
  only. Both deploy branches protected behind the `check` CI gate.
- **Pre-publish hygiene**: gitleaks clean over all 100 commits; no credential
  files ever committed; known-issues #20 carries no token text.
- **Homeserver work** (via agent): Actions runner `homeserver` installed as a
  systemd service (registered to this repo only); `/srv` deploy checkouts
  switched to GitHub https transport — credential-free, retiring the
  known-issues #20 bundle-fallback fragility; Forgejo flipped public with
  anonymous LFS verified end-to-end.

## Surprises the plan didn't know

1. **A Forgejo→GitHub push-mirror existed** (created Aug 12 — it's what made
   the private GitHub copy that was found already sitting there).
   Sync-on-commit + force-push semantics would have clobbered canonical
   GitHub after the first merged PR. Deleted, along with its stale deploy key
   on GitHub. Mirroring now flows GitHub → Forgejo, from the deploy
   workflows, fast-forward only.
2. **The test suite reads binaries** — `chromakey` surveys every PNG under
   `GAME/`, `collisionbox` reads frame-strip headers. Both CI and the first
   deploy refused correctly on LFS pointer stubs; all workflows now
   `git lfs pull --include PNGs` (~40 MB; nothing reads the WAVs).
3. **The `/srv` checkouts' credential helper answered every host** with the
   Forgejo token — GitHub 401s a bad credential even on public repos, so
   fetch would have stayed broken after the flip. Scoped to
   `git.spliffdonk.com` only (repo-local, plus global for the runner's
   mirror push).
4. **Promotion merges need the admin bypass** (`gh pr merge --admin` or the
   UI button) even with the required check green on the head SHA. Hjalti
   approved this flow 2026-09-01. Owner-only friction; contributors never
   promote.

## Files changed

- New: `.lfsconfig`, `LICENSE`, `README.md`, `CONTRIBUTING.md`,
  `web_import/README.md`, `.github/workflows/{check,deploy-dev,deploy-prod}.yml`,
  `specs/004-open-source-and-pipeline.md`
- Updated: `specs/001` (Deployment points at 004),
  `docs/ownership-and-provenance.md` (flip recorded),
  `docs/git-hosting-decision.md` (superseded, with reasoning)

## Start next session with

Three candidate tracks, owner's pick — all now flow through PRs to `dev`
(merge = live on tt-dev):

1. **Author the calibrations** (from the Aug 13 brief, still untouched): open
   `tt-dev.spliffdonk.com/calibrate`, work through the 47 rampless terrains
   and the 2 suspect ones (`t_HjaVolvul` 1.031×, `t_Skipingolfsl` 1.053×),
   Copy GML into `web_import/gml/*`, PR, judge in-game. First calibration
   landing in GML exercises the pins-as-XML-comment path through the real
   parser — verify the parser ignores comments inside element runs.
2. **Bug-test.** Hjalti plays through and reports; fixes per taxonomy.
3. **Graphics — still blocked on D2** (vector direction decided 2026-08-07;
   the surfaces-not-composition proposal still needs Erna). `art/` still does
   not exist; the 128 MB of prototype output still lives outside the repo.

## Needs a human

- **Tell the co-owners it's live** — Gummi, Georg, Erna, Hallgrimur. The
  ownership doc frames open-sourcing as a joint decision; Hjalti called the
  flip, a one-line heads-up closes the loop.
- **The PSDs remain the highest-value unknown**; original-team confirmations
  on the two GML content defects still pending (Aug 7 brief).
- **Modern terrain format** (Aug 13): pins ride in XML comments today —
  decide whether they graduate to a real GML attribute before the remaster
  engine consumes them. Spec before building.
- WAV→AAC script item stands (known-issues #22: `GAME_M4A` exists on one
  machine only).
- Contributors can't push LFS assets (Forgejo write needs an account) —
  CONTRIBUTING says maintainers land assets from PR attachments. Fine until
  the first real outside art contribution; revisit then.

## Check status

`aidev check`: same single deliberate red as before — `lint_gml.py`, 6
issues, all pre-existing 1998/1999 content gaps (counted correctly in
`specs/001` since Aug 13). Spec 004 green — its network-dependent Done When
items are judgment-class by design and were all verified by hand on flip
day. `npm run check` green locally, in CI, on the runner, and in the
anonymous clone. tt and tt-dev both verified serving by `deploy.sh`'s own
16-check pass in their Actions runs.
