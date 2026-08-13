# Last session — 2026-08-13 (the calibration tool grew up)

## What was accomplished

One file did almost all of it: `webapp/public/calibrate.html`, eight commits
(`0d31d3f..fa71daf`), each deployed to tt-dev and browser-verified on the live
URL after deploy. The tool went from "two scanlines and a figure" to a full
depth-authoring instrument:

- **Vanishing point** (`0d31d3f`). The engine's ramp is linear in y and so is a
  pinhole camera over a flat floor — the lerp's zero IS the horizon. Drawn as a
  derived draggable line; dragging it keeps the front anchor and derives
  `scaling2`. Grid rails converge on a VP handle; depth lines at equal ground
  steps (1/(y−yh) is arithmetic — no focal length needed).
- **Him, everywhere** (`218d26b`, `efe96a3`). The draggable check figure goes
  anywhere (reference objects live in the art, not the floor); scenes without
  their own player sprite borrow one. The blue "him in game" pair stands at the
  walkable polygon's nearest/farthest points — placed by scanline-span
  intersection clipped to the frame *before* the midpoint, after three rounds
  of point-in-polygon-verified fixes (integer-vertex parity, off-canvas
  polygons: `p_HjaVolvu` runs to x=1201 in an 800px room).
- **Sizing writes back** (`5625fe4`): scroll over him = "this big, here" — on
  scanline1 it sets `defaultscaling`, elsewhere it solves `scaling2` through
  the front anchor.
- **Pins** (`753837e`). Owner's model, his words: *the resize is the
  interaction, the plane is the output.* Double-click pins a (x, y, scale)
  judgement; pins are the primary artifact, fits are derivatives. Two pins
  write the four numbers exactly; Copy GML appends all pins as a legal XML
  comment so 20 river points survive into the masters.
- **Classic/Modern toggle** (`68d7b56`). Same pins, two models. Classic = the
  1999 y-ramp (verified at source: `Terrain.ts:50` is `a*y + b`, mirroring the
  Java — no lateral term). Modern = thin-plate spline through the pins; 3 pins
  are the tilted plane, more bend it. In Modern the wheel sets a PENDING size
  and only pinning writes. The four numbers keep tracking the best linear fit
  either way — one session yields both editions' truth.
- **Laptop layout** (`387d129`): controls moved to a right-hand panel (the top
  row cut off after Reset on a laptop). All 15 controls verified visible at
  1280×800.
- **Corner-handle resize + terrain carpet** (`fa71daf`). Photoshop-style
  bounding box anchored at his feet (Magic Mouse scroll too twitchy);
  proportions locked by construction. Modern's iso-contours replaced by a
  carpet — rows at equal ground depth marched by local scale, columns a
  ground-step apart — bounded 80px beyond the farthest pin so TPS
  extrapolation stops painting sheets over the sky.

**Test harness:** `~/tools/browser/vanish.mjs` (outside the repo) drives the
whole tool in Playwright — horizon math, pin fits to rounding digit, TPS
node-interpolation, PIP containment on three scenes, wheel discipline, box
handles — and was run against tt-dev after every deploy. Two probe deceptions
were unmasked, not tool bugs: a dblclick landing within 8px of an old pin
correctly *updates* it, and `pkill -f vite` matches your own shell.

## The version question — settled by reference, not new text

Owner asked how much time "1.2" deserves (bugs + the ten cut things, between
faithful-port and remaster). Answer, agreed: **none as a project** — D8 already
defines Classic as "the game as the team meant it", the disc-as-shipped state
is a derivable build filter over one tree (five tags), and the ten cut things
split by what they need: pure-GML confirmed intent lands opportunistically
during bug-testing; anything needing new audio/art waits for the remaster
production pipeline; original-team questions stay gated in "Needs a human".
No new spec text was written — the owner confirmed D8 had settled it.

## Spec drift fixed this checkpoint

- `specs/001` lint count 5 → **6** (`m_ErnaEkkiIrna`'s WAV joined the missing
  list when the Irna response was wired), and "need Halldór's confirmation"
  corrected to the original team — Halldór was never on the team.
- `specs/000` depth-tool section: recorded what exists (scaling half live at
  `/calibrate`, pins format, Classic/Modern, the two discovered constraints)
  and what does not (ordering half not started, **0 of ~60 calibrations
  authored**).

## Start next session with

The tool is done enough; **the point of it has not happened yet**. Two candidate
tracks, owner's pick:

1. **Author the calibrations.** Open `tt-dev.spliffdonk.com/calibrate`, work
   through the 47 rampless terrains and the 2 suspect ones (`t_HjaVolvul`
   1.031×, `t_Skipingolfsl` 1.053×), Copy GML into `web_import/gml/*`, deploy
   to tt-dev, and judge in-game. First calibration landing in GML will exercise
   the pins-as-XML-comment path through the real parser — verify the parser
   ignores comments inside element runs (it should; check the first commit).
2. **Bug-test track (a)** as before: play on tt-dev, fixes per taxonomy.

Ship commands unchanged (`tools/deploy.sh --env dev`; prod still pre-promote at
`ff1ebec`, first `--promote` still pending, still safe).

## Open questions needing a human

- All prior "Needs a human" items stand (PSDs, original-team confirmations,
  first promote, WAV→AAC script, IP owners).
- **Modern terrain format**: pins ride in XML comments today. When the remaster
  engine wants to consume them, decide whether they graduate to a real GML
  attribute/element (D8 variant-attribute mechanism) — spec before building.
- Erna + D2 unchanged: the owner's surfaces-not-composition proposal still
  needs her, and the D2 decision remains open.

## Check status

`aidev` is not on PATH — the harness check did not run; this is my reading.
`npm run check`: typecheck + **141 cases, green** (run at session start;
engine untouched since — the session's only product changes are
`calibrate.html`, a dev-only page outside the game bundle).
`lint_gml.py web_import`: **red, 6 issues, deliberately** — all 1998/1999
content gaps, now correctly counted in `specs/001`.
tt-dev serves `fa71daf` (verified via `/version.json` and live probe).
