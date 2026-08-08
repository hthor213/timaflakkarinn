// Render the game at phone dimensions and report the touch chrome's geometry.
//
// Two phone layout changes shipped blind before this existed and both were
// wrong -- a verb bar that ate two thirds of the screen, and a dialogue list
// that collapsed to nothing. Neither was visible from the machine that built
// them. This makes the portrait layout checkable here.
//
// SETUP. Playwright is deliberately NOT a dependency of webapp/: the deploy
// runs `npm ci` in the serving checkout, and the browser has no business in
// the game's tree. It lives outside the repo:
//
//   mkdir -p ~/tools/browser && cd ~/tools/browser
//   npm init -y && npm i playwright@1.49.1     # 1.49 is the last that runs on Node 18
//   npx playwright install chromium
//   sudo npx playwright install-deps chromium  # or apt-get the libs directly
//
// Then run this file from ~/tools/browser so it can resolve playwright:
//   node ~/work/timaflakkarinn/tools/browser/phone-shot.mjs <url> <out.png>
//
import { chromium } from 'playwright';

const args = process.argv.slice(2);
const url = args[0];
const out = args[1];
const flag = (name, dflt) => {
  const i = args.indexOf(`--${name}`);
  return i === -1 ? dflt : args[i + 1];
};
const taps = [];
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--tap') taps.push(args[i + 1].split(',').map(Number));
}

const width = Number(flag('w', 402));
const height = Number(flag('h', 800));
const dpr = Number(flag('dpr', 3));
const wait = Number(flag('wait', 6000));

const browser = await chromium.launch();
const ctx = await browser.newContext({
  viewport: { width, height },
  deviceScaleFactor: dpr,
  isMobile: true,
  hasTouch: true,
  userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 '
    + '(KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
});
const page = await ctx.newPage();
const errors = [];
page.on('console', m => { if (m.type() === 'error') errors.push(m.text()); });
page.on('pageerror', e => errors.push(String(e)));

await page.goto(url, { waitUntil: 'domcontentloaded' });
// The game waits for a gesture before starting (audio unlock).
await page.waitForTimeout(1200);
await page.mouse.click(width / 2, 200);
await page.waitForTimeout(1500);

// Skip the credits/intro film if the button is up, so the menu is reachable
// without waiting out the whole thing.
for (let i = 0; i < 12; i++) {
  const skip = page.locator('button', { hasText: /Sleppa/ });
  if (await skip.count()) { await skip.first().click().catch(() => {}); break; }
  await page.waitForTimeout(500);
}
await page.waitForTimeout(wait);

for (const [x, y] of taps) {
  await page.mouse.click(x, y);
  await page.waitForTimeout(1500);
}

// Report the touch chrome's real geometry — the thing that has twice been wrong
// and twice been invisible from here.
const geom = await page.evaluate(() => {
  const r = (sel) => {
    const el = document.querySelector(sel);
    if (!el) return null;
    const b = el.getBoundingClientRect();
    const cs = getComputedStyle(el);
    return { top: Math.round(b.top), height: Math.round(b.height),
             display: cs.display, children: el.children.length };
  };
  return {
    input: document.documentElement.dataset.input,
    mode: document.documentElement.dataset.mode,
    viewport: { w: innerWidth, h: innerHeight },
    game: r('#game-container'),
    sentences: r('#sentence-list'),
    verbs: r('#verb-bar'),
    menu: r('#menu-list'),
    menuText: [...document.querySelectorAll('#menu-list .sentence')].map(b => b.textContent),
  };
});

await page.screenshot({ path: out, fullPage: false });
await browser.close();

console.log(JSON.stringify(geom, null, 2));
if (errors.length) {
  console.log('\npage errors:');
  for (const e of errors.slice(0, 8)) console.log('  ' + e);
}
