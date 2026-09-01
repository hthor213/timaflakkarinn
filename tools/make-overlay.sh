#!/usr/bin/env bash
#
# Build a serving root's GAME/ overlay.
#
# GAME/ is the one part of a web root that deploy.sh never publishes. It is a
# hardlink overlay: 545 PNGs linked from the GAME masters in the repo, and 668
# .M4A linked from the transcoded audio cache, with the extension uppercased.
# Nothing is copied, so a second serving root costs no disk -- both roots point
# at the same inodes.
#
# Until now this tree was built by hand and existed only on the machine that
# built it, which is exactly why a dev serving root could not be created. This
# script is that missing step.
#
# Two things it deliberately enforces, because deploy.sh dies on both:
#
#   - no .wav in the overlay. The masters are WAV; the engine probes
#     Content-Type and a WAV fallback that is not present reads as total audio
#     loss. The overlay carries AAC only.
#   - .M4A uppercase. resolvePath() builds uppercase names, the server is
#     case-sensitive, and lowercase .m4a 404s every voice line silently.
#
# Usage: tools/make-overlay.sh <web-root> [options]
#
#   --game-src DIR   PNG masters      (default: <repo>/web_import/GAME)
#   --m4a-src DIR    transcoded audio (default: $TT_M4A_CACHE, else
#                                      <repo>/web_import/GAME_M4A)
#   --force          rebuild even if <web-root>/GAME already exists
#   --verify-only    check an existing overlay and change nothing
#   --dry-run        say what would happen and change nothing
#
# NOTE on the audio cache: web_import/GAME_M4A is gitignored -- it is derived
# from the WAV masters and is build output, so it is not committed. It is
# therefore NOT present in a fresh clone. Point --m4a-src at a machine that has
# it, or re-run the transcode, before building an overlay on a new host.
#
set -euo pipefail

cd "$(dirname "$0")/.."
REPO_ROOT="$PWD"

GAME_SRC="$REPO_ROOT/web_import/GAME"
M4A_SRC="${TT_M4A_CACHE:-$REPO_ROOT/web_import/GAME_M4A}"
FORCE=0
DRY_RUN=0
VERIFY_ONLY=0
WEB_ROOT=""

usage() { sed -n '2,/^set -euo/p' "$0" | sed 's/^# \{0,1\}//;$d'; exit "${1:-0}"; }

while [ $# -gt 0 ]; do
  case "$1" in
    --game-src)    GAME_SRC="$2"; shift ;;
    --m4a-src)     M4A_SRC="$2";  shift ;;
    --force)       FORCE=1 ;;
    --dry-run)     DRY_RUN=1 ;;
    --verify-only) VERIFY_ONLY=1 ;;
    -h|--help)     usage 0 ;;
    -*) printf 'unknown option: %s\n\n' "$1" >&2; usage 1 ;;
    *)  [ -z "$WEB_ROOT" ] || { printf 'unexpected argument: %s\n\n' "$1" >&2; usage 1; }
        WEB_ROOT="$1" ;;
  esac
  shift
done

[ -n "$WEB_ROOT" ] || { printf 'missing <web-root>\n\n' >&2; usage 1; }

if [ -t 1 ]; then
  C_RED=$'\033[31m'; C_GRN=$'\033[32m'; C_BLU=$'\033[36m'; C_DIM=$'\033[2m'; C_OFF=$'\033[0m'
else
  C_RED=; C_GRN=; C_BLU=; C_DIM=; C_OFF=
fi

step() { printf '\n%s==>%s %s\n' "$C_BLU" "$C_OFF" "$1"; }
ok()   { printf '  %s+%s %s\n' "$C_GRN" "$C_OFF" "$1"; }
info() { printf '  %s.%s %s\n' "$C_DIM" "$C_OFF" "$1"; }
die()  {
  printf '\n%sREFUSED%s %s\n' "$C_RED" "$C_OFF" "$1" >&2
  shift; for l in "$@"; do printf '        %s\n' "$l" >&2; done
  exit 1
}

# ---------------------------------------------------------------------------
# Census a built overlay against the invariants deploy.sh will later assert.
# ---------------------------------------------------------------------------
census() {
  local dir="$1" label="$2"
  [ -d "$dir" ] || die "$label: $dir does not exist."

  local total m4a png wav lc links
  total=$(find "$dir" -type f | wc -l)
  m4a=$(find "$dir" -name '*.M4A' | wc -l)
  png=$(find "$dir" -name '*.PNG' | wc -l)
  wav=$(find "$dir" -iname '*.wav' | wc -l)
  lc=$(find "$dir" -name '*.m4a' | wc -l)

  [ "$wav" = 0 ] || die "$label: $wav WAV files in the overlay." \
    "The overlay carries AAC only -- WAVs are masters and must not be served."
  [ "$lc" = 0 ] || die "$label: $lc lowercase .m4a in the overlay." \
    "resolvePath() builds uppercase names and the server is case-sensitive;" \
    "every voice line would 404 and fall back to a WAV that is not there."
  [ "$m4a" -gt 0 ] || die "$label: no .M4A in the overlay -- audio is missing entirely."
  [ "$png" -gt 0 ] || die "$label: no .PNG in the overlay -- art is missing entirely."

  links=$(stat -c %h "$(find "$dir" -name '*.M4A' | sort | head -1)")
  [ "$links" -ge 2 ] || die "$label: .M4A link count is $links -- these are real copies," \
    "not an overlay. Rebuilding would waste disk and let the two roots diverge."

  ok "$label: $total files, $m4a .M4A, $png .PNG, 0 WAV, 0 lowercase, links=$links"
}

# ---------------------------------------------------------------------------
# Verify-only stops here.
# ---------------------------------------------------------------------------
if [ "$VERIFY_ONLY" = 1 ]; then
  step "Verify overlay at $WEB_ROOT"
  census "$WEB_ROOT/GAME" "overlay"
  printf '\n%sOverlay is healthy.%s\n' "$C_GRN" "$C_OFF"
  exit 0
fi

# ---------------------------------------------------------------------------
# Sources
# ---------------------------------------------------------------------------
step "Sources"

[ -d "$GAME_SRC" ] || die "PNG masters not found: $GAME_SRC"
[ -d "$M4A_SRC" ]  || die "transcoded audio not found: $M4A_SRC" \
  "web_import/GAME_M4A is gitignored build output and is absent from a fresh" \
  "clone. Point --m4a-src at a directory that has it, or re-run the transcode."

SRC_PNG=$(find "$GAME_SRC" -type f ! -iname '*.wav' | wc -l)
SRC_M4A=$(find "$M4A_SRC" -name '*.m4a' | wc -l)
SRC_WAV=$(find "$GAME_SRC" -iname '*.wav' | wc -l)

[ "$SRC_PNG" -gt 0 ] || die "no non-WAV files under $GAME_SRC -- nothing to link."
[ "$SRC_M4A" -gt 0 ] || die "no .m4a under $M4A_SRC -- the transcode has not run."

info "art:   $SRC_PNG files from $GAME_SRC ($SRC_WAV WAV masters excluded)"
info "audio: $SRC_M4A .m4a from $M4A_SRC (linked as .M4A)"

# Hardlinks cannot cross filesystems. Say so plainly rather than silently
# falling back to copies, which would double the disk and let the roots drift.
WEB_PARENT=$(dirname "$WEB_ROOT")
[ -d "$WEB_PARENT" ] || die "parent of the web root does not exist: $WEB_PARENT"
DEV_WEB=$(stat -c %d "$WEB_PARENT")
DEV_PNG=$(stat -c %d "$GAME_SRC")
DEV_M4A=$(stat -c %d "$M4A_SRC")
[ "$DEV_WEB" = "$DEV_PNG" ] || die \
  "$GAME_SRC and $WEB_PARENT are on different filesystems." \
  "The overlay is built from hardlinks, which cannot cross a mount point."
[ "$DEV_WEB" = "$DEV_M4A" ] || die \
  "$M4A_SRC and $WEB_PARENT are on different filesystems." \
  "The overlay is built from hardlinks, which cannot cross a mount point."
ok "sources and target share one filesystem"

# ---------------------------------------------------------------------------
# Refuse to clobber silently
# ---------------------------------------------------------------------------
if [ -e "$WEB_ROOT/GAME" ] && [ "$FORCE" = 0 ]; then
  die "$WEB_ROOT/GAME already exists." \
      "Pass --force to rebuild it, or --verify-only to check it in place."
fi

if [ "$DRY_RUN" = 1 ]; then
  step "Dry run"
  info "would build $WEB_ROOT/GAME.new with $SRC_PNG art + $SRC_M4A audio hardlinks"
  info "would swap it into place as $WEB_ROOT/GAME"
  printf '\n%sNothing was changed.%s\n' "$C_GRN" "$C_OFF"
  exit 0
fi

# ---------------------------------------------------------------------------
# Build into GAME.new, then swap. A build that dies half way must never leave a
# partial overlay being served -- that is a live site with missing art.
# ---------------------------------------------------------------------------
step "Build"

mkdir -p "$WEB_ROOT"
NEW="$WEB_ROOT/GAME.new"
rm -rf "$NEW"
trap 'rm -rf "$NEW"' EXIT
mkdir -p "$NEW"

# Art: same relative path, name unchanged. WAV masters excluded.
while IFS= read -r -d '' f; do
  rel="${f#"$GAME_SRC"/}"
  mkdir -p "$NEW/$(dirname "$rel")"
  ln "$f" "$NEW/$rel"
done < <(find "$GAME_SRC" -type f ! -iname '*.wav' -print0)
ok "linked $SRC_PNG art files"

# Audio: same relative path, extension uppercased .m4a -> .M4A.
while IFS= read -r -d '' f; do
  rel="${f#"$M4A_SRC"/}"
  mkdir -p "$NEW/$(dirname "$rel")"
  ln "$f" "$NEW/${rel%.m4a}.M4A"
done < <(find "$M4A_SRC" -name '*.m4a' -print0)
ok "linked $SRC_M4A audio files as .M4A"

# ---------------------------------------------------------------------------
# Check the new tree BEFORE it becomes the served one.
# ---------------------------------------------------------------------------
step "Verify the new overlay"

census "$NEW" "new overlay"

# ---------------------------------------------------------------------------
# Swap
# ---------------------------------------------------------------------------
step "Swap into place"

if [ -e "$WEB_ROOT/GAME" ]; then
  rm -rf "$WEB_ROOT/GAME.old"
  mv "$WEB_ROOT/GAME" "$WEB_ROOT/GAME.old"
fi
mv "$NEW" "$WEB_ROOT/GAME"
trap - EXIT
rm -rf "$WEB_ROOT/GAME.old"
ok "$WEB_ROOT/GAME is live"

step "Final census"
census "$WEB_ROOT/GAME" "overlay"

printf '\n%sOverlay built.%s No bytes were copied -- every file is a hardlink.\n' \
  "$C_GRN" "$C_OFF"
