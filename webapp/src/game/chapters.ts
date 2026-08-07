/**
 * Chapter identifiers.
 *
 * Kept in their own module, free of DOM and engine imports, so routing and
 * tooling can depend on them without pulling in the whole game.
 */

export const INTRO = 0;
export const MAIN_MENU = 1;
export const LANDNAM = 2;
export const KRISTNITAKA = 3;
export const SIDASKIPTI = 4;
export const TYRKJARAN = 5;
export const EXTRO = 6;

/** Index -> GML basename. Index 1 (main menu) reuses the intro chapter. */
export const CHAPTER_NAMES = [
  'intro', 'intro', 'landnam', 'kristnit', 'sidaskip', 'tyrkran', 'extro',
];
