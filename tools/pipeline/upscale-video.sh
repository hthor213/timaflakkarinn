#!/usr/bin/env bash
# Upscale + frame-interpolate the 1998 backstory film.
#
#   320x240 Cinepak @ 7fps  ->  1280x960 H.264 @ 30fps
#
# The original 3D project files are long gone (the workstation with them), so
# this synthesises detail rather than recovering it. Order matters:
#   1. deblock/denoise at NATIVE resolution — upscaling Cinepak block artifacts
#      just gives you beautifully sharp blocks
#   2. AI upscale each frame (Real-ESRGAN via Upscayl's bundled binary)
#   3. interpolate LAST, on the already-upscaled frames
set -euo pipefail
cd "$(dirname "$0")/../.."

MODEL="${1:-digital-art-4x}"
SRC=web_import/INTRO.AVI
WORK="${TMPDIR:-/tmp}/tt-upscale-$MODEL"
# Experiments land OUTSIDE the repo. webapp/public/video/ is served and
# LFS-tracked, so a candidate cut left there gets shipped and committed by
# accident. Only the chosen cut is promoted, deliberately, by hand.
EXP="${EXPERIMENTS_DIR:-$HOME/Documents/GitHub/timaflakkarinn-disc/work/video-experiments}"
mkdir -p "$EXP"
OUT7="$EXP/INTRO_${MODEL}_7fps.mp4"
OUT30="$EXP/INTRO_${MODEL}_30fps.mp4"
KEEP="${KEEP_FRAMES:-0}"
BIN=/Applications/Upscayl.app/Contents/Resources/bin/upscayl-bin
MODELS=/Applications/Upscayl.app/Contents/Resources/models
FPS=7.0000049   # r_frame_rate 1000000/142857, not exactly 7

[ -f "$SRC" ] || { echo "missing master: $SRC" >&2; exit 1; }
[ -x "$BIN" ] || { echo "Upscayl not installed (brew install --cask upscayl)" >&2; exit 1; }

rm -rf "$WORK"; mkdir -p "$WORK/src" "$WORK/up"

echo "1/3 extracting + deblocking frames..."
ffmpeg -v error -i "$SRC" \
  -vf "deblock=filter=weak:block=4,hqdn3d=2:1:2:3" \
  -vsync 0 "$WORK/src/%05d.png" -y
echo "    $(ls "$WORK/src" | wc -l | tr -d ' ') frames"

echo "2/3 upscaling with $MODEL (4x)..."
"$BIN" -i "$WORK/src" -o "$WORK/up" -m "$MODELS" -n "$MODEL" -s 4 2>&1 | tail -2

# 3a. Native cadence, no interpolation.
#
# This is the FAITHFUL one. Long passages of this film are deliberately held
# stills with only a small region animating -- a 1998 trick so Cinepak spent no
# bits on the static frame and the storybook text resolved crisply. Motion
# interpolation hunts for movement across the whole frame, finds spurious
# matches in that text, and smears it. It fights an authoring decision.
echo "3/4 reassembling at native cadence (no interpolation)..."
ffmpeg -v error -framerate "$FPS" -i "$WORK/up/%05d.png" -i "$SRC" \
  -map 0:v -map 1:a \
  -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -movflags +faststart \
  -c:a aac -b:a 160k "$OUT7" -y
printf '    wrote %s (%s)\n' "$OUT7" "$(du -h "$OUT7" | cut -f1)"

# 3b. Interpolated to 30fps, for comparison. Known to soften held text.
echo "4/4 interpolating to 30fps (comparison cut)..."
ffmpeg -v error -framerate "$FPS" -i "$WORK/up/%05d.png" -i "$SRC" \
  -filter_complex "[0:v]minterpolate=fps=30:mi_mode=mci:mc_mode=aobmc:vsbmc=1[v]" \
  -map "[v]" -map 1:a \
  -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -movflags +faststart \
  -c:a aac -b:a 160k "$OUT30" -y
printf '    wrote %s (%s)\n' "$OUT30" "$(du -h "$OUT30" | cut -f1)"

if [ "$KEEP" = "1" ]; then
  echo "frames kept at $WORK"
else
  rm -rf "$WORK"
fi
