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
