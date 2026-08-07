import { StaticActorFace, AnimatedActorFace, CursorFace } from '../engine/ActorFace';
import type { AssetLoader } from '../engine/AssetLoader';

type ImageFace = StaticActorFace | AnimatedActorFace | CursorFace;

const BATCH = 16;

/** Sækja og decode-a allar myndir núverandi kafla, í 16-wide samhliða batchum.
 *  Hljóð er sleppt — það er hlaðið lazily við fyrstu spilun. */
export async function prewarmChapter(
  container: Map<string, any>,
  loader: AssetLoader,
  onProgress?: (loaded: number, total: number) => void,
): Promise<void> {
  const targets: ImageFace[] = [];
  for (const obj of container.values()) {
    if (
      (obj instanceof StaticActorFace || obj instanceof AnimatedActorFace || obj instanceof CursorFace)
      && (obj as any).imagePath
      && !(obj as any).prepared
    ) {
      targets.push(obj);
    }
  }

  let loaded = 0;
  const total = targets.length;
  if (total === 0) {
    onProgress?.(0, 0);
    return;
  }

  for (let i = 0; i < total; i += BATCH) {
    const batch = targets.slice(i, i + BATCH);
    await Promise.all(batch.map(async face => {
      try {
        await face.prepare(loader);
      } catch {
        // Ignore individual failures — paint will fall back gracefully
      }
      loaded++;
      onProgress?.(loaded, total);
    }));
  }
}
