#!/usr/bin/env python3
"""
Find the spoken bursts in a recording, so subtitle words can be timed against
real audio instead of guessed from character counts.

WHY THIS EXISTS. 1998 timed the content per SENTENCE: <Sentence text time> says
when a line starts and nothing about the words inside it. Highlighting the word
being spoken therefore had to estimate, and spreading a line evenly across its
words is wrong wherever the actor pauses or leans on a word.

But the pauses are measurable. A line like "Hvað er um að vera?" is not one
continuous noise -- it is a few bursts separated by short silences, and those
bursts are where the phrases are. Splitting on loudness gives real boundaries;
words are then distributed inside each burst by length, which is a much smaller
guess over a much shorter span.

This is deliberately NOT forced alignment. It needs no model, no Icelandic
acoustic data and no network, and it runs on the WAV masters that are already in
the repo -- there is no ffmpeg on the build host. It cannot tell you which word
is which; it tells you when speech happened, which removes most of the error.

Reads the ISO-era WAV masters directly with the standard library. The derived
AAC is not used: it is lossy, gitignored, and absent from a fresh clone.

Usage:
    tools/pipeline/speech-segments.py <file.wav> [...]        # inspect
    tools/pipeline/speech-segments.py --json <dir>            # batch a tree
"""
import sys
import os
import json
import wave
import array
import math

WINDOW_MS = 10          # RMS window
SILENCE_DB = -38.0      # below this is silence, relative to full scale
MIN_GAP_MS = 110        # shorter silences are within-phrase, not boundaries
MIN_BURST_MS = 70       # shorter bursts are clicks, breaths, consonant noise


def read_wav(path):
    """Return (samples as ints centred on zero, sample_rate)."""
    with wave.open(path, 'rb') as w:
        rate = w.getframerate()
        channels = w.getnchannels()
        width = w.getsampwidth()
        raw = w.readframes(w.getnframes())

    if width == 2:
        samples = array.array('h')
        samples.frombytes(raw[:len(raw) // 2 * 2])
        scale = 32768.0
    elif width == 1:
        # 8-bit WAV is UNSIGNED; centre it or every sample reads as loud.
        samples = array.array('b', bytes((b - 128) & 0xFF for b in raw))
        scale = 128.0
    else:
        raise ValueError(f'{path}: unsupported sample width {width}')

    if channels > 1:                      # mix down; these masters are mono anyway
        samples = array.array(samples.typecode,
                              [samples[i] for i in range(0, len(samples), channels)])
    return samples, rate, scale


def bursts(path):
    samples, rate, scale = read_wav(path)
    win = max(1, int(rate * WINDOW_MS / 1000))
    total_ms = len(samples) * 1000.0 / rate

    loud = []
    for i in range(0, len(samples) - win, win):
        acc = 0
        for s in samples[i:i + win]:
            acc += s * s
        rms = math.sqrt(acc / win) / scale
        db = 20 * math.log10(rms) if rms > 1e-9 else -120.0
        loud.append(db >= SILENCE_DB)

    # Runs of loud windows, with short gaps bridged.
    segs = []
    i = 0
    while i < len(loud):
        if not loud[i]:
            i += 1
            continue
        j = i
        gap = 0
        while j < len(loud):
            if loud[j]:
                gap = 0
            else:
                gap += 1
                if gap * WINDOW_MS >= MIN_GAP_MS:
                    break
            j += 1
        start = i * WINDOW_MS
        end = (j - gap) * WINDOW_MS
        if end - start >= MIN_BURST_MS:
            segs.append([round(start), round(end)])
        i = j + 1
    return segs, round(total_ms)


def main():
    args = sys.argv[1:]
    as_json = '--json' in args
    args = [a for a in args if a != '--json']
    if not args:
        print(__doc__)
        return 1

    targets = []
    for a in args:
        if os.path.isdir(a):
            for root, _, files in os.walk(a):
                for f in sorted(files):
                    if f.lower().endswith('.wav'):
                        targets.append(os.path.join(root, f))
        else:
            targets.append(a)

    out = {}
    for path in targets:
        try:
            segs, total = bursts(path)
        except Exception as e:                      # a bad master must not stop a batch
            print(f'  !! {path}: {e}', file=sys.stderr)
            continue
        if as_json:
            out[path] = {'duration': total, 'segments': segs}
        else:
            print(f'{os.path.basename(path)}  {total} ms, {len(segs)} burst(s)')
            for s, e in segs:
                print(f'    {s:>6} - {e:>6} ms   ({e - s} ms)')
    if as_json:
        json.dump(out, sys.stdout, ensure_ascii=False, indent=1)
    return 0


if __name__ == '__main__':
    sys.exit(main())
