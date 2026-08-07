/**
 * How far a pixel may sit from RGB(0,255,0) and still count as backing,
 * measured as Chebyshev distance: max(r, 255-g, b).
 *
 * The 1998 art carries stray chroma-green specks that the 8-bit palette export
 * quantised onto a *second* near-green palette entry instead of the reserved
 * key. Across the 545 shipped PNGs the drifted greens are (4,252,4) at distance
 * 4 and (4,244,4) at distance 11 — 116 pixels in 12 sprite sheets. The next
 * green of any kind anywhere in the tree is at distance 19, and the nearest
 * green that is actually *painted* art (the bush in HJORLEIA/RUNNI.PNG) is at
 * distance 60. So every value in 12..18 keys exactly the same pixels; 16 is
 * the middle of that empty band.
 *
 * SCOPE: image pixels only. Subtitle colour resolution keys on an EXACT match
 * (`isChromaKey` in GMLParser.ts) and must stay exact — three speech
 * accumulators are authored a genuine dark green and have to keep painting.
 * See docs/known-issues.md #3 and #4.
 */
export const CHROMA_TOLERANCE = 16;

/**
 * Punch out the chroma key in place. Returns true if anything changed.
 *
 * Exported so the tolerance can be tested against the real disc art rather
 * than a fixture; the loop is written out longhand rather than calling a
 * per-pixel predicate because it runs over ~78M pixels at load and the call
 * costs ~25% of the scan (measured) where the compare itself costs ~9%.
 */
export function keyChromaPixels(data: Uint8ClampedArray): boolean {
  const lo = CHROMA_TOLERANCE;
  const hi = 255 - CHROMA_TOLERANCE;
  let changed = false;
  for (let i = 0; i < data.length; i += 4) {
    if (data[i] <= lo && data[i + 1] >= hi && data[i + 2] <= lo) {
      data[i + 3] = 0;
      changed = true;
    }
  }
  return changed;
}

/** Loads and caches images and sounds from the game assets */
export class AssetLoader {
  private imageCache = new Map<string, HTMLImageElement>();
  private audioCache = new Map<string, AudioBuffer>();
  private audioContext: AudioContext | null = null;
  private basePath: string;
  private totalRequested = 0;
  private totalLoaded = 0;
  onProgress?: (loaded: number, total: number) => void;

  /**
   * Which audio container the served asset tree actually has.
   *
   * The build pipeline transcodes the 1998 WAVs to AAC (169 MiB -> 33 MiB), but
   * the masters remain playable and a plain checkout has only WAV. Rather than
   * configure this per deployment, the first audio load probes for .m4a and
   * the answer is reused for every subsequent file.
   *
   * The probe cannot rely on status codes: Vite's SPA fallback answers 200 with
   * index.html for any missing path, so a status check would "find" m4a
   * everywhere and then fail inside decodeAudioData. Content-type is the
   * reliable signal.
   */
  private audioExt: 'M4A' | 'WAV' | null = null;
  private audioProbe: Promise<'M4A' | 'WAV'> | null = null;

  /** Assets that failed to load, for the dev overlay / warnings. */
  readonly missing = new Set<string>();
  /** Emit console warnings for missing assets. On in debug builds. */
  warnOnMissing = false;

  constructor(basePath: string) {
    this.basePath = basePath.replace(/\/$/, '');
  }

  private noteMissing(resolved: string, why: string): void {
    if (this.missing.has(resolved)) return;
    this.missing.add(resolved);
    if (this.warnOnMissing) {
      console.warn(`[assets] missing: ${resolved} (${why})`);
    }
  }

  /** True if the response is really the media we asked for, not an SPA fallback. */
  private looksLikeAudio(res: Response): boolean {
    const ct = (res.headers.get('content-type') ?? '').toLowerCase();
    return res.ok && !ct.startsWith('text/');
  }

  private async resolveAudioExt(): Promise<'M4A' | 'WAV'> {
    if (this.audioExt) return this.audioExt;
    if (this.audioProbe) return this.audioProbe;

    this.audioProbe = (async () => {
      // Probe one known-present line rather than a synthetic path, so a
      // partially-transcoded tree is reported as WAV rather than half-broken.
      const probe = `${this.basePath}/KRISTNIA/MEDIA/VOLVA/GETTUBEA.M4A`;
      try {
        const res = await fetch(probe, { method: 'GET' });
        this.audioExt = this.looksLikeAudio(res) ? 'M4A' : 'WAV';
      } catch {
        this.audioExt = 'WAV';
      }
      console.info(`[assets] audio format: .${this.audioExt.toLowerCase()}`);
      return this.audioExt;
    })();

    return this.audioProbe;
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
        this.noteMissing(resolved, 'image failed to decode');
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

  /** Replace chroma-key green pixels with transparent. See CHROMA_TOLERANCE. */
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
    const changed = keyChromaPixels(imageData.data);

    if (!changed) return Promise.resolve(img);

    ctx.putImageData(imageData, 0, 0);

    return new Promise(resolve => {
      const result = new Image();
      result.onload = () => resolve(result);
      result.src = canvas.toDataURL();
    });
  }

  async loadAudio(path: string): Promise<AudioBuffer | null> {
    // GML always names audio with a literal .wav; swap in whatever the served
    // tree actually carries.
    const ext = await this.resolveAudioExt();
    const resolved = this.resolvePath(path).replace(/\.WAV$/, `.${ext}`);

    const cached = this.audioCache.get(resolved);
    if (cached) return cached;

    this.totalRequested++;
    try {
      const response = await fetch(resolved);
      if (!this.looksLikeAudio(response)) {
        this.noteMissing(resolved, response.ok ? 'not audio (SPA fallback?)' : `HTTP ${response.status}`);
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
    } catch (e) {
      this.noteMissing(resolved, `decode failed: ${e}`);
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
