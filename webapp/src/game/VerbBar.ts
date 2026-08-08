import { StateController, MOVING, TAKING, LOOKING, TALKING } from './StateController';

/**
 * The touch verb bar.
 *
 * The 1999 game is a two-button game: left acts, right cycles the verb. A phone
 * has neither a right button nor hover, so without this the verb is stuck on
 * whatever the game last set and most of the content -- 404 authored verb
 * reactions across the six chapters -- cannot be reached at all. This is not a
 * convenience; it is the difference between playable and not.
 *
 * The interaction is two taps: choose a verb here, then tap the world. That is
 * the same two decisions the mouse version makes, just made explicit and in the
 * opposite order from the cycle.
 *
 * It is a VIEW of the StateController, not a second source of truth. Every rule
 * about which verbs are legal lives in `canSetVerb`, and the bar re-reads it on
 * every change -- including the changes the player did not make, which are the
 * ones that would otherwise leave it lying: FREEZE during a cut-scene,
 * CONVERSATING during dialogue, USING when an item is picked up, and the
 * inventory restricting the choice to two.
 *
 * Deliberately DOM rather than painted on the canvas: the canvas is a fixed
 * 800x600 backing store holding the 1998 frame, and painting controls into it
 * would either eat picture or change every game coordinate. Below it, the bar
 * costs the game nothing and takes the space portrait has spare.
 */

const LABELS: Record<number, string> = {
  [MOVING]:  'Ganga',
  [TAKING]:  'Taka',
  [LOOKING]: 'Skoða',
  [TALKING]: 'Tala',
};

// Line art on a 24x24 grid, stroked with currentColor so the active and
// disabled states are one colour change. Inline because the artwork in this
// project is 1998 PNG and a UI chrome icon has no business coming from there.
const ICONS: Record<number, string> = {
  // walking figure
  [MOVING]:
    '<circle cx="13" cy="4" r="2.2"/>' +
    '<path d="M13 6.5 L11 12 L14.5 14 L16 20"/>' +
    '<path d="M11 12 L7 15"/>' +
    '<path d="M11.6 9 L16 10.5"/>' +
    '<path d="M14.5 14 L9.5 19"/>',
  // open hand
  [TAKING]:
    '<path d="M8 13 V6.5a1.4 1.4 0 0 1 2.8 0V12"/>' +
    '<path d="M10.8 12V4.6a1.4 1.4 0 0 1 2.8 0V12"/>' +
    '<path d="M13.6 12V5.4a1.4 1.4 0 0 1 2.8 0V12"/>' +
    '<path d="M16.4 12V7.6a1.4 1.4 0 0 1 2.8 0v6.6c0 3.8-2.4 6.6-5.6 6.6-3 0-4.4-1.4-5.6-3.4l-2.6-4.3a1.4 1.4 0 0 1 2.3-1.6L9.4 14"/>',
  // eye
  [LOOKING]:
    '<path d="M2 12s3.6-5.5 10-5.5S22 12 22 12s-3.6 5.5-10 5.5S2 12 2 12z"/>' +
    '<circle cx="12" cy="12" r="2.6"/>',
  // mouth speaking
  [TALKING]:
    '<path d="M4 8.5c2.6-1.6 5.3-2.4 8-2.4s5.4.8 8 2.4c-1.6 5.6-4.3 8.4-8 8.4s-6.4-2.8-8-8.4z"/>' +
    '<path d="M4.6 10.4c4.9 1.6 9.9 1.6 14.8 0"/>',
};

export class VerbBar {
  private root: HTMLElement;
  private buttons = new Map<number, HTMLButtonElement>();
  private sc: StateController | null = null;

  constructor(container: HTMLElement = document.body) {
    this.root = document.createElement('div');
    this.root.id = 'verb-bar';
    this.root.setAttribute('role', 'group');
    this.root.setAttribute('aria-label', 'Aðgerðir');

    for (const verb of StateController.VERBS) {
      const b = document.createElement('button');
      b.type = 'button';
      b.className = 'verb';
      b.dataset.verb = String(verb);
      b.innerHTML =
        `<svg viewBox="0 0 24 24" aria-hidden="true" fill="none" stroke="currentColor"` +
        ` stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round">${ICONS[verb]}</svg>` +
        `<span>${LABELS[verb]}</span>`;

      // pointerdown, not click: a tap should register at the moment the finger
      // lands. `click` on touch waits to rule out a double-tap or a drag, and
      // that delay reads as the button not working.
      b.addEventListener('pointerdown', (e) => {
        e.preventDefault();
        this.sc?.setVerb(verb);
        this.sync();
      });
      // The bar sits under the canvas, which sets touch-action: none on itself
      // only. Without this a tap that drifts becomes a page scroll.
      b.style.touchAction = 'none';

      this.buttons.set(verb, b);
      this.root.appendChild(b);
    }

    container.appendChild(this.root);
  }

  /**
   * Bind to a controller. Called once per chapter, because each chapter's GML
   * declares its own StateController and the parser hands over a new one --
   * binding once at startup would leave the bar driving chapter 1's controller
   * for the whole game.
   */
  attach(sc: StateController): void {
    this.sc = sc;
    sc.onStateChanged = () => this.sync();
    this.sync();
  }

  /** Reflect the controller: which verb is active, and which are choosable. */
  sync(): void {
    const sc = this.sc;
    for (const [verb, b] of this.buttons) {
      const active = !!sc && sc.getState() === verb;
      const enabled = !!sc && sc.canSetVerb(verb);
      b.classList.toggle('active', active);
      b.disabled = !enabled;
      b.setAttribute('aria-pressed', String(active));
    }
    // Whole-bar dimming during FREEZE/CONVERSATING, so "the game is busy" reads
    // differently from "this one verb does not apply here".
    const anyEnabled = [...this.buttons.values()].some(b => !b.disabled);
    this.root.classList.toggle('idle', !anyEnabled);
  }

  destroy(): void {
    this.root.remove();
    this.sc = null;
  }
}
