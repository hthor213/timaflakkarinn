import type { Scene } from './Scene';
import { ScrollingScene } from './Scene';
import { Pulser } from './Pulser';

export class World {
  currentScene: Scene | null = null;
  canvas: HTMLCanvasElement;
  ctx: CanvasRenderingContext2D;
  pulser = new Pulser();
  private animFrame: number | null = null;
  private running = false;
  private lastFrameTime = 0;

  // Pointer state, in the fixed 800x600 logical space. Still named mouseX/Y:
  // it is what the 1999 engine calls it and what the game layer reads.
  mouseX = 0;
  mouseY = 0;
  private lastFaceUnderMouse: import('./ActorFace').ActorFace | null = null;

  // Callbacks
  onSceneChanged?: (scene: Scene) => void;
  onActorClicked?: (actor: import('./Actor').Actor, button: number) => void;
  onActorEntered?: (actor: import('./Actor').Actor) => void;
  onActorExited?: (actor: import('./Actor').Actor) => void;
  onMouseClicked?: (x: number, y: number, button: number) => void;
  onKeyDown?: (key: string, code: string) => void;

  constructor(canvas: HTMLCanvasElement) {
    this.canvas = canvas;
    this.ctx = canvas.getContext('2d')!;
    // Disable anti-aliasing for pixel-perfect retro rendering
    this.ctx.imageSmoothingEnabled = false;

    // Pointer Events, not mouse events: one path serves mouse, touch and pen,
    // and a phone gets the game rather than nothing. `contextmenu` is still a
    // mouse-only concern — it is what suppresses the browser menu so the right
    // button can cycle verbs.
    canvas.addEventListener('pointermove', (e) => this.handlePointerMove(e));
    canvas.addEventListener('pointerdown', (e) => this.handlePointerDown(e));
    canvas.addEventListener('pointerup', (e) => this.handlePointerUp(e));
    canvas.addEventListener('pointercancel', (e) => this.handlePointerUp(e));
    canvas.addEventListener('contextmenu', (e) => e.preventDefault());
    window.addEventListener('keydown', (e) => this.handleKeyDown(e));

    // Without this the browser keeps a tap to itself for panning, pinch-zoom and
    // double-tap-zoom, and delivers the `pointerdown` late or not at all. The
    // canvas is the whole game surface — there is nothing on it to scroll.
    canvas.style.touchAction = 'none';
    // A long press over a canvas otherwise raises the iOS selection callout.
    canvas.style.userSelect = 'none';
    canvas.style.webkitUserSelect = 'none';
  }

  setCurrentScene(scene: Scene | null): void {
    if (this.currentScene) {
      this.currentScene.offStage();
    }
    this.currentScene = scene;

    // Clear screen
    this.ctx.fillStyle = '#000';
    this.ctx.fillRect(0, 0, 800, 600);

    if (scene) {
      scene.onStage();
    }
    this.onSceneChanged?.(scene!);
  }

  start(): void {
    this.running = true;
    this.lastFrameTime = performance.now();
    this.loop();
  }

  stop(): void {
    this.running = false;
    if (this.animFrame !== null) {
      cancelAnimationFrame(this.animFrame);
    }
  }

  private loop = (): void => {
    if (!this.running) return;

    const now = performance.now();
    const delta = Math.min(now - this.lastFrameTime, 100);
    this.lastFrameTime = now;

    this.pulser.update(delta);

    if (this.currentScene) {
      // Update scroll for scrolling scenes
      if (this.currentScene instanceof ScrollingScene) {
        this.currentScene.updateScroll();
      }
      this.currentScene.paint(this.ctx);
    }

    this.animFrame = requestAnimationFrame(this.loop);
  };

  /**
   * Map an event's viewport position into the fixed 800x600 logical space, and
   * move the drawn cursor with it.
   *
   * `getBoundingClientRect()` is what lets the canvas be CSS-scaled — play mode
   * fits it to the viewport while the backing store stays 800x600 — so every
   * game coordinate is unaffected by the scale.
   */
  private updatePointerLocation(e: PointerEvent): void {
    const rect = this.canvas.getBoundingClientRect();
    this.mouseX = Math.max(0, Math.min(799, Math.round((e.clientX - rect.left) * (800 / rect.width))));
    this.mouseY = Math.max(0, Math.min(599, Math.round((e.clientY - rect.top) * (600 / rect.height))));

    // Update cursor
    if (this.currentScene?.cursorFace) {
      this.currentScene.cursorFace.setLocation(this.mouseX, this.mouseY);
    }
  }

  /** Enter/exit bookkeeping for whatever face is now under the pointer. */
  private setFaceUnderPointer(face: import('./ActorFace').ActorFace | null): void {
    if (face === this.lastFaceUnderMouse) return;
    // Hover state belongs on the face, and belongs here: SaveScene used to
    // wire it per-actor by hand, which is why no *game* text ever
    // highlighted — only the save menu did.
    if (this.lastFaceUnderMouse) {
      (this.lastFaceUnderMouse as any).mouseOver = false;
      this.lastFaceUnderMouse.owner?.onExited?.(this.lastFaceUnderMouse.owner);
      if (this.lastFaceUnderMouse.owner) this.onActorExited?.(this.lastFaceUnderMouse.owner);
    }
    if (face) {
      (face as any).mouseOver = true;
      face.owner?.onEntered?.(face.owner);
      if (face.owner) this.onActorEntered?.(face.owner);
    }
    this.lastFaceUnderMouse = face;
  }

  private handlePointerMove(e: PointerEvent): void {
    this.updatePointerLocation(e);

    // Hit test for enter/exit events
    if (this.currentScene) {
      this.setFaceUnderPointer(this.currentScene.getActorFaceAt(this.mouseX, this.mouseY));
    }
  }

  private handlePointerDown(e: PointerEvent): void {
    // The coordinates must come from THIS event. A touch has no hover, so
    // pointerdown is the first and only event that says where the finger is;
    // reading the last move position resolved a first tap at (0,0) and every
    // later one wherever the previous tap happened to land.
    this.updatePointerLocation(e);

    // Pair the enter with the tap. A mouse would have moved here first, a
    // finger did not — without this a tapped actor never gets its onEntered,
    // and the next pointer event reports an exit from something never entered.
    if (this.currentScene) {
      this.setFaceUnderPointer(this.currentScene.getActorFaceAt(this.mouseX, this.mouseY));
    }

    this.onMouseClicked?.(this.mouseX, this.mouseY, e.button);

    // Re-read the scene: onMouseClicked can switch it, and the click below has
    // always been dispatched against whatever scene is current afterwards.
    if (this.currentScene) {
      const face = this.currentScene.getActorFaceAt(this.mouseX, this.mouseY);
      if (face?.owner) {
        face.owner.onClicked?.(face.owner);
        this.onActorClicked?.(face.owner, e.button);
      }
    }
  }

  private handlePointerUp(e: PointerEvent): void {
    // A lifted finger is over nothing, and nothing else will ever say so —
    // touch has no exit event. A mouse still hovers after a click, so it must
    // keep its hover state here.
    if (e.pointerType !== 'mouse') this.setFaceUnderPointer(null);
  }

  /**
   * Keys the game owns. Space is the important one: it is the right mouse
   * button, which is how you cycle verbs — and on a trackpad that is far more
   * comfortable than a two-finger click. Laptops were not the 1998 target.
   *
   * These must not also reach the browser. Space scrolls the document and, worse,
   * re-activates whatever button currently has focus — press "Sleppa kynningu",
   * then press space to change mode, and you would trigger the skip button again.
   */
  private static readonly OWNED_KEYS = new Set([' ', 'Enter', 'F1']);

  private handleKeyDown(e: KeyboardEvent): void {
    // Never steal keys from a real text field — the save-name entry and the
    // Völva's name prompt both need a literal space character.
    const el = document.activeElement;
    const typing = el instanceof HTMLInputElement
      || el instanceof HTMLTextAreaElement
      || (el instanceof HTMLElement && el.isContentEditable);

    if (!typing && World.OWNED_KEYS.has(e.key)) {
      e.preventDefault();
      // A focused button would otherwise consume the next space itself.
      if (e.key === ' ' && el instanceof HTMLButtonElement) el.blur();
    }

    this.onKeyDown?.(e.key, e.code);
  }
}
