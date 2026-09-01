#!/usr/bin/env bash
# WORKSTATION-ONLY render tool (needs Upscayl + ffmpeg on a desktop) — not part
# of deployment; tools/deploy.sh never calls this. Paths below are env-overridable.
#
# Hybrid render of the 1998 backstory film — the DELIVERABLE cut.
#
#   320x240 Cinepak @ 7fps  ->  1280x960 H.264 @ 7fps (native cadence)
#
# Sibling to upscale-video.sh. That script is the exploration harness: it runs
# one treatment over the whole film and emits comparison cuts. This one applies
# TWO treatments and cross-dissolves between them, because the film is really
# two films stapled together:
#
#   f1..127    the camera moves. AI upscaling flickers here — Real-ESRGAN
#              hallucinates different detail into each frame and the difference
#              reads as crawling texture. Motion masks softness anyway, so the
#              AI trade is all cost and no benefit. Conventional lanczos +
#              unsharp measures as adding ZERO temporal instability over the
#              source.
#
#   f128..531  the camera stops dead (per-frame motion collapses 2.07 -> 0.29
#              -> 0.05 across f127/128/129). Nothing masks softness now, and the
#              subject is a storybook page whose text has to resolve. AI upscale
#              earns its keep, and a temporal denoiser (atadenoise) can average
#              across near-identical frames to kill the residual flicker that
#              would otherwise be obvious on a locked frame.
#
# Order matters: deblock/denoise at NATIVE resolution before upscaling, or you
# just get beautifully sharp Cinepak blocks.
#
# NOT done, deliberately: no interpolation to 30fps. Long passages are held
# stills with only a small region animating — a 1998 trick so Cinepak spent no
# bits on the static frame and the text stayed crisp. Motion interpolation hunts
# for movement across the whole frame, finds spurious matches in that text, and
# smears it. It fights an authoring decision. Native cadence only.
set -euo pipefail
cd "$(dirname "$0")/../.."

MODEL="${MODEL:-high-fidelity-4x}"      # strictly dominates digital-art-4x here:
                                        # less flicker AND measurably sharper
SRC=web_import/INTRO.AVI                # read-only, irreplaceable master

# Cross-dissolve window, inclusive, in 1-based source frame numbers.
# Chosen so the dissolve COMPLETES on the last moving frame: by f128, the first
# locked frame, the image is 100% AI and stops changing treatment. A window that
# ran past 128 would slowly morph texture on a static image — a "sharpening
# breath" that is more visible than the seam it was meant to hide.
DISS_START="${DISS_START:-118}"
DISS_END="${DISS_END:-128}"
# Weights follow a smoothstep, not a ramp: a linear fade has a slope
# discontinuity at both ends, and that kink is exactly where a pop shows.
# Smoothstep makes the first and last per-frame steps ~2%, i.e. invisible.

# atadenoise s=15 needs +-7 frames of context. Give the AI pass a lead-in so the
# first frames we actually use are fully-supported, then discard it.
LEADIN="${LEADIN:-13}"

# Experiments land OUTSIDE the repo. webapp/public/video/ is served and
# LFS-tracked, so a candidate cut left there gets shipped and committed by
# accident. Only the chosen cut is promoted, deliberately, by hand.
EXP="${EXPERIMENTS_DIR:-$HOME/timaflakkarinn-disc/work/video-experiments}"
WORK="${WORK_DIR:-$HOME/timaflakkarinn-disc/work/hybrid}"
OUT="$EXP/INTRO_hybrid_${MODEL}_7fps.mp4"
KEEP="${KEEP_FRAMES:-0}"
BIN="${UPSCAYL_BIN:-/Applications/Upscayl.app/Contents/Resources/bin/upscayl-bin}"
MODELS="${UPSCAYL_MODELS:-/Applications/Upscayl.app/Contents/Resources/models}"
FPS=7.0000049   # r_frame_rate 1000000/142857, not exactly 7

# Tone match at the seam. MEASURED, and the answer is: none needed.
#
# Over f115..134 the two treatments agree on mean luma to 0.005/255 (-0.00%),
# and per-channel to <=0.35/255. Global std does differ — AI/lanczos = 0.967 —
# but that is NOT a contrast mismatch. Splitting each frame into low- and
# high-frequency bands (gaussian sigma 8) gives:
#     low-freq  (true tone/contrast) ratio 0.995   <- matches
#     high-freq (detail/sharpening)  ratio 0.795
# i.e. the entire 3.3% gap is the unsharp halo energy the lanczos path adds,
# not tone. Correcting it with eq=contrast would drag real tone off to
# compensate for a sharpening difference and CREATE the seam it was meant to
# fix. Left empty deliberately; the hook stays for a future model that does
# drift.
AI_EQ="${AI_EQ:-}"                      # e.g. "eq=brightness=0.004:contrast=1.01"

# Filter chains ------------------------------------------------------------
# Moving section: no AI. hqdn3d is heavier here than on the AI path because
# nothing downstream will clean up after it.
LANCZOS_VF="format=yuv444p,deblock=filter=weak:block=4,hqdn3d=3:2:4:3,scale=1280:960:flags=lanczos,unsharp=5:5:1.4:5:5:0"
# Locked section, native res, before the upscaler.
NATIVE_VF="deblock=filter=weak:block=4,hqdn3d=2:1:2:3"
# Locked section, after the upscaler. Kept in 444 — the yuv420p subsample is
# deferred to the final encode so the intermediate PNGs stay full-chroma.
#
# s=15 means +-7 frames, which overlaps the MOVING frames in the dissolve
# window, so the obvious worry is temporal smearing there. Checked: atadenoise
# is motion-adaptive (it stops extending the average once a pixel exceeds the
# threshold), and on f118..128 the frames do NOT move toward their temporal
# neighbours — the ghost metric is ~0 and mostly negative. High-frequency
# detail is retained at 98-99% throughout. Thresholds carried over from the
# digital-art-4x tuning are still right for high-fidelity-4x; no change needed.
ATA_VF="format=yuv444p,atadenoise=0a=0.12:0b=0.30:1a=0.12:1b=0.30:2a=0.12:2b=0.30:s=15"

[ -f "$SRC" ] || { echo "missing master: $SRC" >&2; exit 1; }
[ -x "$BIN" ] || { echo "Upscayl binary not found at $BIN (install Upscayl, or set UPSCAYL_BIN / UPSCAYL_MODELS)" >&2; exit 1; }
[ -f "$MODELS/$MODEL.param" ] || {
  echo "unknown model: $MODEL (have: $(ls "$MODELS" | sed 's/\..*//' | sort -u | tr '\n' ' '))" >&2; exit 1; }

mkdir -p "$EXP"
rm -rf "$WORK"; mkdir -p "$WORK"/{nat,aiin,ai,aid,lz,final}

NFRAMES=$(ffprobe -v error -select_streams v:0 -count_frames \
  -show_entries stream=nb_read_frames -of csv=p=0 "$SRC")
AI_FIRST=$(( DISS_START - LEADIN ))
[ "$AI_FIRST" -lt 1 ] && AI_FIRST=1
echo "source: $NFRAMES frames | dissolve f$DISS_START..f$DISS_END | model $MODEL"

# 1. Native-resolution clean, for the AI path -------------------------------
echo "1/6 extracting + deblocking at native resolution..."
ffmpeg -v error -i "$SRC" -vf "$NATIVE_VF" -vsync 0 "$WORK/nat/%05d.png" -y

# 2. Lanczos treatment, full length -----------------------------------------
# Run over the whole film even though only f1..DISS_END is used: hqdn3d is
# temporal, so generating a truncated stream is not free of edge effects, and
# having every frame in both treatments makes any A/B comparison one command.
echo "2/6 lanczos treatment (moving section)..."
ffmpeg -v error -i "$SRC" -vf "$LANCZOS_VF" -vsync 0 "$WORK/lz/%05d.png" -y

# 3. AI upscale, locked section + lead-in ------------------------------------
echo "3/6 upscaling f$AI_FIRST..$NFRAMES with $MODEL (4x)..."
for i in $(seq "$AI_FIRST" "$NFRAMES"); do
  cp "$WORK/nat/$(printf %05d "$i").png" "$WORK/aiin/"
done
"$BIN" -i "$WORK/aiin" -o "$WORK/ai" -m "$MODELS" -n "$MODEL" -s 4 2>&1 | tail -2

# 4. Temporal denoise over the AI frames -------------------------------------
echo "4/6 temporal denoise (atadenoise)..."
ffmpeg -v error -start_number "$AI_FIRST" -i "$WORK/ai/%05d.png" \
  -vf "${AI_EQ:+$AI_EQ,}$ATA_VF" -vsync 0 -start_number "$AI_FIRST" \
  "$WORK/aid/%05d.png" -y

# 5. Compose: lanczos | smoothstep cross-dissolve | AI ------------------------
echo "5/6 composing (cross-dissolve f$DISS_START..f$DISS_END)..."
SPAN=$(( DISS_END - DISS_START + 1 ))
for i in $(seq 1 "$NFRAMES"); do
  f=$(printf %05d "$i")
  if   [ "$i" -lt "$DISS_START" ]; then ln "$WORK/lz/$f.png"  "$WORK/final/$f.png"
  elif [ "$i" -gt "$DISS_END"   ]; then ln "$WORK/aid/$f.png" "$WORK/final/$f.png"
  else
    # smoothstep 3t^2-2t^3 over the OPEN interval, so f(DISS_START-1)=0 and
    # f(DISS_END+1)=1 fall naturally on the pure endpoints.
    w=$(awk -v n="$i" -v s="$DISS_START" -v sp="$SPAN" \
        'BEGIN{t=(n-s+1)/(sp+1); printf "%.6f", t*t*(3-2*t)}')
    # blend: A = first input (lanczos), B = second (AI).
    ffmpeg -v error -i "$WORK/lz/$f.png" -i "$WORK/aid/$f.png" \
      -filter_complex "[0:v][1:v]blend=all_expr='A*(1-$w)+B*$w'" \
      -update 1 "$WORK/final/$f.png" -y
    printf '    f%d w=%s\n' "$i" "$w"
  fi
done

# 6. Encode ------------------------------------------------------------------
echo "6/6 encoding..."
ffmpeg -v error -framerate "$FPS" -i "$WORK/final/%05d.png" -i "$SRC" \
  -map 0:v -map 1:a \
  -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -movflags +faststart \
  -c:a aac -b:a 160k "$OUT" -y
printf '    wrote %s (%s)\n' "$OUT" "$(du -h "$OUT" | cut -f1)"

if [ "$KEEP" = "1" ]; then echo "frames kept at $WORK"; else rm -rf "$WORK"; fi
