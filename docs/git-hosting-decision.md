# Tímaflakkarinn — Git hosting decision

**Date:** 2026-07-13
**Status:** Superseded 2026-09-01 by `specs/004-open-source-and-pipeline.md` —
open-sourcing moved the repo to GitHub-canonical with Forgejo re-roled as
public-read LFS host and mirror (Option B's topology at Option A's operational
cost, since Forgejo — not a standalone LFS server — carries the assets). The
analysis below was written for the private phase and its weights were right at
the time.
**Original status:** Decided — Option A
**Problem:** The recreation project is a few hundred MB (images, recordings, renderings) and growing. GitHub caps single files at 100 MB and recommends repos stay under ~1 GB, so plain GitHub is out. Every viable option therefore involves Git LFS (Large File Storage: the repo stores small pointer files; the real binaries live in an LFS store). The question is *where the git repo and the LFS store each live*.

## The options

- **Option A — Self-hosted Forgejo.** One Docker container on the homeserver running Forgejo (community fork of Gitea): a GitHub-like web forge with repos, issues, pull requests, and a built-in LFS server. Public at `git.spliffdonk.com` behind Caddy/HTTPS. Nightly backup to Google Drive via rclone.
- **Option B — GitHub + self-hosted LFS server.** Code and pointer files on GitHub; a standalone LFS server (rudolfs, giftless, or similar) on the homeserver holds the binaries. A `.lfsconfig` file in the repo links the two.
- **Option C — GitHub + paid GitHub LFS.** Everything on GitHub; buy LFS data packs (~$5/month per 50 GB storage + 50 GB download bandwidth).

## Comparison

| Dimension | A: Forgejo (self-hosted) | B: GitHub + own LFS server | C: GitHub + paid LFS |
|---|---|---|---|
| **Money cost** | $0 (homeserver already running) | $0 | ~$5/mo, grows with team & assets |
| **Maintenance** | ~10–20 min/mo (container updates, backup checks) | **Same as A** — an LFS server still runs publicly on the homeserver, plus GitHub admin | None |
| **Systems collaborators touch** | 1 (one URL, one account) | **2** (GitHub account + separate LFS credentials) | 1 |
| **Setup friction per collaborator** | Create account on the forge, `git lfs install` | GitHub account + LFS token + trust `.lfsconfig`; most error-prone | GitHub account + `git lfs install` |
| **Storage / bandwidth limits** | None that matter (554 GB free disk, unmetered) | None for assets; GitHub limits for code are irrelevant at this size | **Metered**: each fresh clone burns download quota; overruns block clones mid-month |
| **Control over IP** (original game assets, recordings) | Fully on own hardware | Code on GitHub, assets on own hardware | Fully on GitHub's terms |
| **Web UI shows the assets** | Yes — Forgejo renders LFS-stored images/files | **No** — GitHub shows pointer stubs; "Download ZIP" produces broken archives | Yes |
| **CI / ecosystem** | Forgejo Actions (GitHub-Actions-compatible, smaller ecosystem) | GitHub Actions, but needs extra credential plumbing to fetch assets | GitHub Actions, fully integrated |
| **Attack surface owned** | The forge (well-maintained, big deployments like Codeberg run it) | The LFS server — typically a niche/hobby-grade project with DIY auth | None |
| **Failure modes** | Home internet/disk outage blocks the team until fixed | Worst: clone succeeds, LFS pull fails silently → collaborators get pointer stubs instead of images, repeatedly confusing | LFS quota exhausted → clones fail until another pack is bought |
| **What a homeserver disk loss costs** (before backup restore) | Everything → **backup is mandatory** | The assets — the irreplaceable half → **backup equally mandatory** | Nothing |
| **Backup obligation** | Nightly rclone → Google Drive; accepted recovery time ~half a day | Same obligation as A | None (GitHub's problem) |
| **Offsite durability for free** | No — backup discipline carries it | For code only | Yes, everything |
| **Public discoverability later** | Possible (open the forge) but no network effect | Yes (GitHub) | Yes (GitHub) |

## Recommendation: Option A — self-hosted Forgejo

**Option B is dominated and should be discarded.** Its apparent appeal — "let GitHub carry the project, outsource only storage" — inverts in practice: the homeserver still runs a publicly exposed service, still needs the same updates, HTTPS, auth, and Google Drive backups as Option A (the assets are the irreplaceable part and they'd live only on the homeserver). So B keeps 100% of A's operational cost while **adding** a second credential system, a flakier component (standalone LFS servers are niche projects; Forgejo's LFS runs Codeberg-scale), a broken web view of the assets, and the classic "my clone has stubs instead of images" support burden. Note also that GitHub does not actually promote this split — their preferred model is Option C; third-party LFS via `.lfsconfig` is tolerated, not supported.

**The real contest is A vs C**, and it's a values call more than a technical one:

- **A wins on control and headroom.** The original game's assets stay on own hardware under own terms; storage and bandwidth are effectively unlimited, which matters because renderings and recordings only grow, and C's metered bandwidth ages badly (every full clone by every collaborator counts).
- **C wins on zero effort and durability.** No maintenance, no backup discipline, no exposure — for ~$5/month and living under GitHub's terms.

Given the stated priorities — full control valued explicitly, a homeserver already running with 554 GB free, maintenance framework in place, tolerance for ~half a day of recovery time, and a small trusted team — **Option A fits best**. The one discipline it demands: the Google Drive backup is not optional; until the rclone remote is authorized, the homeserver is the only copy of the project.

**Fallback path:** if self-hosting ever becomes tiresome, migrating A → C is straightforward (git history and LFS objects push cleanly to GitHub), so choosing A now does not lock anything in.

## Decision

**Option A — self-hosted Forgejo — chosen 2026-07-13.** Hjalti also explicitly rejected a private GitHub mirror as backup (prefers the project entirely on own environment); offsite backup goes to Google Drive instead, with ~half a day of recovery time accepted as fine.

Deployed the same day on the homeserver: Forgejo 15 at `/srv/forgejo/` (LFS on, registration off, HTTPS-only git), Caddy block for `git.spliffdonk.com`, nightly backup timer (03:30 UTC → local rotation → Google Drive once the rclone remote is authorized). Remaining activation steps at time of writing: Cloudflare A record `git` → 50.106.10.250 (DNS-only), rclone Google Drive OAuth, admin first login.
