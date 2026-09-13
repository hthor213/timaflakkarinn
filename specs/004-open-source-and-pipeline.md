# 004 — Open source and the deployment pipeline

Status: active — GitHub canonical and automatic dev deployment verified;
manual production policy adopted 2026-09-10. Its first manual release remains
to be verified when the owner requests a production promotion.

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
is roughly five public clones. Forgejo is a copy, not a place to push: every
push to `dev` or `main` on GitHub fast-forward-mirrors that branch to Forgejo
(`mirror.yml`, independent of deploys since 2026-09-13 — prod deploys are
manual, the mirror is not). A diverged Forgejo fails the push loudly rather
than being overwritten; the fix is to fast-forward Forgejo to GitHub by hand.
The Forgejo repo has no collaborators and registration is off, so the owner's
account is the only one that can write there. Owner decision 2026-09-13: no
branch protection on Forgejo — no clone uses it as a remote, and a stray push
there does no lasting harm: roll Forgejo back to GitHub's ref, push the change
to GitHub, and the mirror carries it over.

**D3 — Open code, explicit pre-v1 content permissions.** Revised by the owner
2026-09-10. Code (the TypeScript port, tools, and project documentation)
remains MIT under `LICENSE`. Game content, including remastered assets and
authored calibration data, is separately governed by `LICENSE-CONTENT.md`.
It permits local play, development, contribution forks, PRs, and review.
Independent public playable releases, public game instances, and content
redistribution or reuse require written permission except for the stated
collaboration permissions. Contributors retain ownership and grant the
official project the publication rights described in the content license.

Development is public before v1. At the rebuilt game's v1, the team will
evaluate a more permissive content license; no automatic change is promised.
README, CONTRIBUTING, and `web_import/README.md` point to the operative terms.
The planned original/remastered editions (spec 000) share a codebase; the
playable build currently uses the original renderer. The calibration page's
Classic/Modern previews do not imply that the remastered edition is finished.

**D4 — Automatic deployment stops at dev; production is manual.** Revised by
the owner on 2026-09-10 after the deployment round-trip verification.
- PR → `dev`, merged ⇒ `deploy-dev.yml` runs `tools/deploy.sh --env dev` on the
  self-hosted runner ⇒ https://tt-dev.spliffdonk.com.
- After testing on tt-dev, promotion is a reviewed `dev` → `main` PR followed
  by a separate, explicit **Actions → deploy-prod → Run workflow** on `main`.
  That manual run invokes `tools/deploy.sh --env prod --promote` ⇒
  https://tt.spliffdonk.com. Pushes and merges to `main` do not deploy.
- `deploy.sh` remains the single deploy authority. The art gate is untouched:
  an art-touching range requires sign-off text in the manual workflow's
  `art_approved` input; without it the script refuses to publish.

**Telegram PR review contract.** Implementation and activation evidence for
the maintainer's phone interface live in home-platform spec 031. Initial PR cards offer
approve-and-deploy-to-dev, agent review with optional instructions, and a
reminder. A review returns findings and one recommendation; rejection or
change-request actions appear only after review and preview their exact
comments. Follow-up questions resume the PR's homeserver CLI session using
the owner's ChatGPT subscription. Agent fixes require another decision.

Telegram approval merges the expected PR head into `dev` after checking CI
and review status; the existing `deploy-dev` workflow remains responsible
for deployment. The service follows that workflow and verifies the served
`/version.json` before reporting success. Updated head/base commits invalidate
old reviews and action cards. Telegram offers no merge-to-main or production
release action; the explicit manual production workflow above still applies.

## The mechanism

| Piece | Where | Notes |
|---|---|---|
| `check.yml` | GitHub-hosted runners | tsc + full suite on every PR and deploy-branch push. Pulls PNG masters only from Forgejo LFS (the suite reads sprites; nothing reads the WAVs). `lint_gml.py` rides non-blocking while the pre-existing 1998 content gaps stand. |
| `deploy-dev.yml` / `deploy-prod.yml` | self-hosted runner `homeserver` | Dev fires on push to `dev`; prod is manual dispatch only and checks out `main`. Neither fires on `pull_request`. `deploy.sh` detects LOCAL mode and all its guards apply unchanged. |
| `mirror.yml` | self-hosted runner `homeserver` | Fires on push to `dev` or `main`; fast-forwards that branch to Forgejo with the owner's token. Fails on divergence, never force-pushes. |
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
- [x] `git lfs env | grep -q '^Endpoint=https://git.spliffdonk.com/' && grep -q git.spliffdonk.com .lfsconfig` — effective LFS endpoint decoupled from origin, including fresh clones that inherit `.lfsconfig`
- [x] `gh run list --workflow check.yml --branch dev --limit 1 --json conclusion --jq '.[0].conclusion' | grep -qx success` — CI green on the integration branch
- [x] `gh api repos/hthor213/timaflakkarinn/actions/runners --jq '.runners[] | select(.name=="homeserver") | .status' | grep -qx online` — the deploy runner is listening
- [x] Judgment: a PR merged into `dev` appears on tt-dev.spliffdonk.com with no
      manual deploy step. The September 1 automatic production promotion was
      reverified on September 10 before being superseded by manual promotion.
- [x] Judgment: merging to `main` triggers no production deployment. Verified
      by PR #8: only CI ran, and production stayed at `c40f818`.
- [ ] Judgment: a later owner-requested manual workflow run publishes the
      approved release. Do not deploy production just to close this check.
- [ ] `test "$(git ls-remote https://github.com/hthor213/timaflakkarinn.git refs/heads/main | cut -f1)" = "$(git ls-remote https://git.spliffdonk.com/hjalti/timaflakkarinn.git refs/heads/main | cut -f1)" && test "$(git ls-remote https://github.com/hthor213/timaflakkarinn.git refs/heads/dev | cut -f1)" = "$(git ls-remote https://git.spliffdonk.com/hjalti/timaflakkarinn.git refs/heads/dev | cut -f1)"` — Forgejo `dev` and `main` equal GitHub's after `mirror.yml` has run
- [x] Judgment: a fresh anonymous clone from GitHub + `git lfs pull` +
      `npm run check` is green on a machine with no credentials.

The original acceptance checks were verified 2026-09-01, the day the repo went public: PR #2 → tt-dev
and promotion PR #3 → tt both deployed by their Actions runs; the anonymous
clone was tested with global/system git config nulled and prompts disabled,
and the pulled `BENDILL1.PNG` hashed identical to the local master.

## Operational notes

- **Use a normal promotion merge after required checks pass.** This worked
  for `dev` → `main` PR #5 on 2026-09-10. The first promotion on 2026-09-01
  required an owner-approved admin bypass despite green checks; that is a
  historical workaround, not a required step in the current flow.
- **Working checkout on homeserver:** `~/code/timaflakkarinn`, freshly cloned
  from `git@github.com:hthor213/timaflakkarinn.git` on 2026-09-10, with GitHub
  as its only remote (`origin`). All 1,215 LFS assets materialized from Forgejo
  during the clone. The older `~/work/timaflakkarinn` checkout remains in place
  for the calibration service; it also has GitHub as `origin`.
- The pre-2026-09 Forgejo→GitHub push-mirror (created 2026-08-12, the origin of
  the private GitHub copy) was **deleted** — it would have force-pushed stale
  refs over canonical GitHub. Mirroring now flows the other way, from
  `mirror.yml` on every deploy-branch push (originally a step inside the deploy
  workflows, which left Forgejo `main` stale once prod deploys became manual).
