import type { SaveScene } from './SaveScene';

/**
 * The save/load menu as tappable rows, under the picture, on touch only.
 *
 * The menu was not merely awkward on a phone, it was a wall. Starting a game
 * means clicking an EMPTY slot -- handleSlotClick turns "no metadata, main
 * mode" into newGame -- so the new-game control is a line of green text reading
 * "Leikur 1", one of ten stacked 30px apart inside an 800x600 canvas scaled to
 * a handset. Roughly ten physical pixels tall, and it does not say what it
 * does. The first row here says "Byrja nýjan leik" and is 48px.
 *
 * A view, like SentenceList and VerbBar. getTouchMenu() hands back rows that
 * each carry the actor they stand for, and choosing one calls handleClick with
 * that actor -- the same path a canvas click takes, so which buttons are live
 * in which mode, the overwrite prompt and the quit confirmation all keep
 * working without being reimplemented here.
 *
 * Polled on the frame clock for the same reason SentenceList is: the menu's
 * sub-mode changes from inside its own click handling and notifies nobody.
 */
export class MenuList {
  private static readonly UNSYNCED = '<unsynced>';

  private root: HTMLElement;
  private save: SaveScene | null = null;
  private signature = MenuList.UNSYNCED;
  private frame = 0;
  private field: HTMLInputElement | null = null;

  constructor(container: HTMLElement = document.body, anchor?: HTMLElement) {
    this.root = document.createElement('div');
    this.root.id = 'menu-list';
    this.root.setAttribute('role', 'group');
    this.root.setAttribute('aria-label', 'Valmynd');
    container.insertBefore(this.root, anchor ?? null);

    const tick = () => {
      this.sync();
      this.frame = requestAnimationFrame(tick);
    };
    this.frame = requestAnimationFrame(tick);
  }

  attach(save: SaveScene): void {
    this.save = save;
    this.signature = MenuList.UNSYNCED;
    this.sync();
  }

  private sync(): void {
    const menu = this.save?.getTouchMenu() ?? null;
    const signature = menu
      ? `${menu.prompt ?? ''}|${menu.input}|${menu.rows.map(r => r.label).join('\n')}`
      : '';
    if (signature === this.signature) return;
    this.signature = signature;

    this.root.replaceChildren();
    this.field = null;
    this.root.classList.toggle('empty', !menu);
    if (!menu) return;

    if (menu.prompt) {
      const p = document.createElement('div');
      p.className = 'menu-prompt';
      p.textContent = menu.prompt;
      this.root.appendChild(p);
    }

    if (menu.input) {
      const field = document.createElement('input');
      field.type = 'text';
      field.className = 'menu-input';
      field.maxLength = 20;
      field.value = this.save?.getNameInput() ?? '';
      field.setAttribute('aria-label', 'Nafn vistunar');
      // Write through on every keystroke: the canvas field is what
      // commitNameInput reads, and a phone has no keyboard aimed at the canvas.
      field.addEventListener('input', () => this.save?.setNameInput(field.value));
      this.root.appendChild(field);
      this.field = field;
      // Focus must follow the tap that opened this, or iOS will not raise the
      // keyboard at all.
      setTimeout(() => field.focus(), 0);
    }

    for (const { label, actor } of menu.rows) {
      const b = document.createElement('button');
      b.type = 'button';
      b.className = 'sentence';       // same row styling as the dialogue list
      b.textContent = label;
      b.style.touchAction = 'none';
      b.addEventListener('pointerdown', (e) => {
        e.preventDefault();
        // Commit whatever is typed before the button is read, since blur has
        // not happened yet at pointerdown.
        if (this.field) this.save?.setNameInput(this.field.value);
        this.signature = '<pending>';
        this.save?.handleClick(actor, 0);
      });
      this.root.appendChild(b);
    }
  }

  destroy(): void {
    cancelAnimationFrame(this.frame);
    this.root.remove();
    this.save = null;
  }
}
