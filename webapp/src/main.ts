import { Timaflakkarinn } from './game/Timaflakkarinn';
import { resolveMode, resolveInput } from './config';
import { VerbBar } from './game/VerbBar';
import { parseRoute, DEFAULT_PATH } from './routing';

async function main() {
  const canvas = document.getElementById('game-canvas') as HTMLCanvasElement;
  const loadingDiv = document.getElementById('loading') as HTMLDivElement;
  const loadingBar = document.getElementById('loading-bar') as HTMLDivElement;
  const loadingText = document.getElementById('loading-text') as HTMLDivElement;

  if (!canvas) {
    console.error('Canvas not found');
    return;
  }

  // play | debug — from hostname, overridable with ?debug=1 / ?debug=0
  const mode = resolveMode();
  document.documentElement.dataset.mode = mode;

  // pointer | touch — from the media queries, overridable with ?touch=1 / 0.
  // Stamped on <html> the same way, because the portrait layout is entirely
  // CSS and has to be in force before the first frame rather than after it.
  const input = resolveInput();
  document.documentElement.dataset.input = input;

  // "/" and anything unrecognised land on the intro. replaceState rather than
  // push, so Back doesn't bounce the player between / and /intro.
  let route = parseRoute(window.location.pathname);
  if (!route) {
    history.replaceState(null, '', DEFAULT_PATH + window.location.search);
    route = parseRoute(DEFAULT_PATH);
  } else if (window.location.pathname !== route.path) {
    // canonicalise an alias, e.g. /kristnitaka -> /chapter2
    history.replaceState(null, '', route.path + window.location.search);
  }

  const resourcePath = '/GAME';
  const gmlPath = '/gml';

  const game = new Timaflakkarinn(canvas, resourcePath, gmlPath, mode === 'debug');

  // Touch has no right button and no hover, so the verb can never be cycled and
  // the 404 authored verb reactions are unreachable. The bar replaces the cycle
  // with a choice. Re-bound per chapter -- see onStateControllerReady.
  if (input === 'touch') {
    const verbBar = new VerbBar(document.body);
    game.onStateControllerReady = (sc) => verbBar.attach(sc);
  }

  game.onLoadingProgress = (text: string, percent: number) => {
    loadingText.textContent = text;
    loadingBar.style.width = `${percent}%`;
  };

  // Wait for a gesture before starting — browsers require one to unlock audio.
  loadingText.textContent = 'Smelltu til að byrja';
  loadingBar.style.width = '100%';

  await new Promise<void>(resolve => {
    const handler = () => {
      document.removeEventListener('click', handler);
      document.removeEventListener('keydown', handler);
      resolve();
    };
    document.addEventListener('click', handler);
    document.addEventListener('keydown', handler);
  });

  loadingDiv.style.display = 'none';

  try {
    await game.start(route!.chapter);
  } catch (e) {
    console.error('Game error:', e);
    loadingText.textContent = `Villa: ${e}`;
    loadingDiv.style.display = 'block';
  }
}

main().catch(console.error);
