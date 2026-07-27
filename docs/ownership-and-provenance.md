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

## Who owns the original

Tímaflakkarinn (Dímon) shipped in 1998, with a v1.1 following in 1999. It is
co-owned by:

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

Which disc the recreation derives from is not yet established; the 1999 v1.1 is
the likely basis, and the ISO will confirm it.

For Phase 1, pushes to canonical branches and deployment are handled by Hjalti.

## The original ISO

An ISO of the original CD-ROM is **a copy of the original work**, and belongs
with the project as primary-source material — on the same footing as the assets
already in `web_import/`. Record it in `web_import/PROVENANCE.md` when it lands.

It is also the best available source for what the web mirror is missing: see
`docs/project-state.md` for the three absent voice lines. And it holds the
original build itself, the last remaining artifact of the lost Java
implementation. Worth asking which disc it is when it arrives.

## Beyond Phase 1

Later stages, new content and derivative works are all open possibilities. The
structure set up now should not assume today's shape is the final one.

## To be decided

- **How contribution works.** The aim is that anyone can contribute easily. Who
  approves, and by what mechanism, is an open question.
- **Which licence.** Not chosen yet.
