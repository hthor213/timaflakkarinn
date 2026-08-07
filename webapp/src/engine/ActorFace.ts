import type { Rect, Color } from './types';
import type { Actor } from './Actor';
import type { AssetLoader } from './AssetLoader';
import type { Pulser, Pulsable } from './Pulser';
import { colorToCSS } from './types';

export interface ActorFace {
  name: string;
  owner: Actor | null;
  bounds: Rect;
  xOffset: number;
  yOffset: number;
  scaling: number;
  onStage: boolean;
  attached: boolean;
  transparent: boolean;
  loader: AssetLoader | null;
  pulser: Pulser | null;

  setLocation(x: number, y: number): void;
  setScaling(scale: number): void;
  paint(ctx: CanvasRenderingContext2D, dirtyRect: Rect): void;
  contains(x: number, y: number): boolean;
  prepare(loader: AssetLoader): Promise<void>;
  unprepare(): void;
  reset(): void;
  getZOrder(): number;

  isAnimated(): boolean;
  startAnimation(): void;
  stopAnimation(): void;
  isAnimationFinished(): boolean;
  onAnimationFinished?: () => void;
}

/** Static image face - renders a PNG. Loads lazily on first paint. */
export class StaticActorFace implements ActorFace {
  name: string;
  owner: Actor | null = null;
  bounds: Rect = { x: 0, y: 0, width: 0, height: 0 };
  xOffset = 0;
  yOffset = 0;
  scaling = 1.0;
  onStage = false;
  attached = false;
  transparent = false;
  onAnimationFinished?: () => void;
  loader: AssetLoader | null = null;
  pulser: Pulser | null = null;

  imagePath: string;
  image: HTMLImageElement | null = null;
  prepared = false;
  frameWidth = 0;
  frameHeight = 0;
  private loading = false;

  constructor(name: string, imagePath: string) {
    this.name = name;
    this.imagePath = imagePath;
  }

  async prepare(loader: AssetLoader): Promise<void> {
    if (this.prepared || this.loading) return;
    this.loader = loader;
    this.loading = true;
    this.image = await loader.loadImage(this.imagePath);
    this.frameWidth = this.image.naturalWidth;
    this.frameHeight = this.image.naturalHeight;
    this.bounds.width = Math.round(this.frameWidth * this.scaling);
    this.bounds.height = Math.round(this.frameHeight * this.scaling);
    this.prepared = true;
    this.loading = false;
  }

  /** Kick off lazy load without blocking */
  private ensureLoading(): void {
    if (this.prepared || this.loading || !this.loader || !this.imagePath) return;
    this.prepare(this.loader);
  }

  unprepare(): void {
    this.image = null;
    this.prepared = false;
  }

  setLocation(x: number, y: number): void {
    this.bounds.x = x + Math.round(this.xOffset * this.scaling);
    this.bounds.y = y + Math.round(this.yOffset * this.scaling);
  }

  setScaling(scale: number): void {
    this.scaling = scale;
    if (this.prepared) {
      this.bounds.width = Math.round(this.frameWidth * scale);
      this.bounds.height = Math.round(this.frameHeight * scale);
    }
  }

  paint(ctx: CanvasRenderingContext2D, _dirtyRect: Rect): void {
    if (!this.prepared) {
      this.ensureLoading();
      return; // Will draw next frame once loaded
    }
    if (!this.image) return;
    ctx.drawImage(
      this.image,
      0, 0, this.frameWidth, this.frameHeight,
      this.bounds.x, this.bounds.y, this.bounds.width, this.bounds.height
    );
  }

  contains(x: number, y: number): boolean {
    return x >= this.bounds.x && x < this.bounds.x + this.bounds.width &&
           y >= this.bounds.y && y < this.bounds.y + this.bounds.height;
  }

  reset(): void {}
  getZOrder(): number { return this.owner?.location.y ?? 0; }
  isAnimated(): boolean { return false; }
  startAnimation(): void {}
  stopAnimation(): void {}
  isAnimationFinished(): boolean { return true; }
}

/** Animated sprite face - sprite sheet with vertical frames. Loads lazily. */
export class AnimatedActorFace implements ActorFace, Pulsable {
  name: string;
  owner: Actor | null = null;
  bounds: Rect = { x: 0, y: 0, width: 0, height: 0 };
  xOffset = 0;
  yOffset = 0;
  scaling = 1.0;
  onStage = false;
  attached = false;
  transparent = false;
  onAnimationFinished?: () => void;
  loader: AssetLoader | null = null;
  pulser: Pulser | null = null;

  imagePath: string;
  image: HTMLImageElement | null = null;
  prepared = false;
  numFrames: number;
  currentFrame = 0;
  speed: number;
  repeats: number;
  repsLeft: number;
  random = false;
  frameWidth = 0;
  frameHeight = 0;

  private _finished = false;
  private loading = false;

  constructor(name: string, imagePath: string, numFrames: number, speed: number, repeats: number) {
    this.name = name;
    this.imagePath = imagePath;
    this.numFrames = Math.max(1, numFrames);
    this.speed = speed;
    this.repeats = repeats;
    this.repsLeft = repeats;
  }

  async prepare(loader: AssetLoader): Promise<void> {
    if (this.prepared || this.loading) return;
    this.loader = loader;
    this.loading = true;
    this.image = await loader.loadImage(this.imagePath);
    this.frameWidth = this.image.naturalWidth;
    this.frameHeight = Math.floor(this.image.naturalHeight / this.numFrames);
    this.bounds.width = Math.round(this.frameWidth * this.scaling);
    this.bounds.height = Math.round(this.frameHeight * this.scaling);
    this.prepared = true;
    this.loading = false;
  }

  private ensureLoading(): void {
    if (this.prepared || this.loading || !this.loader || !this.imagePath) return;
    this.prepare(this.loader);
  }

  unprepare(): void {
    this.stopAnimation();
    this.image = null;
    this.prepared = false;
  }

  setLocation(x: number, y: number): void {
    this.bounds.x = x + Math.round(this.xOffset * this.scaling);
    this.bounds.y = y + Math.round(this.yOffset * this.scaling);
  }

  setScaling(scale: number): void {
    this.scaling = scale;
    if (this.prepared) {
      this.bounds.width = Math.round(this.frameWidth * scale);
      this.bounds.height = Math.round(this.frameHeight * scale);
    }
  }

  paint(ctx: CanvasRenderingContext2D, _dirtyRect: Rect): void {
    if (!this.prepared) {
      this.ensureLoading();
      return;
    }
    if (!this.image) return;
    const srcY = this.currentFrame * this.frameHeight;
    ctx.drawImage(
      this.image,
      0, srcY, this.frameWidth, this.frameHeight,
      this.bounds.x, this.bounds.y, this.bounds.width, this.bounds.height
    );
  }

  contains(x: number, y: number): boolean {
    return x >= this.bounds.x && x < this.bounds.x + this.bounds.width &&
           y >= this.bounds.y && y < this.bounds.y + this.bounds.height;
  }

  reset(): void {
    this.currentFrame = 0;
    this.repsLeft = this.repeats;
    this._finished = false;
  }

  getZOrder(): number { return this.owner?.location.y ?? 0; }
  isAnimated(): boolean { return true; }
  isAnimationFinished(): boolean { return this._finished; }

  startAnimation(): void {
    this.stopAnimation();
    this._finished = false;
    this.repsLeft = this.repeats;
    if (this.speed <= 0) return;
    this.pulser?.register(this);
  }

  stopAnimation(): void {
    this.pulser?.unregister(this);
  }

  // Pulsable interface
  pulse(_delta: number): void {
    this.advanceFrame();
  }

  getPulseInterval(): number {
    return this.speed;
  }

  private advanceFrame(): void {
    if (this.repsLeft === 0) {
      this.stopAnimation();
      this._finished = true;
      this.onAnimationFinished?.();
      return;
    }
    if (this.random) {
      this.currentFrame = Math.floor(Math.random() * this.numFrames);
    } else {
      this.currentFrame++;
      if (this.currentFrame >= this.numFrames) {
        this.currentFrame = 0;
        if (this.repsLeft > 0) this.repsLeft--;
      }
    }
  }
}

/** Text face - renders dynamic text */
/**
 * Shared offscreen context used purely for text metrics.
 *
 * Hit boxes must be measured with the same font the text is drawn with;
 * anything else guesses, and a guessed hit box is a dialogue option you cannot
 * click. One context for the whole app — measuring is stateless.
 */
let _measureCtx: CanvasRenderingContext2D | null = null;
function measuringContext(): CanvasRenderingContext2D {
  if (!_measureCtx) {
    _measureCtx = document.createElement('canvas').getContext('2d')!;
  }
  return _measureCtx;
}

export class TextActorFace implements ActorFace {
  name: string;
  owner: Actor | null = null;
  bounds: Rect = { x: 0, y: 0, width: 0, height: 0 };
  xOffset = 0;
  yOffset = 0;
  scaling = 1.0;
  onStage = false;
  attached = false;
  transparent = false;
  onAnimationFinished?: () => void;
  loader: AssetLoader | null = null;
  pulser: Pulser | null = null;

  text = '';
  color: Color = { r: 255, g: 255, b: 255 };
  boldColor: Color = { r: 0, g: 0, b: 0 };
  highlightColor: Color = { r: 255, g: 255, b: 0 };
  highlighted = false;
  mouseOver = false;
  /**
   * Changing the size invalidates the hit box, so re-measure. Callers set
   * `fontSize` before or after `setText()` depending on the call site, and an
   * order-dependent hit box is the kind of bug that only shows up in one menu.
   */
  private _fontSize = 22;
  get fontSize(): number { return this._fontSize; }
  set fontSize(v: number) {
    if (v === this._fontSize) return;
    this._fontSize = v;
    if (this.text) this.measureText();
  }
  alignment: 'center' | 'left' | 'right' = 'left';
  backgroundColor: Color | null = null;
  prepared = false;

  constructor(name: string) {
    this.name = name;
  }

  setText(text: string): void {
    this.text = text;
    this.measureText();
  }

  /** Font used at rest and when hovered. Hover renders bold. */
  fontFor(bold: boolean): string {
    return `${bold ? 'bold ' : ''}${this.fontSize}px serif`;
  }

  /**
   * Measure the hit box against the font actually used to draw it.
   *
   * This used to estimate `text.length * fontSize * 0.55` — a fixed advance per
   * character, against a *proportional* serif. The box was therefore wrong by a
   * different amount for every line, and where it under-measured, the right-hand
   * part of a dialogue option simply was not clickable: you had to aim left.
   *
   * Measured with the **bold** metrics, which are the wider of the two, so the
   * clickable area never shrinks at the moment the pointer enters and the text
   * thickens.
   */
  private measureText(): void {
    if (!this.text) {
      this.bounds.width = 0;
      this.bounds.height = 0;
      return;
    }
    const ctx = measuringContext();
    ctx.font = this.fontFor(true);
    const m = ctx.measureText(this.text);
    this.bounds.width = Math.ceil(m.width) + 16;

    // Real ascent/descent where the browser reports it; the old fontSize+6
    // guess was close for 22px serif but drifts at other sizes.
    const asc = (m as any).actualBoundingBoxAscent;
    const desc = (m as any).actualBoundingBoxDescent;
    this.bounds.height = (typeof asc === 'number' && typeof desc === 'number' && asc + desc > 0)
      ? Math.ceil(asc + desc) + 6
      : this.fontSize + 6;
  }

  async prepare(_loader: AssetLoader): Promise<void> {
    this.measureText();
    this.prepared = true;
  }

  unprepare(): void { this.prepared = false; }

  setLocation(x: number, y: number): void {
    this.bounds.x = x + Math.round(this.xOffset * this.scaling);
    this.bounds.y = y + Math.round(this.yOffset * this.scaling);
    if (this.alignment === 'center') {
      this.bounds.x -= Math.round(this.bounds.width / 2);
    }
  }

  setScaling(scale: number): void { this.scaling = scale; }

  paint(ctx: CanvasRenderingContext2D, _dirtyRect: Rect): void {
    if (!this.text || this.transparent) return;

    // Hovering a selectable line renders it bold. The hit box was measured with
    // bold metrics, so it does not move or resize as the weight changes.
    const hovering = this.highlighted && this.mouseOver;
    ctx.font = this.fontFor(hovering);
    ctx.textBaseline = 'top';

    const drawColor = hovering ? this.highlightColor : this.color;
    const tx = this.bounds.x + 8;
    const ty = this.bounds.y + 3;

    if (this.backgroundColor) {
      ctx.fillStyle = colorToCSS(this.backgroundColor);
      ctx.fillRect(this.bounds.x, this.bounds.y, this.bounds.width, this.bounds.height);
    }

    ctx.fillStyle = colorToCSS(this.boldColor);
    ctx.fillText(this.text, tx - 1, ty);
    ctx.fillText(this.text, tx + 1, ty);
    ctx.fillText(this.text, tx, ty - 1);
    ctx.fillText(this.text, tx, ty + 1);

    ctx.fillStyle = colorToCSS(drawColor);
    ctx.fillText(this.text, tx, ty);
  }

  contains(x: number, y: number): boolean {
    return x >= this.bounds.x && x < this.bounds.x + this.bounds.width &&
           y >= this.bounds.y && y < this.bounds.y + this.bounds.height;
  }

  reset(): void {}
  getZOrder(): number { return this.text ? 999998 : (this.owner?.location.y ?? 0); }
  isAnimated(): boolean { return false; }
  startAnimation(): void {}
  stopAnimation(): void {}
  isAnimationFinished(): boolean { return true; }
}

/** Cursor face */
export class CursorFace implements ActorFace {
  name: string;
  owner: Actor | null = null;
  bounds: Rect = { x: 0, y: 0, width: 32, height: 32 };
  xOffset = 0;
  yOffset = 0;
  scaling = 1.0;
  onStage = true;
  attached = true;
  transparent = false;
  onAnimationFinished?: () => void;
  loader: AssetLoader | null = null;
  pulser: Pulser | null = null;

  imagePath: string;
  image: HTMLImageElement | null = null;
  prepared = false;

  constructor(name: string, imagePath: string, xOffset = 0, yOffset = 0) {
    this.name = name;
    this.imagePath = imagePath;
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  async prepare(loader: AssetLoader): Promise<void> {
    if (this.prepared) return;
    this.loader = loader;
    this.image = await loader.loadImage(this.imagePath);
    this.bounds.width = this.image.naturalWidth;
    this.bounds.height = this.image.naturalHeight;
    this.prepared = true;
  }

  unprepare(): void { this.image = null; this.prepared = false; }

  setLocation(x: number, y: number): void {
    this.bounds.x = x + this.xOffset;
    this.bounds.y = y + this.yOffset;
  }

  setScaling(_s: number): void {}

  paint(ctx: CanvasRenderingContext2D, _dirtyRect: Rect): void {
    if (!this.prepared || !this.image) return;
    ctx.drawImage(this.image, this.bounds.x, this.bounds.y);
  }

  contains(x: number, y: number): boolean {
    return x >= this.bounds.x && x < this.bounds.x + this.bounds.width &&
           y >= this.bounds.y && y < this.bounds.y + this.bounds.height;
  }

  reset(): void {}
  getZOrder(): number { return 999999; }
  isAnimated(): boolean { return false; }
  startAnimation(): void {}
  stopAnimation(): void {}
  isAnimationFinished(): boolean { return true; }
}
