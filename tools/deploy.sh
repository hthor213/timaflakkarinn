#!/usr/bin/env bash
#
# Deploy Tímaflakkarinn to tt.spliffdonk.com / tt-dev.spliffdonk.com.
#
# Every guard in this script exists because a real deploy nearly shipped the bug
# it prevents. The rules are documented in specs/001-architecture-and-plan.md
# ("Deployment" / "Deploy rules, learned the hard way"); this file is the
# executable copy, so nobody has to remember them at 2am.
#
# The shape:
#   local gate  -> tree clean, on branch, tsc + tests pass
#   transport   -> git fetch if the Forgejo credential works, verified git
#                  bundle if it does not; fast-forward only, never a reset
#   build       -> npm ci && npm run check && npm run build, ON THE SERVER
#   publish     -> refresh assets/ index.html _headers video/ gml/ and NOTHING
#                  else. GAME/ is a hardlink overlay and is never touched.
#   verify      -> prove the new bytes are actually being served, because the
#                  recurring failure mode here is *silently stale*, not
#                  *loudly broken*
#
# Usage:  tools/deploy.sh [--dry-run | --verify-only] [--host H] [--branch B]
#                         [--url U]
#
#   --dry-run      show exactly what would happen; change nothing
#   --verify-only  skip transport/build/publish and run only the verification
#                  pass against whatever is live right now. Read-only. Use it
#                  to answer "is the site still correct?" without deploying.
#
set -euo pipefail

cd "$(dirname "$0")/.."
REPO_ROOT="$PWD"

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

SSH_HOST="hjalti@homeserver"          # Tailscale MagicDNS. NOTE: `aidev ssh
                                      # homeserver` mangles the remote command
                                      # and drops stdin -- use plain ssh only.
REMOTE_REPO="/home/hjalti/work/timaflakkarinn"
WEB_ROOT="/srv/timaflakkarinn/web"
BRANCH="feat/unify"
BASE_URL="https://tt.spliffdonk.com"
DRY_RUN=0
VERIFY_ONLY=0

usage() {
  sed -n '2,/^set -euo/p' "$0" | sed 's/^# \{0,1\}//;$d'
  exit "${1:-0}"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --verify-only) VERIFY_ONLY=1 ;;
    --host)    SSH_HOST="$2"; shift ;;
    --branch)  BRANCH="$2";   shift ;;
    --url)     BASE_URL="$2"; shift ;;
    -h|--help) usage 0 ;;
    *) printf 'unknown argument: %s\n\n' "$1" >&2; usage 1 ;;
  esac
  shift
done

[ "$DRY_RUN$VERIFY_ONLY" = "11" ] && {
  echo '--dry-run and --verify-only are mutually exclusive' >&2; exit 1; }

# ---------------------------------------------------------------------------
# Output helpers
# ---------------------------------------------------------------------------

if [ -t 1 ]; then
  C_RED=$'\033[31m'; C_GRN=$'\033[32m'; C_YEL=$'\033[33m'
  C_BLU=$'\033[36m'; C_DIM=$'\033[2m'; C_OFF=$'\033[0m'
else
  C_RED=; C_GRN=; C_YEL=; C_BLU=; C_DIM=; C_OFF=
fi

WARNINGS=()
CHECKS_RUN=0
SCRATCH=()          # local temp files, removed however we exit
cleanup() { [ "${#SCRATCH[@]}" -eq 0 ] || rm -f "${SCRATCH[@]}"; }
trap cleanup EXIT

step() { printf '\n%s==>%s %s\n' "$C_BLU" "$C_OFF" "$*"; }
ok()   { CHECKS_RUN=$((CHECKS_RUN + 1)); printf '  %sok%s   %s\n' "$C_GRN" "$C_OFF" "$*"; }
info() { printf '  %s·%s    %s\n' "$C_DIM" "$C_OFF" "$*"; }
warn() { WARNINGS+=("$*"); printf '  %swarn%s %s\n' "$C_YEL" "$C_OFF" "$*"; }
plan() { printf '  %swould%s %s\n' "$C_DIM" "$C_OFF" "$*"; }

# Refuse rather than guess. A deploy that half-succeeds is worse than one that
# never starts, so every failure path lands here and stops.
die() {
  printf '\n%sREFUSED%s %s\n' "$C_RED" "$C_OFF" "$1" >&2
  shift
  for line in "$@"; do printf '        %s\n' "$line" >&2; done
  printf '\n        Nothing was changed on the server by this run.\n' >&2
  exit 1
}

# Run a bash snippet on the server. The snippet goes over stdin so it needs no
# quoting gymnastics; `-euo pipefail` means a remote failure is a real failure
# and not a silently empty string we then treat as data.
remote() {
  ssh -o BatchMode=yes -o ConnectTimeout=20 "$SSH_HOST" \
      'bash -euo pipefail -s' <<<"$1"
}

# Mutating remote work: skipped, and described, under --dry-run.
remote_write() {
  local label="$1" script="$2"
  if [ "$DRY_RUN" = 1 ]; then plan "$label"; return 0; fi
  info "$label"
  remote "$script"
}

# ---------------------------------------------------------------------------
# 1. Local gate
# ---------------------------------------------------------------------------

step "Local gate"

for cmd in git ssh scp curl; do
  command -v "$cmd" >/dev/null || die "missing local command: $cmd"
done

# The server builds from git, not from your working copy. An uncommitted fix
# looks deployed on your screen and is absent from the site -- this is exactly
# how "the fix didn't work" bug reports get written about code that never left
# the laptop.
if [ -n "$(git status --porcelain)" ]; then
  die "local tree is dirty." \
      "The server builds from a commit, so uncommitted work does not ship." \
      "Commit or stash first:" \
      "$(git status --short | sed 's/^/          /')"
fi
ok "working tree clean"

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
[ "$CURRENT_BRANCH" = "$BRANCH" ] || die \
  "on branch '$CURRENT_BRANCH' but deploying '$BRANCH'." \
  "Check out $BRANCH, or pass --branch $CURRENT_BRANCH if that is what you mean."
ok "on branch $BRANCH"

LOCAL_SHA="$(git rev-parse HEAD)"
LOCAL_SUBJECT="$(git log -1 --format=%s)"
info "HEAD $(git rev-parse --short HEAD) — $LOCAL_SUBJECT"

# tsc + the whole test suite, locally, before we spend a minute on the wire.
# The server runs `npm run check` again before it builds, so this gate is a
# fast fail rather than the authority.
step "Local check (tsc --noEmit && npm test)"
if [ ! -d webapp/node_modules ]; then
  info "webapp/node_modules missing — npm ci"
  ( cd webapp && npm ci --silent )
fi
if ! ( cd webapp && npm run check >/tmp/tt-deploy-check.$$ 2>&1 ); then
  tail -30 /tmp/tt-deploy-check.$$ >&2
  rm -f /tmp/tt-deploy-check.$$
  die "local check failed (see output above)."
fi
rm -f /tmp/tt-deploy-check.$$
ok "tsc clean, tests pass"

# The .gml masters are ISO-8859-1 with CRLF and both are load-bearing: the
# engine is fed them as application/xml;charset=ISO-8859-1, and the 1998 line
# splitter counts on CRLF. An editor that "helpfully" normalised a master would
# ship mojibake for every Icelandic character. Check the source, not the copy.
step "GML master integrity (ISO-8859-1 + CRLF)"
for f in web_import/gml/*.gml; do
  LC_ALL=C grep -q $'\r' "$f" || die \
    "$f has lost its CRLF line endings." \
    "The masters are ISO 9660-era files; CRLF is load-bearing."
  high="$(LC_ALL=C tr -d '\000-\177' < "$f" | wc -c | tr -d ' ')"
  if [ "$high" -gt 0 ] && iconv -f UTF-8 -t UTF-8 "$f" >/dev/null 2>&1; then
    die "$f has been converted to UTF-8." \
        "It must stay ISO-8859-1 — Caddy serves /gml/* with that charset," \
        "so UTF-8 bytes render as mojibake for every Icelandic character."
  fi
done
ok "$(ls web_import/gml/*.gml | wc -l | tr -d ' ') masters are CRLF, none UTF-8-converted"

# ---------------------------------------------------------------------------
# 2. Server pre-state
# ---------------------------------------------------------------------------

step "Server pre-state ($SSH_HOST)"

remote 'echo up' >/dev/null || die "cannot reach $SSH_HOST over ssh."
ok "ssh reachable"

REMOTE_DIRTY="$(remote "cd $REMOTE_REPO && git status --porcelain")"
# Another agent editing directly on the server is a real scenario in this
# project. A fast-forward over their uncommitted work would destroy it, and
# a build from a half-edited tree would ship something nobody wrote.
[ -z "$REMOTE_DIRTY" ] || die \
  "server checkout is dirty — someone or something is mid-flight there." \
  "$(printf '%s\n' "$REMOTE_DIRTY" | sed 's/^/          /')"
ok "server checkout clean"

REMOTE_SHA="$(remote "cd $REMOTE_REPO && git rev-parse HEAD")"
REMOTE_BRANCH="$(remote "cd $REMOTE_REPO && git rev-parse --abbrev-ref HEAD")"
info "server at ${REMOTE_SHA:0:7} on $REMOTE_BRANCH"
[ "$REMOTE_BRANCH" = "$BRANCH" ] || die \
  "server checkout is on '$REMOTE_BRANCH', not '$BRANCH'." \
  "Switch it deliberately; this script will not change branches for you."

if [ "$VERIFY_ONLY" = 1 ]; then
  info "verify-only: not comparing commits, checking whatever is live"
elif [ "$REMOTE_SHA" = "$LOCAL_SHA" ]; then
  info "server already at target commit — rebuilding and republishing anyway"
else
  # Fast-forward only. A non-ff means the server has commits the laptop does
  # not, and rolling over them would delete work with no record of it.
  git merge-base --is-ancestor "$REMOTE_SHA" "$LOCAL_SHA" 2>/dev/null || die \
    "not a fast-forward: server ${REMOTE_SHA:0:7} is not an ancestor of local ${LOCAL_SHA:0:7}." \
    "The server has commits this laptop does not have, or the histories diverged." \
    "Resolve it by hand — this script will not force anything."
  ok "fast-forward ${REMOTE_SHA:0:7} → ${LOCAL_SHA:0:7} ($(git rev-list --count "$REMOTE_SHA..$LOCAL_SHA") commit(s))"
fi

# Fingerprint the hardlink overlay BEFORE we touch anything. Two jobs: refuse to
# deploy on top of an already-broken overlay (a green report over a broken tree
# is the worst outcome), and give us an exact before/after to prove we did not
# touch GAME/.
read -r PRE_GAME_FILES PRE_GAME_WAV PRE_GAME_M4A PRE_GAME_LC PRE_GAME_PNG PRE_GAME_INO <<EOF
$(remote "cd $WEB_ROOT && printf '%s %s %s %s %s %s\n' \
    \"\$(find GAME -type f | wc -l)\" \
    \"\$(find GAME -iname '*.wav' | wc -l)\" \
    \"\$(find GAME -name '*.M4A' | wc -l)\" \
    \"\$(find GAME -name '*.m4a' | wc -l)\" \
    \"\$(find GAME -name '*.PNG' | wc -l)\" \
    \"\$(find GAME -name '*.M4A' | sort | head -1 | xargs stat -c %i)\"")
EOF

[ "$PRE_GAME_WAV" = 0 ] || die \
  "serving root already contains $PRE_GAME_WAV WAV files under GAME/." \
  "Someone ran a plain 'cp -r dist/*': Vite dereferences the symlinks in" \
  "webapp/public/, so dist/GAME is the raw 1213-file tree with 668 WAVs and" \
  "no .M4A. Rebuild the hardlink overlay before deploying."
[ "$PRE_GAME_LC" = 0 ] || die \
  "serving root contains $PRE_GAME_LC lowercase .m4a files under GAME/." \
  "AssetLoader.resolvePath uppercases every path (the content is ISO 9660), so" \
  "lowercase names 404, the content-type probe falls back to .WAV, and the WAVs" \
  "are not in this tree: total silent audio loss with nothing raising an error."
[ "$PRE_GAME_M4A" -gt 0 ] || die "serving root has no .M4A files under GAME/ — overlay is not built."

PRE_LINKS="$(remote "cd $WEB_ROOT && find GAME -name '*.M4A' | sort | head -1 | xargs stat -c %h")"
[ "$PRE_LINKS" -ge 2 ] || die \
  "GAME/*.M4A has link count $PRE_LINKS — the hardlink overlay has been replaced by real copies." \
  "57 MiB apparent should be ~1.3 MiB real; a copy means the next master change silently diverges."
ok "GAME overlay healthy: $PRE_GAME_FILES files, $PRE_GAME_M4A .M4A, $PRE_GAME_PNG .PNG, 0 WAV, links=$PRE_LINKS"

# Remember the served bundle names so we can prove afterwards that the hash
# changed and that the old one really went away (rsync --delete, not a merge).
PRE_ASSETS="$(remote "cd $WEB_ROOT && ls assets 2>/dev/null || true")"
info "current assets/: $(printf '%s ' $PRE_ASSETS)"

# ---------------------------------------------------------------------------
# 3. Transport — fetch if the credential works, verified bundle if not
# ---------------------------------------------------------------------------

TRANSPORT="none (verify-only)"
NEW_JS=""
if [ "$VERIFY_ONLY" = 0 ]; then

step "Transport"

TRANSPORT=""
if remote "cd $REMOTE_REPO && GIT_TERMINAL_PROMPT=0 git ls-remote --exit-code origin refs/heads/$BRANCH" >/dev/null 2>&1; then
  TRANSPORT="fetch"
  ok "Forgejo credential works — using git fetch (the fast path)"
else
  TRANSPORT="bundle"
  # Documented server-side debt: the Forgejo credential on the homeserver is
  # expired, so `git fetch` fails. This is the fallback, not the design — when
  # the credential is renewed the branch above just starts working.
  warn "Forgejo credential on the server is not working — falling back to a verified git bundle"
fi

CHANGED_FILES=""
LFS_CHANGED=""
if [ "$REMOTE_SHA" != "$LOCAL_SHA" ]; then
  CHANGED_FILES="$(git diff --name-only "$REMOTE_SHA" "$LOCAL_SHA")"
  # A git bundle carries git objects. LFS-tracked files live in git as ~130-byte
  # pointers, and the real blobs come from the LFS endpoint behind the same dead
  # credential. Shipping one over a bundle checks out a text file where a PNG
  # belongs, and the overlay would happily hardlink the garbage.
  if [ -n "$CHANGED_FILES" ]; then
    LFS_CHANGED="$(printf '%s\n' "$CHANGED_FILES" \
      | git check-attr --stdin filter 2>/dev/null \
      | grep ': filter: lfs$' | sed 's/: filter: lfs$//' || true)"
  fi
fi

if [ -n "$LFS_CHANGED" ] && [ "$TRANSPORT" = "bundle" ]; then
  die "this commit range changes Git-LFS-tracked files and the server cannot fetch LFS objects." \
      "A bundle carries only the LFS pointer, so the server would check out a" \
      "130-byte text file where a PNG or WAV belongs." \
      "Renew the Forgejo credential on the server first. Affected:" \
      "$(printf '%s\n' "$LFS_CHANGED" | head -10 | sed 's/^/          /')"
fi
[ -z "$CHANGED_FILES" ] || info "$(printf '%s\n' "$CHANGED_FILES" | wc -l | tr -d ' ') file(s) changed in this range"

BUNDLE_LOCAL=""
if [ "$REMOTE_SHA" = "$LOCAL_SHA" ]; then
  info "nothing to transfer — server already has ${LOCAL_SHA:0:7}"
elif [ "$TRANSPORT" = "fetch" ]; then
  remote_write "git fetch origin $BRANCH on the server" \
    "cd $REMOTE_REPO && GIT_TERMINAL_PROMPT=0 git fetch origin $BRANCH"
  remote_write "git merge --ff-only FETCH_HEAD" \
    "cd $REMOTE_REPO && git merge --ff-only FETCH_HEAD"
  if [ -n "$LFS_CHANGED" ]; then
    remote_write "git lfs pull (range touches LFS-tracked files)" \
      "cd $REMOTE_REPO && git lfs pull"
  fi
else
  # Incremental bundle: prerequisite is the commit the server already has, so
  # this is kilobytes, not the whole history. `git bundle verify` on the SERVER
  # is the meaningful check -- it is where the prerequisites actually have to
  # exist. Verifying only locally would prove nothing.
  BUNDLE_LOCAL="$(mktemp)"; SCRATCH+=("$BUNDLE_LOCAL")
  git bundle create "$BUNDLE_LOCAL" "$REMOTE_SHA..$BRANCH" >/dev/null \
    || die "could not build a bundle for $REMOTE_SHA..$BRANCH."
  git bundle verify "$BUNDLE_LOCAL" >/dev/null 2>&1 \
    || die "locally generated bundle failed verification."
  ok "bundle built and locally verified ($(wc -c <"$BUNDLE_LOCAL" | tr -d ' ') bytes, prereq ${REMOTE_SHA:0:7})"

  BUNDLE_REMOTE="/tmp/tt-deploy-${LOCAL_SHA:0:12}.bundle"
  if [ "$DRY_RUN" = 1 ]; then
    plan "scp $BUNDLE_LOCAL -> $SSH_HOST:$BUNDLE_REMOTE"
    plan "git bundle verify $BUNDLE_REMOTE on the server"
    plan "git fetch <bundle> $BRANCH && git merge --ff-only"
  else
    scp -q -o BatchMode=yes "$BUNDLE_LOCAL" "$SSH_HOST:$BUNDLE_REMOTE"
    remote "cd $REMOTE_REPO && git bundle verify $BUNDLE_REMOTE" >/dev/null \
      || die "bundle failed verification ON THE SERVER — prerequisites missing or transfer corrupted."
    ok "bundle verified on the server"
    remote "cd $REMOTE_REPO && git fetch '$BUNDLE_REMOTE' '+$BRANCH:refs/deploy/incoming' && git merge --ff-only refs/deploy/incoming" >/dev/null
    remote "rm -f $BUNDLE_REMOTE"
    info "bundle applied and removed from the server"
  fi
fi

if [ "$DRY_RUN" = 0 ]; then
  NOW_SHA="$(remote "cd $REMOTE_REPO && git rev-parse HEAD")"
  [ "$NOW_SHA" = "$LOCAL_SHA" ] || die \
    "server HEAD is ${NOW_SHA:0:7} but should be ${LOCAL_SHA:0:7} after transport." \
    "Stopping before the build so nothing is published from the wrong commit."
  ok "server HEAD == ${LOCAL_SHA:0:7}"
fi

# ---------------------------------------------------------------------------
# 4. Build on the server
# ---------------------------------------------------------------------------

step "Build on the server"
if [ "$DRY_RUN" = 1 ]; then
  plan "cd $REMOTE_REPO/webapp && npm ci && npm run check && npm run build"
else
  # `npm run check` here is the authoritative gate: it runs against exactly the
  # tree that is about to be published, on the machine that publishes it.
  remote "cd $REMOTE_REPO/webapp && npm ci --silent && npm run check && npm run build" \
    || die "server build failed. Serving root untouched."
  ok "npm ci && npm run check && npm run build"

  # The publish step below runs rsync --delete against assets/. If the build
  # produced an empty or missing assets/ -- a Vite config slip, a half-written
  # dist -- --delete would empty the serving root and every visitor would get a
  # blank page with a 404 on the bundle. Check the build before trusting it.
  BUILT_JS="$(remote "cd $REMOTE_REPO/webapp/dist && ls assets/*.js 2>/dev/null | head -1 || true")"
  [ -n "$BUILT_JS" ] || die \
    "the build produced no webapp/dist/assets/*.js." \
    "Refusing to rsync --delete an empty assets/ over the live one."
  remote "grep -q \"$(basename "$BUILT_JS")\" $REMOTE_REPO/webapp/dist/index.html" \
    || die "webapp/dist/index.html does not reference $(basename "$BUILT_JS") — the build is inconsistent."
  ok "build produced $(basename "$BUILT_JS"), referenced by dist/index.html"
fi

# ---------------------------------------------------------------------------
# 5. Publish — an allowlist, never a wildcard copy
# ---------------------------------------------------------------------------
#
# This is the rule that has cost the most: `cp -r dist/* $WEB_ROOT/` looks
# obviously right and is catastrophically wrong. Vite dereferences the symlinks
# in webapp/public/, so dist/GAME is the raw master tree (668 WAVs, no .M4A) and
# dist/gml is a build-time snapshot. Copy five named things and nothing else.

step "Publish"

info "source of truth per target:"
info "  assets/     <- webapp/dist/assets      (content-hashed, --delete)"
info "  index.html  <- webapp/dist/index.html"
info "  _headers    <- webapp/dist/_headers"
info "  video/      <- webapp/dist/video"
info "  gml/        <- web_import/gml          (NOT dist/gml)"
info "  GAME/       <- untouched hardlink overlay"

# RS: compare by checksum (-c) and do not propagate mtimes (--no-times).
# A byte-identical file is then left completely untouched, so Caddy's ETag and
# Last-Modified (both mtime-derived) survive and the browser gets a 304. Without
# this, every deploy bumps the mtime of all six .gml files -- and /gml/* is
# no-cache by design, so every player would re-download 1.2 MB of scene files
# after a deploy that changed nothing in them. A file whose content DID change
# still gets a fresh mtime, so its ETag still changes. (Verified both halves.)
RS="rsync -a -c --no-times"
PUBLISH_SCRIPT=$(cat <<EOF
cd $REMOTE_REPO
# dist/GAME and dist/gml are deliberately absent from this list. See above.
$RS --delete webapp/dist/assets/ $WEB_ROOT/assets/
$RS          webapp/dist/index.html $WEB_ROOT/index.html
$RS          webapp/dist/_headers   $WEB_ROOT/_headers
$RS --delete webapp/dist/video/     $WEB_ROOT/video/
# gml/ in the serving root is an INDEPENDENT copy (link count 1, not a
# hardlink). It does not refresh itself, and skipping it ships stale scene
# files that make a landed fix look broken. Source is web_import/gml, the
# authoritative masters -- never webapp/dist/gml.
$RS --delete web_import/gml/ $WEB_ROOT/gml/
EOF
)

# Tripwire for whoever edits this script next. dist/GAME is the dereferenced
# 1213-file master tree (668 WAVs, no .M4A) and dist/gml is a build-time
# snapshot; naming either one here is the single most expensive mistake
# available in this file. Fail loudly rather than let it through review.
if printf '%s\n' "$PUBLISH_SCRIPT" | grep -v '^[[:space:]]*#' | grep -Eq 'dist/(GAME|gml)'; then
  die "the publish list names dist/GAME or dist/gml." \
      "dist/GAME is the raw master tree Vite produced by dereferencing the" \
      "symlinks in webapp/public/ — copying it reintroduces 169 MiB of WAV and" \
      "destroys the uppercase-.M4A hardlink overlay. gml comes from web_import/gml."
fi

if [ "$DRY_RUN" = 1 ]; then
  while IFS= read -r line; do
    case "$line" in ''|'#'*) continue ;; esac
    plan "$line"
  done <<<"$PUBLISH_SCRIPT"
  # rsync's own dry-run, run for real, so --dry-run shows the actual file list
  # rather than a promise. Read-only: -n changes nothing.
  step "Publish preview (dry rsync against the build currently on the server)"
  info "content differences only; a fresh build may produce a different hash"
  remote "cd $REMOTE_REPO
    for pair in 'webapp/dist/assets/>$WEB_ROOT/assets/' 'webapp/dist/video/>$WEB_ROOT/video/' 'web_import/gml/>$WEB_ROOT/gml/'; do
      src=\${pair%%>*}; dst=\${pair##*>}
      if [ ! -d \"\$src\" ]; then echo \"  \$src absent — no build present on the server yet\"; continue; fi
      echo \"  \$src -> \$dst\"
      out=\$($RS --delete -ni \"\$src\" \"\$dst\")
      if [ -n \"\$out\" ]; then printf '%s\n' \"\$out\" | sed 's/^/      /'
      else echo '      (no content changes)'; fi
    done
    for f in index.html _headers; do
      if [ ! -f \"webapp/dist/\$f\" ]; then echo \"  webapp/dist/\$f absent\"; continue; fi
      out=\$($RS -ni \"webapp/dist/\$f\" \"$WEB_ROOT/\$f\")
      if [ -n \"\$out\" ]; then echo \"  webapp/dist/\$f -> $WEB_ROOT/\$f: changes\"
      else echo \"  webapp/dist/\$f -> $WEB_ROOT/\$f: (no content changes)\"; fi
    done" || warn "publish preview unavailable"
else
  remote "$PUBLISH_SCRIPT"
  ok "assets/, index.html, _headers, video/, gml/ refreshed"
fi

fi   # end of the transport/build/publish block skipped by --verify-only

# ---------------------------------------------------------------------------
# 6. Verify — prove it, do not assume it
# ---------------------------------------------------------------------------

step "Verify"

if [ "$DRY_RUN" = 1 ]; then
  plan "re-fingerprint GAME/ and compare to the pre-state above"
  plan "md5 every $WEB_ROOT/gml/* against web_import/gml/*, assert CRLF survived"
  plan "GET / (200), new /assets/<hash>.js (200 immutable), old bundle (404)"
  plan "GET /gml/intro.gml (200, ISO-8859-1, no-cache, md5 == master)"
  plan "GET a .M4A (200 audio/mp4) and a .PNG (200 image/png)"
  plan "GET /chapter2 (200, app HTML — proves the SPA fallback)"
  plan "GET a nonexistent asset (404 — proves the fallback is NOT masking assets)"
else
  # -- GAME overlay untouched -------------------------------------------------
  read -r POST_FILES POST_WAV POST_M4A POST_LC POST_PNG POST_INO <<EOF
$(remote "cd $WEB_ROOT && printf '%s %s %s %s %s %s\n' \
    \"\$(find GAME -type f | wc -l)\" \
    \"\$(find GAME -iname '*.wav' | wc -l)\" \
    \"\$(find GAME -name '*.M4A' | wc -l)\" \
    \"\$(find GAME -name '*.m4a' | wc -l)\" \
    \"\$(find GAME -name '*.PNG' | wc -l)\" \
    \"\$(find GAME -name '*.M4A' | sort | head -1 | xargs stat -c %i)\"")
EOF
  [ "$POST_WAV" = 0 ] || die "$POST_WAV WAV files appeared under GAME/ — something copied dist/GAME."
  [ "$POST_LC" = 0 ]  || die "$POST_LC lowercase .m4a files appeared under GAME/ — silent audio loss."
  [ "$POST_FILES $POST_M4A $POST_PNG" = "$PRE_GAME_FILES $PRE_GAME_M4A $PRE_GAME_PNG" ] || die \
    "GAME/ file counts changed ($PRE_GAME_FILES/$PRE_GAME_M4A/$PRE_GAME_PNG -> $POST_FILES/$POST_M4A/$POST_PNG)." \
    "This deploy must not touch GAME/ at all."
  [ "$POST_INO" = "$PRE_GAME_INO" ] || die \
    "GAME/ sample inode changed — files were replaced rather than left alone."
  POST_LINKS="$(remote "cd $WEB_ROOT && find GAME -name '*.M4A' | sort | head -1 | xargs stat -c %h")"
  [ "$POST_LINKS" -ge 2 ] || die "GAME hardlinks broken (link count $POST_LINKS) — the overlay became real copies."
  ok "GAME overlay untouched: $POST_FILES files, 0 WAV, 0 lowercase m4a, links=$POST_LINKS, inode stable"

  # -- gml is a real copy of the masters, byte for byte ------------------------
  GML_REPORT="$(remote "
    cd $REMOTE_REPO
    fail=0
    for src in web_import/gml/*; do
      name=\$(basename \"\$src\")
      dst=$WEB_ROOT/gml/\$name
      if [ ! -f \"\$dst\" ]; then echo \"MISSING \$name\"; fail=1; continue; fi
      a=\$(md5sum <\"\$src\" | cut -d' ' -f1)
      b=\$(md5sum <\"\$dst\" | cut -d' ' -f1)
      if [ \"\$a\" != \"\$b\" ]; then echo \"STALE \$name (\$a != \$b)\"; fail=1; continue; fi
      case \"\$name\" in
        *.gml)
          if ! LC_ALL=C grep -q \$'\r' \"\$dst\"; then echo \"NOCRLF \$name\"; fail=1; continue; fi ;;
      esac
      echo \"OK \$name\"
    done
    exit \$fail")" || die \
      "serving-root gml/ does not match web_import/gml:" \
      "$(printf '%s\n' "$GML_REPORT" | grep -v '^OK ' | sed 's/^/          /')" \
      "This is the 'landed fix looks broken' failure: stale scene files under a fresh bundle."
  ok "gml/ md5-matches web_import/gml ($(printf '%s\n' "$GML_REPORT" | grep -c '^OK ') files), CRLF intact"

  # -- what is actually served ------------------------------------------------
  POST_ASSETS="$(remote "cd $WEB_ROOT && ls assets")"
  NEW_JS="$(printf '%s\n' "$POST_ASSETS" | grep '\.js$' | head -1)"
  [ -n "$NEW_JS" ] || die "no .js in the serving root's assets/ after publish."

  http() { curl -sS -o "$2" -w '%{http_code}' --max-time 30 -D "$3" "$BASE_URL$1"; }
  TMPB="$(mktemp)"; TMPH="$(mktemp)"; SCRATCH+=("$TMPB" "$TMPH")

  code="$(http "/" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET / returned $code."
  grep -q "$NEW_JS" "$TMPB" || die \
    "the served index.html does not reference $NEW_JS." \
    "index.html and the bundle are out of step — browsers would load the old JS."
  ok "/ serves index.html referencing $NEW_JS"

  code="$(http "/assets/$NEW_JS" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET /assets/$NEW_JS returned $code."
  grep -qi 'cache-control:.*immutable' "$TMPH" || warn "/assets/* is not immutable — expected for content-hashed files"
  ok "/assets/$NEW_JS 200, immutable"

  # Old bundles must be GONE, not merely shadowed. If rsync had merged instead
  # of --delete, stale hashed bundles would pile up forever and a rollback would
  # silently serve one of them.
  gone=0
  for old in $PRE_ASSETS; do
    printf '%s\n' "$POST_ASSETS" | grep -qx "$old" && continue
    code="$(http "/assets/$old" "$TMPB" "$TMPH")"
    [ "$code" = 404 ] || die "old bundle /assets/$old still returns $code — it should be gone."
    gone=$((gone + 1))
  done
  if [ "$gone" -gt 0 ]; then ok "$gone superseded bundle(s) now 404"
  else info "bundle hash unchanged — this build is byte-identical to the last"; fi

  # /gml/* is not content-hashed, so it must revalidate. Blind caching here
  # means a new bundle running against an hour-old scene file: looks exactly
  # like a regression, wastes a bug report.
  code="$(http "/gml/intro.gml" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET /gml/intro.gml returned $code."
  grep -qi 'content-type:.*ISO-8859-1' "$TMPH" || die \
    "/gml/intro.gml is not served as ISO-8859-1 — Icelandic text will be mojibake."
  grep -qi 'cache-control:.*no-cache' "$TMPH" || warn \
    "/gml/* is not no-cache; filenames are not content-hashed so it must revalidate"
  # Disk -> wire. (Laptop -> disk is what the md5 loop above already proved.)
  served_md5="$(md5 -q "$TMPB" 2>/dev/null || md5sum <"$TMPB" | cut -d' ' -f1)"
  master_md5="$(remote "md5sum <$REMOTE_REPO/web_import/gml/intro.gml | cut -d' ' -f1")"
  [ "$served_md5" = "$master_md5" ] || die \
    "served /gml/intro.gml differs from the master on disk." \
    "Caddy is serving something other than the file we published."
  LC_ALL=C grep -q $'\r' "$TMPB" || die "served /gml/intro.gml has lost its CRLF line endings."
  ok "/gml/intro.gml 200, ISO-8859-1, no-cache, md5 == master, CRLF intact"

  # A .M4A that answers with a text content-type makes the engine's probe fall
  # back to .WAV, and the WAVs are not in this tree. Check the header, not just
  # the status.
  SAMPLE_M4A="$(remote "cd $WEB_ROOT && find GAME -name '*.M4A' | sort | head -1")"
  code="$(http "/$SAMPLE_M4A" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET /$SAMPLE_M4A returned $code — audio is not being served."
  grep -qi 'content-type: *audio/' "$TMPH" || die \
    "/$SAMPLE_M4A is not served with an audio content-type." \
    "The engine probes Content-Type; anything text/* downgrades it to .WAV, which is absent."
  ok "/$SAMPLE_M4A 200 $(grep -i '^content-type' "$TMPH" | tr -d '\r' | cut -d' ' -f2)"

  SAMPLE_PNG="$(remote "cd $WEB_ROOT && find GAME -name '*.PNG' | sort | head -1")"
  code="$(http "/$SAMPLE_PNG" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET /$SAMPLE_PNG returned $code."
  # Size guard catches an LFS pointer masquerading as an image: 130 bytes of
  # "version https://git-lfs..." returns a perfectly cheerful 200.
  sz="$(wc -c <"$TMPB" | tr -d ' ')"
  [ "$sz" -gt 1000 ] || die "/$SAMPLE_PNG is only $sz bytes — almost certainly a Git-LFS pointer, not an image."
  ok "/$SAMPLE_PNG 200, $sz bytes (not an LFS pointer)"

  # SPA fallback both ways: routes must resolve, assets must NOT be masked.
  code="$(http "/chapter2" "$TMPB" "$TMPH")"
  [ "$code" = 200 ] || die "GET /chapter2 returned $code — try_files fallback is broken, chapters will 404."
  grep -q 'game-container' "$TMPB" || die "/chapter2 did not return the app HTML."
  ok "/chapter2 200, app HTML (SPA fallback works)"

  code="$(http "/assets/index-DOES-NOT-EXIST.js" "$TMPB" "$TMPH")"
  [ "$code" = 404 ] || die \
    "a missing asset returned $code instead of 404 — index.html is masking asset 404s," \
    "which turns every typo'd asset path into a silent, undebuggable failure."
  ok "missing asset 404s (fallback is not masking assets)"

fi

# ---------------------------------------------------------------------------
# 7. Report
# ---------------------------------------------------------------------------

# Known latent trap, deliberately NOT fixed here: /video/* is served immutable
# but INTRO.mp4 is not content-hashed, and tools/pipeline/ exists precisely to
# re-render it. A returning browser will keep the old film for a year.
warn "/video/INTRO.mp4 is served 'immutable' but is NOT content-hashed. Re-rendering it"
warn "  (tools/pipeline/make-video.sh) will not reach returning browsers. Fix in Caddy or"
warn "  hash the filename — out of scope for this script, which never touches Caddy."
# Caddy does not read _headers -- that is a Netlify/Pages convention. It is
# published because dist ships it and it documents intent, but the live cache
# and charset rules all come from /etc/caddy/Caddyfile.
warn "_headers is published for documentation only; Caddy does not read it."

step "Result"
if   [ "$DRY_RUN"     = 1 ]; then MODE='DRY RUN — nothing changed'
elif [ "$VERIFY_ONLY" = 1 ]; then MODE='VERIFY ONLY — nothing changed'
else                              MODE='deployed'; fi
printf '  mode       %s\n' "$MODE"
printf '  host       %s\n' "$SSH_HOST"
printf '  branch     %s\n' "$BRANCH"
if [ "$VERIFY_ONLY" = 1 ]; then
  printf '  commit     server %s (laptop %s)\n' "${REMOTE_SHA:0:7}" "${LOCAL_SHA:0:7}"
else
  printf '  commit     %s -> %s  (%s)\n' "${REMOTE_SHA:0:7}" "${LOCAL_SHA:0:7}" "$LOCAL_SUBJECT"
fi
printf '  transport  %s\n' "$TRANSPORT"
[ "$DRY_RUN" = 1 ] || printf '  bundle     %s%s\n' \
  "$([ "$VERIFY_ONLY" = 1 ] && echo '' || printf '%s -> ' "$(printf '%s ' $PRE_ASSETS)")" "$NEW_JS"
printf '  checks     %d passed\n' "$CHECKS_RUN"
printf '  url        %s\n' "$BASE_URL"

if [ "${#WARNINGS[@]}" -gt 0 ]; then
  printf '\n  %s%d warning(s):%s\n' "$C_YEL" "${#WARNINGS[@]}" "$C_OFF"
  for w in "${WARNINGS[@]}"; do printf '    %s\n' "$w"; done
fi

if [ "$DRY_RUN" = 1 ]; then
  printf '\n%sDry run complete.%s Re-run without --dry-run to deploy.\n' "$C_GRN" "$C_OFF"
elif [ "$VERIFY_ONLY" = 1 ]; then
  printf '\n%sLive site verified.%s Nothing was deployed.\n' "$C_GRN" "$C_OFF"
else
  printf '\n%sDeployed and verified.%s\n' "$C_GRN" "$C_OFF"
fi
