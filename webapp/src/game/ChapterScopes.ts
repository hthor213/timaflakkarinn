/**
 * Per-chapter name scopes.
 *
 * The 1999 engine had exactly one `Hashtable` for the whole game
 * (`Timaflakkarinn.screenContainer`), and every chapter's GML was parsed into
 * it — but it *emptied that table* at every screen transition
 * (`Timaflakkarinn.clearContainer`, which calls `unprepare()`, `kill()`,
 * `Groups.clearAll()` and finally `hashtable.clear()`) and re-parsed the next
 * chapter's `.gml` from disk. Returning to an already-visited chapter was
 * possible only through Load-game, and that path re-parses too
 * (`displayScreen2` → `clearContainer` → `parseStoryPage`). So in 1999 exactly
 * one chapter's names existed at any moment.
 *
 * The port kept the single container and dropped the clear, which turns every
 * shared name into a last-parse-wins collision: 90 of the 111 container keys
 * common to all four main chapters resolve to something different depending on
 * which chapter was parsed last, `s_begin` / `s_always` / `s_prepare` among
 * them. Forward-only play never noticed; returning to a chapter runs another
 * chapter's sequences.
 *
 * This class restores the 1999 *guarantee* without paying for the re-parse:
 * each chapter keeps its own map and name resolution is **strict** — a lookup
 * never falls through to another chapter. There is deliberately no shared or
 * "common" scope to fall back on, because the content has nothing to put in
 * one: across all six shipped files the only references that do not resolve
 * inside their own chapter are the four `action_*` reactor *roles* (never
 * object names anywhere) and two known content defects, `q_Ahvarerhjorleifur`
 * and `s_Fjolin`, which no file defines. Even the Þórshamar/cross trade — the
 * story's central object — is entirely intra-chapter: `a_Thorshamar` and
 * `a_Kross` are declared in `kristnit.gml` and nowhere else.
 *
 * The one place that must still see every chapter is `all()`: a sequence left
 * performing in a chapter we have walked away from has to remain stoppable.
 */
export class ChapterScopes {
  private byChapter = new Map<number, Map<string, any>>();

  /** The chapter whose names `lookup`/`values` resolve against. */
  current = 0;

  /**
   * A fresh, empty map for a chapter about to be parsed. Replaces any previous
   * parse of the same chapter, so a re-parse cannot merge with its own ghost.
   */
  open(chapter: number): Map<string, any> {
    const objects = new Map<string, any>();
    this.byChapter.set(chapter, objects);
    return objects;
  }

  /** Has this chapter been parsed into a scope? */
  has(chapter: number): boolean {
    return this.byChapter.has(chapter);
  }

  /** A chapter's own objects, or undefined if it has never been parsed. */
  objects(chapter: number = this.current): Map<string, any> | undefined {
    return this.byChapter.get(chapter);
  }

  /** Resolve a GML name in one chapter and one chapter only. */
  lookup<T = any>(name: string, chapter: number = this.current): T | undefined {
    return this.byChapter.get(chapter)?.get(name) as T | undefined;
  }

  /** Everything the current chapter declared. Empty if it is unparsed. */
  values(chapter: number = this.current): Iterable<any> {
    return this.byChapter.get(chapter)?.values() ?? [];
  }

  /**
   * Every object in every parsed chapter, de-duplicated by identity. Used for
   * the operations that are deliberately global — stopping sequences, the
   * Enter fast-forward, the debug panel's active list — because those must
   * reach a sequence still running in a chapter that is no longer current.
   */
  *all(): Generator<[string, any]> {
    const seen = new Set<any>();
    for (const objects of this.byChapter.values()) {
      for (const [name, obj] of objects) {
        if (seen.has(obj)) continue;
        seen.add(obj);
        yield [name, obj];
      }
    }
  }
}
