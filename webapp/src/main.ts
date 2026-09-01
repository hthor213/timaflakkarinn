import { Timaflakkarinn } from './game/Timaflakkarinn';
import { resolveMode, resolveInput, resolveCanvasSubtitles } from './config';
import { VerbBar } from './game/VerbBar';
import { SentenceList } from './game/SentenceList';
import { MenuList } from './game/MenuList';
import { Subtitles } from './game/Subtitles';
import { setCanvasSubtitles } from './engine/ActorMouth';
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

  // Phone: the strip under the picture IS the subtitle, so nothing is painted
  // into the canvas. Browser: off by default, ?subs=1 to turn on.
  setCanvasSubtitles(resolveCanvasSubtitles(input));

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
    // Order matters: both append to <body>, and reading down the screen should
    // go picture, then what you can say, then how you can act.
    const menu = new MenuList(document.body);
    // Above the dialogue rows: it is the line being spoken to you, and it sits
    // directly under the picture where the speaker is.
    new Subtitles(document.body);
    const sentences = new SentenceList(document.body);
    const verbBar = new VerbBar(document.body);
    menu.attach(game.saveScene);
    game.onStateControllerReady = (sc) => {
      sentences.attach(sc);
      verbBar.attach(sc);
    };
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
      // Unlock audio HERE, synchronously, while we are still inside the
      // gesture. The game registers its own resume listener, but only after
      // start() is under way -- by which point this handler has already eaten
      // the first tap, so the context stayed suspended until the player
      // happened to tap a second time. On a desktop that is invisible because
      // clicking is constant; on a phone the first thing you hear is missing.
      game.unlockAudio();
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
