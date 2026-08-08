/**
 * Runtime mode.
 *
 * Two deployments, one build artifact:
 *   tt.spliffdonk.com      -> play   (no debug panel, game fills the viewport)
 *   tt-dev.spliffdonk.com  -> debug  (sequence list, log, manual controls)
 *
 * Resolution order, highest priority first:
 *   1. explicit ?debug=1 / ?debug=0     — lets you debug production, or preview
 *                                         play mode locally, without a rebuild
 *   2. hostname                          — tt-dev.* / localhost / 127.0.0.1
 *   3. play
 */

export type AppMode = 'play' | 'debug';

const DEBUG_HOST_PREFIXES = ['tt-dev.', 'dev.'];
const DEBUG_HOSTS = ['localhost', '127.0.0.1', '[::1]'];

export function resolveMode(loc: Location | URL = window.location): AppMode {
  const params = new URLSearchParams(loc.search);
  const explicit = params.get('debug');
  if (explicit === '1' || explicit === 'true') return 'debug';
  if (explicit === '0' || explicit === 'false') return 'play';

  const host = loc.hostname;
  if (DEBUG_HOSTS.includes(host)) return 'debug';
  if (DEBUG_HOST_PREFIXES.some(p => host.startsWith(p))) return 'debug';

  return 'play';
}

export function isDebug(mode: AppMode = resolveMode()): boolean {
  return mode === 'debug';
}

/**
 * Input mode.
 *
 * The 1999 game is a two-button game: left button acts, right button cycles the
 * verb. A touch screen has neither a right button nor hover, so on a phone the
 * verb can never be changed and the game is not merely awkward -- it is
 * unfinishable. Touch mode replaces the cycle with an explicit verb bar below
 * the canvas: tap a verb, then tap the world.
 *
 * Resolution order, highest priority first:
 *   1. explicit ?touch=1 / ?touch=0   — the only way to exercise either layout
 *                                       from the other kind of machine, which
 *                                       is how this was developed and is how
 *                                       it stays testable
 *   2. (pointer: coarse) or (hover: none)
 *   3. pointer
 *
 * Both media queries are checked because they fail independently: a device can
 * report a coarse pointer while still claiming hover, and a TV or a touch
 * laptop can report no hover with a fine pointer. Either one alone means the
 * right-button cycle is not reachable.
 */
export type InputMode = 'pointer' | 'touch';

export function resolveInput(
  loc: Location | URL = window.location,
  matches: (query: string) => boolean = (q) => window.matchMedia(q).matches,
): InputMode {
  const params = new URLSearchParams(loc.search);
  const explicit = params.get('touch');
  if (explicit === '1' || explicit === 'true') return 'touch';
  if (explicit === '0' || explicit === 'false') return 'pointer';

  if (matches('(pointer: coarse)') || matches('(hover: none)')) return 'touch';

  return 'pointer';
}

/**
 * Should subtitles be painted into the canvas?
 *
 * On touch: never. The readable strip under the picture is the subtitle there,
 * and the canvas line is ten physical pixels of clutter over the art.
 *
 * In a browser: a setting, OFF by default, per the owner. Override per-load with
 * ?subs=1 / ?subs=0; the choice sticks in localStorage so it survives a reload.
 * (1998 painted them, so off-by-default is a deliberate departure rather than
 * fidelity — worth a taxonomy entry if the classic edition should differ.)
 */
export function resolveCanvasSubtitles(
  input: InputMode,
  loc: Location | URL = window.location,
  store: Pick<Storage, 'getItem' | 'setItem'> | null = safeLocalStorage(),
): boolean {
  const params = new URLSearchParams(loc.search);
  const explicit = params.get('subs');
  if (explicit === '1' || explicit === 'true') {
    store?.setItem('tt.subs', '1');
    return input !== 'touch';
  }
  if (explicit === '0' || explicit === 'false') {
    store?.setItem('tt.subs', '0');
    return false;
  }
  if (input === 'touch') return false;
  return store?.getItem('tt.subs') === '1';
}

function safeLocalStorage(): Pick<Storage, 'getItem' | 'setItem'> | null {
  try {
    return window.localStorage;
  } catch {
    return null;   // Safari private mode throws on access
  }
}
