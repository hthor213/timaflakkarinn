# 004 — Open source and the deployment pipeline

Status: done — decided, executed, and every Done When verified 2026-09-01.

Closes two questions that had been standing open: the repo-shape question from
the 2026-08-07 brief (trunk = `main`, integration = `dev`), and "CI running
`npm run check` on push". Supersedes the conclusion of
`docs/git-hosting-decision.md` (see "What changed" below).

## Decisions

**D1 — GitHub is canonical.** `github.com/hthor213/timaflakkarinn`, public.
Issues, PRs, and community live there. Default branch is **`dev`** — PRs land
there and are seen on tt-dev before anything reaches the public.

**D2 — Forgejo is the LFS host, mirror-target, and backup.** The 1998 masters
(~210 MB, 1,215 files) stay on `git.spliffdonk.com`, public-read, wired by the
committed `.lfsconfig`. GitHub free LFS was ruled out on bandwidth: 1 GB/month
is roughly five public clones. Every deploy fast-forward-mirrors the deployed
ref back to Forgejo; a diverged Forgejo fails the push loudly rather than being
overwritten.

**D3 — License split.** Code (webapp/, tools/, specs/, docs/) is MIT. Game
content (art, audio, dialogue, GML, the 1998/1999 program) remains
all-rights-reserved with the original owners — stated in LICENSE, README, and
`web_import/README.md`. The classic/remastered toggle (spec 000) is what lets
the owners judge faithfulness; the license split is what lets the code open
without the content question blocking it.

**D4 — Merging a PR is the deploy action.**
- PR → `dev`, merged ⇒ `deploy-dev.yml` runs `tools/deploy.sh --env dev` on the
  self-hosted runner ⇒ https://tt-dev.spliffdonk.com.
- Promotion is a reviewed `dev` → `main` PR, merged ⇒ `deploy-prod.yml` runs
  `tools/deploy.sh --env prod --promote` ⇒ https://tt.spliffdonk.com.
- `deploy.sh` remains the single deploy authority. The art gate is untouched:
  a push-triggered prod run passes no `--art-approved`, so an art-touching
  range dies on the script's own gate and is re-run via `workflow_dispatch`
  with the sign-off text.

## The mechanism

| Piece | Where | Notes |
|---|---|---|
| `check.yml` | GitHub-hosted runners | tsc + full suite on every PR and deploy-branch push. Pulls PNG masters only from Forgejo LFS (the suite reads sprites; nothing reads the WAVs). `lint_gml.py` rides non-blocking while the pre-existing 1998 content gaps stand. |
| `deploy-dev.yml` / `deploy-prod.yml` | self-hosted runner `homeserver` | Fire on push to `dev`/`main` only, never `pull_request` — fork code never reaches the runner. `deploy.sh` detects LOCAL mode on the box and all its guards apply unchanged. |
| Runner | systemd service on the deploy host | Registered to this repo only, label `homeserver`. |
| Deploy checkouts | `/srv/timaflakkarinn/{dev,prod}/repo` | `origin` → GitHub over public https (credential-free transport; retires the bundle-fallback fragility of known-issues #20), `lfs.url` → Forgejo. |

## What changed relative to `docs/git-hosting-decision.md`

That decision (Forgejo-only, Option A) was taken for the private phase, when
"systems collaborators touch" meant accounts Hjalti had to create. Open source
inverts the weights: discoverability and drive-by contribution live on GitHub,
and the losing Option B's real cost — running a niche standalone LFS server —
does not apply because Forgejo (already running, already backed up) is the LFS
server. Today's shape is GitHub-canonical + Forgejo-as-asset-host: B's
topology with A's operational cost.

## Done When

- [x] `git ls-remote https://github.com/hthor213/timaflakkarinn.git refs/heads/dev | grep -q .` — the repo is public: anonymous ls-remote succeeds
- [x] `curl -sf -o /dev/null https://git.spliffdonk.com/hjalti/timaflakkarinn` — Forgejo repo is public-read for anonymous LFS
- [x] `git config --get lfs.url | grep -q git.spliffdonk.com && grep -q git.spliffdonk.com .lfsconfig` — LFS decoupled from origin, for this clone and every fresh one
- [x] `gh run list --workflow check.yml --branch dev --limit 1 --json conclusion --jq '.[0].conclusion' | grep -qx success` — CI green on the integration branch
- [x] `gh api repos/hthor213/timaflakkarinn/actions/runners --jq '.runners[] | select(.name=="homeserver") | .status' | grep -qx online` — the deploy runner is listening
- [x] Judgment: a PR merged into `dev` appears on tt-dev.spliffdonk.com with no
      manual deploy step; a merged promotion PR appears on tt.spliffdonk.com.
      Verified by watching the Actions run end in `deploy.sh`'s own 16-check
      verification pass.
- [x] Judgment: a fresh anonymous clone from GitHub + `git lfs pull` +
      `npm run check` is green on a machine with no credentials.

All boxes verified 2026-09-01, the day the repo went public: PR #2 → tt-dev
and promotion PR #3 → tt both deployed by their Actions runs; the anonymous
clone was tested with global/system git config nulled and prompts disabled,
and the pulled `BENDILL1.PNG` hashed identical to the local master.

## Operational notes

- **Promotion merges need admin.** GitHub blocks the `dev` → `main` merge with
  "base branch policy prohibits the merge" even when the required `check` is
  green on the head SHA — merge with the UI's admin bypass or
  `gh pr merge --admin`. Owner-only friction; contributors never promote.
  Hjalti approved the admin-bypass flow 2026-09-01.
- The pre-2026-09 Forgejo→GitHub push-mirror (created 2026-08-12, the origin of
  the private GitHub copy) was **deleted** — it would have force-pushed stale
  refs over canonical GitHub. Mirroring now flows the other way, from the
  deploy workflows.
