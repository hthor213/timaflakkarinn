import { Timaflakkarinn } from './game/Timaflakkarinn';

async function main() {
  const canvas = document.getElementById('game-canvas') as HTMLCanvasElement;
  const loadingDiv = document.getElementById('loading') as HTMLDivElement;
  const loadingBar = document.getElementById('loading-bar') as HTMLDivElement;
  const loadingText = document.getElementById('loading-text') as HTMLDivElement;

  if (!canvas) {
    console.error('Canvas not found');
    return;
  }

  // Asset paths - these point to the game content served by Vite
  // The game assets should be in public/GAME/ (copied from the CD)
  const resourcePath = '/GAME';
  const gmlPath = '/gml';

  const game = new Timaflakkarinn(canvas, resourcePath, gmlPath);

  game.onLoadingProgress = (text: string, percent: number) => {
    loadingText.textContent = text;
    loadingBar.style.width = `${percent}%`;
  };

  // Show loading screen, wait for click to start (needed for audio context)
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

  // Hide loading overlay immediately so canvas is visible
  loadingDiv.style.display = 'none';

  try {
    await game.start();
  } catch (e) {
    console.error('Game error:', e);
    loadingText.textContent = `Villa: ${e}`;
    loadingDiv.style.display = 'block';
  }
}

main().catch(console.error);
