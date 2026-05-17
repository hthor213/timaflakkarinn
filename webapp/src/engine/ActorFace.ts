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
  fontSize = 22;
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

  private measureText(): void {
    const charWidth = this.fontSize * 0.55;
    this.bounds.width = Math.round(this.text.length * charWidth) + 16;
    this.bounds.height = this.fontSize + 6;
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

    const font = `${this.fontSize}px serif`;
    ctx.font = font;
    ctx.textBaseline = 'top';

    const drawColor = (this.highlighted && this.mouseOver) ? this.highlightColor : this.color;
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
