/**
 * The Völva's name prompt.
 *
 * In Kristnitaka the seeress asks the player her name. `s_ThuHeitir`
 * (`kristnit.gml:4136`) hides the dialogue options, freezes the controller and
 * calls `q_Guess` — a `<GuessQuantum>`. In 1999 that opened a text prompt
 * (`GuessQuantum.java` → `Timaflakkarinn.showDialog2()`); the answer was compared
 * to "erna" and dispatched to `s_GuessCorrect` or `s_GuessWrong`, both of which
 * unfreeze. The port stubbed the quantum out, so the sequence froze the
 * controller and returned — nothing the player clicked did anything, and
 * `s_GuessCorrect` is the only path that trades the Þórshamar for the cross.
 * That is the story's central object, so this was a hard stop.
 *
 * Rendered as a DOM overlay rather than on the canvas, deliberately. The 1999
 * engine drew its own text widget because a Java applet had no choice; a DOM
 * input gets mobile keyboards, IME and the Icelandic letters for free, and the
 * project's fidelity bar is explicitly "feel rather than pixels".
 */

/** The answer, hardcoded in the 1999 engine (`Timaflakkarinn.java:552`), not in content. */
const ANSWER = 'erna';

/**
 * The rune-correct near-miss.
 *
 * The runestone behind the seeress reads ᛁ ᚱ ᚾ ᛅ. Younger Futhark has no separate
 * e-rune, so ís (ᛁ) writes both /i/ and /e/ — a correct chart lookup yields
 * IRNA. The 1998 team expected players to notice the ambiguity and try Erna as
 * well ("no Icelander is named Irna, Erna is common"); in practice many did not,
 * and this became one of the game's hardest puzzles. 1999 rejected `irna`
 * identically to any wrong answer, with nothing to say the reading was right.
 *
 * Added 2026-08-07 at the owner's request: it accepts the answer and explains
 * the orthography. Content lives in `kristnit.gml` as `s_GuessIrna`.
 */
const RUNE_READING = 'irna';

export interface GuessResult {
  /** Sequence to run — all three exist in `kristnit.gml`. */
  sequence: 's_GuessCorrect' | 's_GuessIrna' | 's_GuessWrong';
  /** What the player actually typed, for logging. */
  entered: string;
}

/**
 * Show the prompt and resolve once the player commits an answer.
 *
 * Never rejects and cannot be dismissed without answering — the calling sequence
 * has already frozen the controller, so abandoning the dialog would reproduce
 * the very soft-lock this fixes.
 */
export function askVolvaName(container: HTMLElement): Promise<GuessResult> {
  return new Promise(resolve => {
    const overlay = document.createElement('div');
    overlay.id = 'volva-guess';
    overlay.style.cssText = [
      'position:absolute', 'inset:0', 'z-index:150',
      'display:flex', 'align-items:center', 'justify-content:center',
      'background:rgba(0,0,0,.45)',
    ].join(';');

    const box = document.createElement('form');
    box.style.cssText = [
      'background:#1a1408', 'border:2px solid #c8a040', 'border-radius:6px',
      'padding:20px 24px', 'display:flex', 'flex-direction:column', 'gap:12px',
      'box-shadow:0 8px 32px rgba(0,0,0,.7)', 'min-width:min(360px, 80vw)',
    ].join(';');

    const label = document.createElement('label');
    label.textContent = 'Hvað heiti ég?';
    label.style.cssText = 'color:#e8d8a0;font:600 20px serif;text-align:center;';

    const input = document.createElement('input');
    input.type = 'text';
    input.autocomplete = 'off';
    input.spellcheck = false;
    input.setAttribute('autocapitalize', 'none');
    input.style.cssText = [
      'font:20px serif', 'padding:8px 10px', 'text-align:center',
      'background:#0d0a04', 'color:#fff', 'border:1px solid #6a5a30',
      'border-radius:4px', 'outline:none',
    ].join(';');

    const ok = document.createElement('button');
    ok.type = 'submit';
    ok.textContent = 'Svara';
    ok.style.cssText = [
      'font:16px serif', 'padding:8px 16px', 'cursor:pointer',
      'background:#3a2f14', 'color:#e8d8a0',
      'border:1px solid #6a5a30', 'border-radius:4px',
    ].join(';');

    box.append(label, input, ok);
    overlay.appendChild(box);
    container.appendChild(overlay);
    input.focus();

    box.onsubmit = (e) => {
      e.preventDefault();
      const entered = input.value;

      // trim() and case-insensitivity are a deliberate, minimal departure from
      // 1999, which compared `equalsIgnoreCase("erna")` against untrimmed input
      // while `charNotAllowed` admitted the space character. So "erna " was
      // rejected identically to a wrong answer, with no way to tell the two
      // apart. That accepts only input the original unambiguously intended to
      // accept: it preserves a decision, not a bug.
      const answered = entered.trim().toLowerCase();

      overlay.remove();
      resolve({
        sequence:
          answered === ANSWER       ? 's_GuessCorrect' :
          answered === RUNE_READING ? 's_GuessIrna'    :
                                      's_GuessWrong',
        entered,
      });
    };
  });
}
