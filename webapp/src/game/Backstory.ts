/**
 * The backstory film.
 *
 * `INTRO.AVI` shipped on the 1999 disc but no GML references it, so the web
 * recreation never played it — it was invisible to a capture that derived its
 * file list from content references. It is a 76-second 3D render: a push through
 * a darkened library onto a storybook that introduces Denni.
 *
 * The original is Cinepak, which no current browser decodes, so the app plays a
 * transcoded H.264 derivative. `tools/pipeline/make-video.sh` regenerates it
 * from the master in web_import/.
 */

const SKIP_AFTER_MS = 800;   // let the first frame land before offering to skip

export interface BackstoryOptions {
  /** Container the game canvas lives in; the overlay is appended here. */
  container: HTMLElement;
  src: string;
  /** Called if the file cannot be played at all, so the caller can move on. */
  onUnavailable?: (reason: string) => void;
}

/**
 * Plays the backstory and resolves when it finishes, is skipped, or fails.
 * Never rejects — a broken video must not block the game from starting.
 */
export function playBackstory(opts: BackstoryOptions): Promise<'played' | 'skipped' | 'unavailable'> {
  const { container, src } = opts;

  return new Promise(resolve => {
    const overlay = document.createElement('div');
    overlay.id = 'backstory';
    overlay.style.cssText = [
      'position:absolute', 'inset:0', 'z-index:200', 'background:#000',
      'display:flex', 'align-items:center', 'justify-content:center',
    ].join(';');

    const video = document.createElement('video');
    video.src = src;
    video.playsInline = true;          // iOS: play inline instead of fullscreen
    video.autoplay = true;
    video.controls = false;
    video.style.cssText = 'width:100%;height:100%;object-fit:contain;background:#000';

    const label = document.createElement('div');
    label.textContent = 'Baksaga';
    label.style.cssText = [
      'position:absolute', 'top:12px', 'left:16px', 'color:#c8a040',
      'font:600 15px serif', 'letter-spacing:.08em', 'text-shadow:0 1px 3px #000',
      'opacity:0', 'transition:opacity .4s',
    ].join(';');

    const skip = document.createElement('button');
    skip.textContent = 'Sleppa baksögu';
    skip.style.cssText = [
      'position:absolute', 'top:10px', 'right:12px', 'z-index:201',
      'padding:8px 16px', 'font:14px serif', 'cursor:pointer',
      'background:#333', 'color:#ccc', 'border:1px solid #666',
      'border-radius:4px', 'opacity:0', 'transition:opacity .4s',
    ].join(';');

    let done = false;
    const finish = (how: 'played' | 'skipped' | 'unavailable', why?: string) => {
      if (done) return;
      done = true;
      try { video.pause(); } catch { /* already gone */ }
      video.removeAttribute('src');
      overlay.remove();
      if (how === 'unavailable') opts.onUnavailable?.(why ?? 'unknown');
      resolve(how);
    };

    skip.onclick = () => finish('skipped');
    video.onended = () => finish('played');
    video.onerror = () => finish('unavailable', `cannot play ${src}`);

    // Esc also skips — matches the convention of every other cutscene.
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') { window.removeEventListener('keydown', onKey); finish('skipped'); }
    };
    window.addEventListener('keydown', onKey);

    overlay.append(video, label, skip);
    container.appendChild(overlay);

    // Reveal the controls once playback is actually under way, so a failure
    // shows nothing rather than a skip button over a black rectangle.
    video.onplaying = () => {
      setTimeout(() => { label.style.opacity = '1'; skip.style.opacity = '1'; }, SKIP_AFTER_MS);
    };

    // Autoplay with sound needs a prior user gesture. main.ts already waits for
    // a click before starting, so this normally succeeds; if the browser still
    // refuses, fall back to muted playback rather than showing nothing.
    video.play().catch(() => {
      video.muted = true;
      video.play().catch(() => finish('unavailable', 'autoplay blocked'));
    });
  });
}
