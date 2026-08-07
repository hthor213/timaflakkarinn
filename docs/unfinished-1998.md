# Unfinished 1998 — a systematic sweep of the GML

Audit of `web_import/gml/` for the species found by accident on 2026-08-07:
**a mechanism wired in 1998 and never aimed at anything.** Tags follow
`docs/known-issues.md`. **Read §5 first** — the negative results close off
searches you would otherwise keep running.

Produced by an analysis pass over all six chapters, cross-checked against the
decompiled 1999 engine and the background art.

---

## 1 — Blocking

### 1.1 · `port-bug` · The Völva's name puzzle soft-locks Kristnitaka  ·  **FIXED**

`kristnit.gml:4136-4141` hides the dialogue options, sets `FREEZE`, and calls
`q_Guess`. In 1999 that opens a name-entry dialog and the answer routes to
`s_GuessCorrect` or `s_GuessWrong`, both of which restore the controller. **The
port implemented `GuessQuantum` as an empty stub**, so the sequence froze the
controller and returned — nothing the player clicked did anything, and
`s_GuessCorrect` is the only path that hands over the cross and reveals the
Þórshamar.

Fixed 2026-08-07; see `docs/known-issues.md` #15.

---

## 2 — Reactions aimed at the wrong thing

### 2.1 · `1998-bug` · Looking at yourself replays somebody else's greeting — all four chapters

Every chapter wires the player's `action_look` to `s_Look<Player>`, and every one
plays a line **recorded for a different conversation**:

| Chapter | Reaction | Line played | Recorded for |
|---|---|---|---|
| Landnám | `landnam.gml:3442` | `m_saell` *"Sæll!"* | Vífill greeting Karli |
| Kristnitaka | `kristnit.gml:4243` | `m_Gissur` *"Sæll!"*, file `gissur2.wav` | greeting **Gissur** — the filename says so |
| Siðaskipti | `sidaskip.gml:4723` | `m_KomduSaellVinnumadur` | greeting the **farmhand** |
| Tyrkjaránið | `tyrkran.gml:6235` | `m_ErtThuVissUm` | response to pulling a barrel bung |

`action_talk` points at the same sequence, so look and talk are indistinguishable.

**Strongest evidence is inside Kristnitaka:** `kristnit.gml:1210` sets
`looking="Hjalti Skeggjason (ég)"` — a proper self-description on the *hover*
text — while the response is "Sæll!". Someone wrote the label for a look-at-self
line that was never recorded.

**This is the one entry that needs Hjalti's judgement rather than a fix.** "Sæll!"
to yourself could be a gag — `taking="Klappa mér"` shows a jokey register. But
reusing the farmhand's greeting, and reusing a bung-pulling line, do not read as
jokes.

### 2.2 · `1998-bug` · Tyrkjaránið registers Sigrún's reactions twice; the first set is dead

`tyrkran.gml:6094-6095` wires look and talk to `s_UnDecided6`; `:6235`/`:6237`
overwrite both with `s_LookSigrun`. `createReaction` is a map `put`
(`TTParser.java:844-849`, port matches), so the later registration silently wins.
`s_UnDecided6` is the **only unreachable sequence in the corpus** — dead by
shadowing, not by absence. Its tied-up-aware branch is never seen.

*(Corrects known-issue #11's table: Tyrkjaránið's hand-on-self ran
`s_LookSigrun`, not `s_UnDecided6`. The applied fix is still correct.)*

### 2.3 · `1998-bug` · Talking to the púki never runs `s_BeginConvPuki`

`sidaskip.gml:6118-6122` declares it; `:6321` overwrites the reaction with
`s_PukiHlaer`, the randomised laugh — identical to *pushing* him. Two signals it
was unfinished rather than decided: every other `s_BeginConv*` in the chapter
opens a real dialogue tree, and this one is broken as written anyway — no
`q_Freeze` at the start, no `q_Moving` at the end, unlike every neighbour. It
never ran, so nobody noticed.

**What the púki should say is a content question for Hjalti.**

### 2.4 · `1998-bug` · Tyrkjaránið's player has no self-aware hover labels

Three chapters give the player `taking="Klappa mér"` and two add
`talking="Tala við sjálfan mig"`. `tyrkran.gml:2466` has neither, so hovering
yourself reads "Taka Sigrúnu" / "Tala við Sigrúnu", built mechanically from
`thf`. Same shape and cost as the #11 fix.

---

## 3 — Hotspots

### 3.1 · `1998-bug` · `a_hmmm` — known-issue #13, plus one new fact

Bounds (500,300)–(594,378), re-confirmed against `HJORLEIA.PNG`: bare grass,
~140px up-left of the sword hilt.

**New:** it has **no `random="true"`** and **no `Reaction` of any kind**. Random
pools only fire when `actor.random` is set, so clicking it in *any* verb mode
produces **complete silence** — not even a refusal. Every other actor in its
`<!-- transparent aukahlutir -->` block carries `random="true"`. A third
independent marker alongside the placeholder name and the tease label.

### 3.2 · `1998-bug` · Kristnitaka's two runestones are silent under take and talk

`a_Runir` (`kristnit.gml:596`) and `a_Letur` (`:602`) have only an `action_look`
reaction and no `random="true"`, so take and talk clicks do **nothing at all**
while every other object in the chapter answers with a refusal. They hover and
label correctly and sit on the painted slab, so the player has every reason to
keep clicking. **Fix: add `random="true"` to both.** One attribute each.

### 3.3 · `design-improvement` · The sea in Fjaran is clickable only on the left two-thirds

`af_Sjorinn` is `width="800"` in a scene declared `ScrollingScene width="1200"`.
Water continues past x=800 outside the hotspot, and the barrel puzzle targets
`a_Sjorinn`. **Low-to-medium confidence** — the signal is real but it is not
established that the player can stand where the right-hand water is the natural
target. Watch for it in play; do not schedule it.

---

## 4 — Built and never aimed

### 4.1 · `1998-bug` · The trough in Sigrún's cottage was set up to be picked up

`tyrkran.gml:277-285` gives `a_Trog` a `taken` state and a `q_Trog_taken`
quantum. **That quantum appears exactly once in the file — its own
declaration.** No sequence contains it, no `action_take` reaction exists. The
`taken` state reuses the scene face rather than an inventory face, so the intent
was abandoned early. Archetype: `SetSpeedQuantum`, in the DTD and both engines
and used by zero chapters. Almost certainly not worth finishing — logged so
nobody runs this search twice.

---

## 5 — Two negative results (the most useful part)

### 5.1 · There is essentially no dead content in this game

Every `<Sequence>` in every chapter was diffed against every `seq=`, treating the
ten engine-invoked names as reachable. **Every sequence resolves to at least one
reference.** The only unreachable one is `s_UnDecided6` (§2.2).

Two false positives, recorded so nobody re-files them:
- **`s_GuessCorrect` / `s_GuessWrong`** look dead — nothing in the GML names
  them. They are called by string from the Java keyboard handler.
- **`s_UnDecided*`** in `tyrkran.gml` — thirteen of them, and the name reads like
  a TODO. It is not: it is the author's shorthand for *"no specific line was
  written for this pair, give the generic one"*, and twelve of thirteen are wired
  to several reactions each.

**Stop looking for orphaned sequences.** The unfinished work here is *shadowed*
and *mis-aimed*, not *disconnected*.

### 5.2 · The hotspot geometry is good

Screen bounds recomputed for every `TransparentActorFace` hotspot in Landnám and
Kristnitaka, spot-checked in the other two, and cropped against ten background
PNGs: **every hotspot except `a_hmmm` lands on the object it names** — barrels,
chest, sail, house, drying rack, mountain, both bush clusters, boat, driftwood,
cauldron, rune slab, tent, shelves, ship, cave mouth. Several correct to within a
few pixels. Exit hotspots over bare ground are correct by design.

**`a_hmmm` is a singleton, not the first of a family. Do not commission a
hotspot audit pass.**

---

## 6 — Checked and dismissed

| Item | Verdict |
|---|---|
| `a_Hotspot`, `sidaskip.gml:242` | Placeholder *name*, finished *thing* — a labelled, working exit |
| `s_wwowSalmabokLargeKirk`, `sidaskip.gml:3830` | Typo for `s_show…`; referenced and working |
| Duplicate `a_Axe` take reactions | Identical `seq`; a map put over itself |
| Triple `a_Hjalti` take reactions | All three now `s_randomTake` after #11 |
| `a_Skeid`, a 27×6px hotspot | Could not resolve the object at that size; will not assert a defect on a resolution limit |
| `Animated2DActorFace`, `Frame(s)`, `Image(s)`, `Fetch` | Declared in the DTD, used by no chapter — dead grammar |

---

## 7 — Two checks that belong in `tools/lint_gml.py`

The shadowing defect is invisible to the eye and mechanical to detect. Both of
these found real bugs above, by hand:

1. **Duplicate `(reactor, actor, actor2)` registrations with differing `seq`.**
   Found §2.2 and §2.3. Not yet run over the ~150 `action_use` double-actor
   reactions — **highest-yield remaining check in this corpus.**
2. **Declared-but-never-referenced quantums.** Found `q_Trog_taken` by following
   a thread rather than sweeping. ~600 declarations per chapter.

Not attempted: the reverse asset check — art on the disc that no GML references.
`INTRO.AVI` shows that direction has yielded before.

---

## Assessment

**There is far less unfinished intent here than the recent run of bugs suggests,
and it is concentrated in one shape.** Every sequence is reachable; every hotspot
but one lands correctly; the DTD's unused elements are dead grammar, not a
missing feature.

What the 1998 team left behind is **duplicated authoring never reconciled** — a
block written twice, the second copy silently winning because the reaction table
is a map — and **slots filled with the nearest available line** rather than the
line that was meant. `a_hmmm`, `s_UnDecided6`, `s_BeginConvPuki`, the four
recycled self-greetings and Tyrkjaránið's missing "Klappa mér" are all one or the
other. A recognisable end-of-schedule signature: the structure was finished, the
last content pass was not.

**The pattern says where to look next, and it is not the GML.** Shadowing is
mechanical — put it in the linter and stop reading. The mis-aimed-line defect is
invisible to any linter and obvious to an ear: a line recorded for one
conversation and reused in another is exactly what §2.1 found four times, and the
only detector is someone who knows what the line was recorded for. **That is
Hjalti, and it is a couple of hours, not a project.**

### Open questions for Hjalti

1. **§2.1** — was "Sæll!" to yourself a joke, or a placeholder for a
   self-description that was never recorded?
2. **§2.3** — should the púki have had a conversation, and what would he say?
