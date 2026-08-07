#!/usr/bin/env bash
# Regenerate the web-playable backstory film from the disc master.
#
# The 1999 disc ships INTRO.AVI as Cinepak, which no current browser decodes.
# The master stays untouched in web_import/; this produces the derivative the
# app actually plays.
set -euo pipefail
cd "$(dirname "$0")/../.."

SRC=web_import/INTRO.AVI
OUT=webapp/public/video/INTRO.mp4

[ -f "$SRC" ] || { echo "missing master: $SRC" >&2; exit 1; }
command -v ffmpeg >/dev/null || { echo "ffmpeg required" >&2; exit 1; }

mkdir -p "$(dirname "$OUT")"
ffmpeg -v error -i "$SRC" \
  -c:v libx264 -crf 20 -preset slow -pix_fmt yuv420p -movflags +faststart \
  -c:a aac -b:a 128k \
  "$OUT" -y

printf 'wrote %s (%s)\n' "$OUT" "$(du -h "$OUT" | cut -f1)"
