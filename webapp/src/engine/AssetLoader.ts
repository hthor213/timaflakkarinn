/** Loads and caches images and sounds from the game assets */
export class AssetLoader {
  private imageCache = new Map<string, HTMLImageElement>();
  private audioCache = new Map<string, AudioBuffer>();
  private audioContext: AudioContext | null = null;
  private basePath: string;
  private totalRequested = 0;
  private totalLoaded = 0;
  onProgress?: (loaded: number, total: number) => void;

  constructor(basePath: string) {
    this.basePath = basePath.replace(/\/$/, '');
  }

  getAudioContext(): AudioContext {
    if (!this.audioContext) {
      this.audioContext = new AudioContext();
    }
    return this.audioContext;
  }

  async resumeAudio(): Promise<void> {
    const ctx = this.getAudioContext();
    if (ctx.state === 'suspended') {
      await ctx.resume();
    }
  }

  private resolvePath(path: string): string {
    // GML paths use backslashes and no file extensions:
    //   "\Landnam\Graphic\SkipingA\skipingA"
    // These map to ISO 9660 paths on the CD:
    //   GAME/LANDNAM/GRAPHIC/SKIPINGA/SKIPINGA.PNG
    let p = path.replace(/\\/g, '/');
    // Remove leading slash
    if (p.startsWith('/')) p = p.substring(1);
    // Convert to uppercase (ISO 9660 Level 1)
    p = p.toUpperCase();
    // If path already has an extension, keep it; otherwise add .PNG
    if (!p.match(/\.\w+$/)) {
      p += '.PNG';
    }
    return `${this.basePath}/${p}`;
  }

  async loadImage(path: string): Promise<HTMLImageElement> {
    const resolved = this.resolvePath(path);
    const cached = this.imageCache.get(resolved);
    if (cached) return cached;

    this.totalRequested++;
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = async () => {
        // Apply green chroma key: replace RGB(0,255,0) with transparent
        const processed = await this.applyChromaKey(img);
        this.imageCache.set(resolved, processed);
        this.totalLoaded++;
        this.onProgress?.(this.totalLoaded, this.totalRequested);
        resolve(processed);
      };
      img.onerror = () => {
        this.totalLoaded++;
        this.onProgress?.(this.totalLoaded, this.totalRequested);
        // Return a 1x1 transparent image on failure
        const fallback = new Image(1, 1);
        this.imageCache.set(resolved, fallback);
        resolve(fallback);
      };
      img.src = resolved;
    });
  }

  /** Replace green (0,255,0) pixels with transparent */
  private applyChromaKey(img: HTMLImageElement): Promise<HTMLImageElement> {
    const w = img.naturalWidth;
    const h = img.naturalHeight;
    if (w === 0 || h === 0) return Promise.resolve(img);

    const canvas = document.createElement('canvas');
    canvas.width = w;
    canvas.height = h;
    const ctx = canvas.getContext('2d')!;
    ctx.drawImage(img, 0, 0);

    const imageData = ctx.getImageData(0, 0, w, h);
    const data = imageData.data;
    let changed = false;

    for (let i = 0; i < data.length; i += 4) {
      if (data[i] === 0 && data[i + 1] === 255 && data[i + 2] === 0) {
        data[i + 3] = 0;
        changed = true;
      }
    }

    if (!changed) return Promise.resolve(img);

    ctx.putImageData(imageData, 0, 0);

    return new Promise(resolve => {
      const result = new Image();
      result.onload = () => resolve(result);
      result.src = canvas.toDataURL();
    });
  }

  async loadAudio(path: string): Promise<AudioBuffer | null> {
    const resolved = this.resolvePath(path);
    const cached = this.audioCache.get(resolved);
    if (cached) return cached;

    this.totalRequested++;
    try {
      const response = await fetch(resolved);
      if (!response.ok) {
        this.totalLoaded++;
        this.onProgress?.(this.totalLoaded, this.totalRequested);
        return null;
      }
      const arrayBuffer = await response.arrayBuffer();
      const audioBuffer = await this.getAudioContext().decodeAudioData(arrayBuffer);
      this.audioCache.set(resolved, audioBuffer);
      this.totalLoaded++;
      this.onProgress?.(this.totalLoaded, this.totalRequested);
      return audioBuffer;
    } catch {
      this.totalLoaded++;
      this.onProgress?.(this.totalLoaded, this.totalRequested);
      return null;
    }
  }

  getLoadedImage(path: string): HTMLImageElement | undefined {
    return this.imageCache.get(this.resolvePath(path));
  }

  getLoadedAudio(path: string): AudioBuffer | undefined {
    return this.audioCache.get(this.resolvePath(path));
  }
}
