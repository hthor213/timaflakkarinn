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

  // Mouse state
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

    canvas.addEventListener('mousemove', (e) => this.handleMouseMove(e));
    canvas.addEventListener('mousedown', (e) => this.handleMouseDown(e));
    canvas.addEventListener('contextmenu', (e) => e.preventDefault());
    window.addEventListener('keydown', (e) => this.handleKeyDown(e));
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

  private handleMouseMove(e: MouseEvent): void {
    const rect = this.canvas.getBoundingClientRect();
    this.mouseX = Math.max(0, Math.min(799, Math.round((e.clientX - rect.left) * (800 / rect.width))));
    this.mouseY = Math.max(0, Math.min(599, Math.round((e.clientY - rect.top) * (600 / rect.height))));

    // Update cursor
    if (this.currentScene?.cursorFace) {
      this.currentScene.cursorFace.setLocation(this.mouseX, this.mouseY);
    }

    // Hit test for enter/exit events
    if (this.currentScene) {
      const face = this.currentScene.getActorFaceAt(this.mouseX, this.mouseY);
      if (face !== this.lastFaceUnderMouse) {
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
    }
  }

  private handleMouseDown(e: MouseEvent): void {
    this.onMouseClicked?.(this.mouseX, this.mouseY, e.button);

    if (this.currentScene) {
      const face = this.currentScene.getActorFaceAt(this.mouseX, this.mouseY);
      if (face?.owner) {
        face.owner.onClicked?.(face.owner);
        this.onActorClicked?.(face.owner, e.button);
      }
    }
  }

  private handleKeyDown(e: KeyboardEvent): void {
    this.onKeyDown?.(e.key, e.code);
  }
}
