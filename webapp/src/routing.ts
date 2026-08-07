/**
 * URL <-> chapter routing.
 *
 *   /              -> redirects to /intro
 *   /intro         -> intro
 *   /chapter1..4   -> the four historical chapters
 *   /extro         -> extro
 *
 * Icelandic slugs are accepted as aliases and are what we'd link publicly.
 *
 * The chapter numbers are not invented here: the 1998 content already numbers
 * them, in the theme audio filenames — LANDNAM/1_000.WAV, KRISTNIA/2_000.WAV,
 * SIDASKIA/3_000.WAV, TYRKJARA/4_000.WAV.
 */

import {
  INTRO, LANDNAM, KRISTNITAKA, SIDASKIPTI, TYRKJARAN, EXTRO,
} from './game/chapters';

export interface Route {
  chapter: number;
  /** Canonical path for this chapter — what the address bar should show. */
  path: string;
}

const ROUTES: { slugs: string[]; chapter: number; canonical: string }[] = [
  { slugs: ['intro'],                          chapter: INTRO,       canonical: '/intro' },
  { slugs: ['chapter1', 'landnam'],            chapter: LANDNAM,     canonical: '/chapter1' },
  { slugs: ['chapter2', 'kristnitaka'],        chapter: KRISTNITAKA, canonical: '/chapter2' },
  { slugs: ['chapter3', 'sidaskipti'],         chapter: SIDASKIPTI,  canonical: '/chapter3' },
  { slugs: ['chapter4', 'tyrkjaranid'],        chapter: TYRKJARAN,   canonical: '/chapter4' },
  { slugs: ['extro'],                          chapter: EXTRO,       canonical: '/extro' },
];

export const DEFAULT_PATH = '/intro';

/** Parse a pathname into a route. Returns null for unknown paths. */
export function parseRoute(pathname: string): Route | null {
  const slug = pathname.replace(/^\/+|\/+$/g, '').toLowerCase();
  if (slug === '') return null;
  const hit = ROUTES.find(r => r.slugs.includes(slug));
  return hit ? { chapter: hit.chapter, path: hit.canonical } : null;
}

/** Canonical path for a chapter, for pushing to the address bar. */
export function pathForChapter(chapter: number): string {
  return ROUTES.find(r => r.chapter === chapter)?.canonical ?? DEFAULT_PATH;
}

/** All public routes, for a chapter-select UI or a sitemap. */
export function allRoutes(): Route[] {
  return ROUTES.map(r => ({ chapter: r.chapter, path: r.canonical }));
}
