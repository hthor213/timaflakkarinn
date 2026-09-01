# Project intent and ownership

Recorded 2026-07-26. This repository is the **seed of a project that will become
open source**. This file records the intent and the ownership behind it, because
neither is derivable from the code or the git history.

## Phase 1 — today

Build a version of Tímaflakkarinn that **works and behaves like the original**.
Not a redesign, not a new game.

Faithfulness here is measured by feel rather than by pixels: the same
playability, the same decision trees, the same dialogue, and the same look from
a distance.

Within that bar, improving on the original is fair game. Converting graphics to
SVG so they scale cleanly, or interpolating frames so walking animates more
smoothly, would not break faithfulness — it is the same game, better rendered.
None of that is required. But part of the point is to attract a small community
of contributors, and a project that looks polished is a project people want to
work on.

Everything in the repository today serves that goal, and nothing in it is
settled. The engine, the asset pipeline and the chapter format may all be
re-architected as the rebuild matures.

## The path to open source

The original IP owners are **in alignment that this becomes open source**.

The trigger is quality: once the owners are satisfied that the rebuild matches
the original in quality and performance, the project opens up. Phase 1 is
therefore what stands between here and there.

That decision rests with the original IP owners, and nothing beyond it is
needed to make the flip.

**Flipped 2026-09-01.** Hjalti called it: the repository is public at
`github.com/hthor213/timaflakkarinn` (canonical), with the Forgejo instance
re-roled as public-read LFS host and mirror. The license split: the code (the
port, tools, docs) is MIT; the game content — art, audio, dialogue, GML, the
original program — remains all-rights-reserved with the owners listed below.
See `specs/004-open-source-and-pipeline.md` for the shape and
LICENSE/README for the statements.

## Who owns the original

Dímon was founded in **May 1998** and shipped Tímaflakkarinn in **November
1998** — six months, with no AI assistance of any kind. The **1999 v1.1**
release was bug fixes only; no features or content were added.

That schedule is not trivia. It explains the dominant pattern in the codebase —
engine capabilities built and then never authored into the content — which is
catalogued in `specs/000-timaflakkarinn-vision.md` under "Built but never used."
Recorded 2026-08-06 from Hjalti, who was there.

It is co-owned by:

- Hjalti (`hjalti@gmail.com`) — owner of this repository
- Gudmundur Hafsteinsson
- Georg Ludviksson
- Erna Geirsdottir
- Hallgrimur Hafsteinsson

## Contributors

Halldór (`halldor@eldjarn.net`) started this project from the CD —
reverse-engineering the underlying engine and building on the open assets the
disc already carried, the media and the GML.

GML is an XML format the original team developed to describe the gameplay.

~~Which disc the recreation derives from is not yet established.~~ **Settled
2026-08-07**: the ISO's volume was built 1999-11-18, confirming the **1999 v1.1**
disc as the basis. See "The original ISO" below.

For Phase 1, pushes to canonical branches and deployment are handled by Hjalti.

## The original ISO — located 2026-08-07

**It exists.** Halldór uploaded it to Forgejo as a release attachment on tag
`0.0.1-alpha` on 2026-08-03 and nobody noticed for four days — release
attachments live outside git, so every search of the repository tree missed it,
and its download count was zero.

```
FLAKKARI.ISO   236,644,352 bytes (225.7 MiB)
sha256         66d63615b9ba53e6e950d9275933a232e5f9980bb0e7a736b19671537cce14db
type           ISO 9660 (DOS/MBR boot sector), volume label 'FLAKKARI'
built          1999-11-18 09:19:20 by MKHYBRID ISO9660/HFS FILESYSTEM BUILDER
contents       1,229 files — 668 WAV, 554 PNG, 2 EXE, 2 TXT, 2 BIN, 1 AVI
```

**This settles which disc the recreation derives from.** The 1999-11-18 build
date makes it the **v1.1 1999 release**, which this document previously listed
as an open question.

It also holds more than `web_import/` does: **554 PNGs against the mirror's
545.** The mirror was derived from GML references plus two lucky recoveries, so
it was always a subset of the disc, never a copy of it.

### Authenticity is NOT established

Halldór's release note, verbatim:

> FLAKKARI.ISO was lifted from Reddit thread somewhere, use at your own risk.

So this is a **third-party rip of unverified origin** — not a rip made by a known
holder of the disc. There is no provenance chain back to a physical 1999
pressing. The sha256 above fixes exactly what we received; it says nothing about
whether what we received is authentic. Treat it as an **unverified primary-source
candidate**, not a confirmed master.

It can be corroborated, and should be: `web_import/` was sourced independently
of Reddit. If those 1,211 files match the ISO byte for byte, an independent
source vouches for the rip. Until that diff is run, this stays unverified.

### Copies

Four failure domains as of 2026-08-07: the Forgejo attachment and
`/srv/timaflakkarinn/archive/` on the homeserver (same volume, so one domain),
Hjalti's laptop, Google Drive, and OneDrive. A full manifest with the provenance
caveat sits beside the homeserver copy; this section is the replicated record of
it, because sidecar files do not survive being copied to a cloud drive.

It is also the best available source for what the web mirror is missing: see
`docs/project-state.md` for the three absent voice lines. Worth asking which
disc it is when it arrives.

The Java implementation is no longer lost: on 2026-08-06 Halldór pushed
`origin/main`, carrying the CFR-decompiled sources (`src/`, `classes/`,
`is.dimon` package) alongside a TypeScript port. The ISO would still hold the
original *build*, which the decompilation cannot fully reconstruct.

## The Völva puzzle — design intent

Recorded 2026-08-06 from Hjalti, who was on the original team. None of this is
recoverable from the code, and the port had already stubbed the puzzle out.

In Kristnitaka the seeress asks the player her name (`s_ThuHeitir`,
`kristnit.gml:4136`). The answer is **Erna** — hardcoded in the engine at
`Timaflakkarinn.java:552` as `equalsIgnoreCase("erna")`, with `s_GuessCorrect`
and `s_GuessWrong` as the two branches. It is an in-joke: Erna Geirsdottir
**painted the backgrounds** for the original game and is a co-owner of the work
(above).

That authorship is not only historical. Any remaster that extends or reprocesses
the background art carries her sign-off — approval, not authorship: the derived
art is created by others and brought to her for review. See
`specs/000-timaflakkarinn-vision.md`, D2.

**The intended solution is visual, not textual.** A rune stone stands behind the
seeress — its own scene, `s_ErnaRunir` (`kristnit.gml:719`), backed by
`KRISTNIA/GRAPHIC/STORERNA.PNG` and reached from `t_HjaVolvul`. The inscription
reads **ᛁ ᚱ ᚾ ᛅ**. The team's expectation was that a rune-to-Latin chart — the
kind that hangs in every Icelandic classroom — made this routine.

It did not. It became one of the game's hardest puzzles, and the reason is
orthographic: Younger Futhark has no separate e-rune, so ís (ᛁ) writes both /i/
and /e/. A correct chart lookup yields *IRNA*. The team's reasoning was that no
Icelander is named Irna while Erna is common, so players would see the
ambiguity and try the other reading. In practice many did not. One player
reportedly solved it by spotting Erna's name in the credits and confirming the
connection from public record, never touching the runes at all.

Two mechanical traps compound it, both worth knowing before touching this code:

- The comparison is exact. *irna* is rejected with no hint that the reading was
  nearly right; `s_GuessWrong` says only *"Gettu betur"*.
- `charNotAllowed` (`Timaflakkarinn.java:610`) admits `0x20`, and the comparison
  never trims. `"erna "` fails identically to a wrong answer. **The port should
  trim** — that accepts only input the original unambiguously intended to
  accept, and preserving it would preserve a bug rather than a design decision.
  Everything else stays exact.

A second, unrelated rune stone exists at KristnarBudir — `s_Runir`,
`RUNIR.PNG`, labelled *Steinristur*. It is not part of this puzzle.

**Consequence for the rebuild:** the puzzle's only clue lives in a separate
scene. An implementation of `GuessQuantum` is not done when the dialog accepts
`erna` — it is done when the player can walk to the stone, read it, return,
answer, and receive the Þórshamar. All three PNGs are present and intact in
`web_import/`.

## Beyond Phase 1

Later stages, new content and derivative works are all open possibilities. The
structure set up now should not assume today's shape is the final one.

## To be decided

- **How contribution works.** The aim is that anyone can contribute easily. Who
  approves, and by what mechanism, is an open question.
- **Which licence.** Not chosen yet.
