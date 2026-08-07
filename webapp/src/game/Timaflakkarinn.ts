import { World } from '../engine/World';
import { Scene } from '../engine/Scene';
import { AssetLoader } from '../engine/AssetLoader';
import { GMLParser } from '../engine/GMLParser';
import type { SequenceContext, Quantum } from '../engine/Sequence';
import { Sequence, ConditionFlag } from '../engine/Sequence';
import {
  MoveActorQuantum, MoveTerrainQuantum, SetDestinationQuantum,
  SetFlagQuantum, SwitchSceneQuantum,
} from '../engine/Quantums';
import { CursorFace } from '../engine/ActorFace';
import { StateController, MOVING } from './StateController';
import { stopAllAudio } from '../engine/ActorMouth';
import { getLogEntries, onLogUpdate, formatTime, gameLog } from '../engine/GameLog';
import { SaveScene, type MenuResult } from './SaveScene';
import { serialize as serializeSave, restore as restoreSave } from './SaveSerializer';
import type { SaveData } from './SaveStore';
import { prewarmChapter } from './AssetPrewarm';
import { ChapterScopes } from './ChapterScopes';
import { playBackstory } from './Backstory';
import { askVolvaName } from './GuessDialog';

import {
  INTRO, MAIN_MENU, LANDNAM, KRISTNITAKA, SIDASKIPTI, TYRKJARAN, EXTRO,
  CHAPTER_NAMES,
} from './chapters';

/** Web-playable derivative of the disc's INTRO.AVI (Cinepak won't decode in browsers). */
const BACKSTORY_SRC = '/video/INTRO.mp4';

// Re-exported so existing importers of this module keep working.
export { INTRO, MAIN_MENU, LANDNAM, KRISTNITAKA, SIDASKIPTI, TYRKJARAN, EXTRO };

// === Debug scene jumping ===
//
// The flow tree's scene buttons used to run s_always + s_prepare and switch the
// world to the scene. Both prepare sequences only load and prepare *faces*
// (they are PrepareQuantums throughout), so the jump raised the background and
// nothing else: the moving cast — vifill, karli, the NPCs — stayed attached to
// whatever terrain they were last on, which after a jump out of another chapter
// is no terrain in this scene at all.
//
// In play, arrival is never bare. Every scene is entered by a sequence that
// also runs MoveActorQuantums (attach the cast to this scene's terrains),
// MoveTerrainQuantums (bring conversation terrains along), a SetFlagQuantum for
// f_CurrentScene, and SetDestinationQuantums that walk everyone to their marks
// — see s_Ingolfshofdi2Hjorleifshofdi in landnam.gml.
//
// So rather than hand-author a jump, the debug jump replays the game's own
// arrival sequence, keeping the quantums that *establish* state and dropping
// the ones that *perform* it (speech, fades, waits, music, scene switches).
// Dev mode therefore lands in a state the engine itself can produce.

/**
 * Quantums the debug jump replays. Deliberately narrow: these four are the
 * whole of "where things are" — terrain attachment, terrain-to-scene moves,
 * flags, and final standing positions. Everything else in an arrival sequence
 * is theatre and is skipped.
 */
const STATE_QUANTA = [
  MoveActorQuantum,
  MoveTerrainQuantum,
  SetFlagQuantum,
  SetDestinationQuantum,
] as const;

/** True if this quantum establishes state rather than performing it. */
export function isStateQuantum(q: unknown): boolean {
  return STATE_QUANTA.some(C => q instanceof C);
}

/** The state-establishing quantums of a sequence, in authored order. */
export function stateQuanta(seq: Sequence): Quantum[] {
  return seq.quanta.filter(isStateQuantum);
}

/**
 * How well a sequence works as an arrival path into `scene`.
 *
 * `moveInto` — actors this sequence attaches to a terrain of the target scene.
 *   The load-bearing term: a sequence that switches to the scene but populates
 *   nothing (a prepare sequence, a `s_To<Scene>44` fade) scores zero here.
 * `travel` — the chapter's own naming for a walk between two scenes,
 *   `s_<From>2<To>` (sometimes with a trailing variant digit). When one exists
 *   it is always the cleanest arrival, so it outranks a fatter cutscene.
 * `kept` — total state quantums, as a last tie-break.
 */
export function arrivalScore(seq: Sequence, scene: Scene): {
  travel: boolean; moveInto: number; kept: number;
} {
  const suffix = scene.name.replace(/^s_/, '');
  const moveInto = seq.quanta.filter(
    q => q instanceof MoveActorQuantum && q.terrain?.scene === scene
  ).length;
  return {
    travel: new RegExp(`2${suffix}\\d*$`).test(seq.name) && moveInto > 0,
    moveInto,
    kept: stateQuanta(seq).length,
  };
}

/**
 * Pick the sequence the game itself uses to arrive in `scene`: any sequence
 * that switches the world to it, best-scoring first. Returns null when the
 * chapter has none, which the caller must report rather than hide.
 */
export function findArrivalSequence(objects: Iterable<any>, scene: Scene): Sequence | null {
  const ranked: { seq: Sequence; score: ReturnType<typeof arrivalScore> }[] = [];
  for (const obj of objects) {
    if (!(obj instanceof Sequence)) continue;
    if (!obj.quanta.some(q => q instanceof SwitchSceneQuantum && q.scene === scene)) continue;
    ranked.push({ seq: obj, score: arrivalScore(obj, scene) });
  }
  if (ranked.length === 0) return null;
  // Stable sort keeps parse order as the final tie-break.
  ranked.sort((a, b) =>
    Number(b.score.travel) - Number(a.score.travel) ||
    b.score.moveInto - a.score.moveInto ||
    b.score.kept - a.score.kept
  );
  return ranked[0].seq;
}

export class Timaflakkarinn {
  world: World;
  loader: AssetLoader;
  parser: GMLParser;
  /**
   * Every chapter's names, each in its own scope, resolved strictly. There is
   * no global union any more: it kept only the *last* definition of each shared
   * name, and 90 of the 111 container keys common to all four main chapters
   * differ between them — `s_begin`, `s_always` and `s_prepare` included — so
   * returning to an already-parsed chapter ran another chapter's sequences.
   *
   * Quantums bind their operands at parse time and never consult a scope at
   * runtime, so scoping the by-name lookups is the whole of the fix. See
   * `ChapterScopes` for why there is deliberately no shared fallback scope.
   */
  scopes = new ChapterScopes();

  /** The StateController each chapter declared; `sc` is redefined per chapter. */
  private chapterControllers: (StateController | null)[] = new Array(7).fill(null);

  currentScreen = INTRO;
  private parsed = new Array(7).fill(false);
  private running = false;
  private blackScene: Scene;
  private fastForward = false;
  private chapterGeneration = 0;
  saveScene: SaveScene;
  private menuOpen = false;

  // State controller (created during GML parsing)
  private stateController: StateController | null = null;

  /** Declared by <BeginningScene>. Recorded for reference; never auto-displayed. */
  private beginningScene: Scene | null = null;

  // Cursors
  private normalCursor: CursorFace;
  private hiliteCursor: CursorFace;

  // Debug panel
  private debugPanel: HTMLDivElement | null = null;
  private debugSeqList: HTMLDivElement | null = null;
  private debugSkipBtn: HTMLButtonElement | null = null;
  private debugLogDiv: HTMLDivElement | null = null;
  private debugClock: HTMLSpanElement | null = null;

  // UI callbacks
  onLoadingProgress?: (text: string, percent: number) => void;

  constructor(
    canvas: HTMLCanvasElement,
    private resourcePath: string,
    private gmlPath: string,
    /** Debug panel, sequence list and log. Off in the play deployment. */
    private debug: boolean = false
  ) {
    this.world = new World(canvas);
    this.loader = new AssetLoader(resourcePath);
    // Silent 1x1/null fallbacks are why five hardcoded PNGs went unnoticed for
    // years. Surface them in the debug deployment.
    this.loader.warnOnMissing = debug;
    this.parser = new GMLParser(this.loader, this.world, resourcePath, gmlPath);

    this.blackScene = new Scene('blackScene');
    this.blackScene.backgroundColor = { r: 0, g: 0, b: 0 };

    this.normalCursor = new CursorFace('bendill_normal', '\\common\\bendill1');
    this.hiliteCursor = new CursorFace('bendill_hilite', '\\common\\bendill2');

    this.saveScene = new SaveScene(this.world, this.loader, resourcePath);

    // Wire up asset loading progress
    this.loader.onProgress = (loaded, total) => {
      const pct = Math.round((loaded / total) * 100);
      this.onLoadingProgress?.(`Hleð inn eignum... ${loaded}/${total}`, pct);
    };

    // Wire up parser callbacks
    this.parser.onThemeFinished = () => this.themeFinished();
    // Recorded, not displayed. Switching to it during parsing put the ship on
    // screen for ~1s before the opening scroll — a flash the 1999 engine never
    // had, because its parser has no BeginningScene case at all. What is shown
    // stays the business of s_always / s_prepare / s_begin.
    this.parser.onBeginningScene = (scene) => {
      this.beginningScene = scene;
    };

    this.parser.onGuess = async () => {
      const container = document.getElementById('game-container');
      if (!container) return;
      const { sequence, entered } = await askVolvaName(container);
      gameLog('GAME', `volva guess "${entered}" -> ${sequence}`, this.world.pulser.elapsed);
      await this.performSequence(sequence);
    };

    this.parser.stateControllerSetup = (_name, sc) => {
      this.stateController = sc;
      sc.performSequence = (name, wait) => {
        if (wait) {
          this.performSequence(name);
        } else {
          const seq = this.lookup<Sequence>(name);
          if (seq) seq.perform(this.getSequenceContext());
        }
      };
      sc.setCursorFace = (n) => this.setCursorFace(n);
    };

    // Wire up world events — delegate to StateController (or SaveScene if menu open)
    this.world.onActorClicked = (actor, button) => {
      if (this.menuOpen) {
        this.saveScene.handleClick(actor, button);
      } else {
        this.stateController?.actorClicked(actor, button);
      }
    };

    this.world.onMouseClicked = (x, y, button) => {
      if (this.menuOpen) return; // SaveScene heeds only actor clicks
      if (button === 2) {
        this.stateController?.doRightButton();
      } else {
        this.stateController?.handleMouseEvent(x, y, button);
      }
    };

    this.world.onKeyDown = (key) => this.handleKeyDown(key);

    // Note: actor.onEntered/onExited are called by World directly;
    // these world-level callbacks only matter for StateController dispatch.
    this.world.onActorEntered = (actor) => {
      if (!this.menuOpen) this.stateController?.actorEntered(actor);
    };

    this.world.onActorExited = (actor) => {
      if (!this.menuOpen) this.stateController?.actorExited(actor);
    };

    // Attach cursor + UI overlay on scene change
    this.world.onSceneChanged = (scene) => {
      if (scene) {
        scene.cursorFace = this.normalCursor;
        this.stateController?.worldChangesScene(scene);
      }
    };

    if (this.debug) this.createDebugPanel();
  }

  /**
   * @param entryChapter  Boot straight into this chapter, skipping the intro
   *   and main menu. Used by URL routing (/chapter2 etc). Omit for the normal
   *   intro -> menu -> Landnám flow.
   */
  async start(entryChapter?: number): Promise<void> {
    this.running = true;
    this.world.start();

    this.onLoadingProgress?.('Þáttar intro...', 0);
    this.world.setCurrentScene(this.blackScene);

    // Resume audio on first interaction
    const resumeHandler = async () => {
      await this.loader.resumeAudio();
      document.removeEventListener('click', resumeHandler);
      document.removeEventListener('keydown', resumeHandler);
    };
    document.addEventListener('click', resumeHandler);
    document.addEventListener('keydown', resumeHandler);

    // Load cursors and SaveScene assets
    await Promise.all([
      this.normalCursor.prepare(this.loader),
      this.hiliteCursor.prepare(this.loader),
      this.saveScene.prepare(this.loader),
    ]);

    // Deep link: boot directly into a chapter, bypassing intro and menu.
    // Safe as an *entry* point because only this chapter gets parsed. Jumping
    // between chapters in one session is a separate matter — see the container
    // scoping note in specs/001.
    if (entryChapter !== undefined && entryChapter !== INTRO) {
      await this.startChapter(entryChapter);
      return;
    }

    // Parse and play intro (with skip button)
    const skipBtn = document.createElement('button');
    skipBtn.textContent = 'Sleppa intro';
    skipBtn.style.cssText = 'position:absolute;top:10px;right:10px;z-index:100;padding:8px 16px;font:14px serif;cursor:pointer;background:#333;color:#ccc;border:1px solid #666;border-radius:4px;';
    document.getElementById('game-container')?.appendChild(skipBtn);

    let introSkipped = false;
    const skipPromise = new Promise<void>(resolve => {
      skipBtn.onclick = () => { introSkipped = true; resolve(); };
    });
    const introPromise = this.startChapter(INTRO);
    await Promise.race([introPromise, skipPromise]);

    if (introSkipped) {
      this.stopAllSequences();
      stopAllAudio();
    }
    skipBtn.remove();

    // Kynning — the 1999 disc's INTRO.AVI, which no GML references and which the
    // web recreation therefore never played. Runs after the credits, before the
    // menu. Never blocks: a missing or unplayable file just moves on.
    await this.playBackstory();

    // Aðalvalmynd
    const choice = await this.openMenu('main');
    if (choice.kind === 'newGame') {
      await this.startChapter(LANDNAM);
    } else if (choice.kind === 'loadSlot') {
      await this.loadFromSave(choice.data);
    } else if (choice.kind === 'quit') {
      this.quit();
    }
  }

  /** Opnar SaveScene og bíður niðurstöðu. Sér um að freeze-a/thawa pulser eftir mode. */
  private async openMenu(mode: 'main' | 'pause'): Promise<MenuResult> {
    this.stopAllSequences();
    if (mode === 'main') {
      stopAllAudio();
      this.world.pulser.clear();
    } else {
      this.world.pulser.freeze();
    }

    const prevScene = mode === 'pause' ? this.world.currentScene : null;
    this.menuOpen = true;
    this.world.setCurrentScene(this.saveScene.scene);

    const result = await this.saveScene.open(mode);

    this.menuOpen = false;
    if (mode === 'pause') {
      // Endurheimta sviðið nema þegar caller mun skipta (loadSlot, quit)
      const willSwitchScene = result.kind === 'loadSlot' || result.kind === 'quit';
      if (!willSwitchScene && prevScene) {
        this.world.setCurrentScene(prevScene);
      }
      this.world.pulser.thaw();
    }
    return result;
  }

  async loadFromSave(data: SaveData): Promise<void> {
    this.menuOpen = false;
    this.world.setCurrentScene(this.blackScene);
    await restoreSave(this, data);
  }

  private quit(): void {
    this.running = false;
    try { window.close(); } catch {}
    document.body.innerHTML = '<div style="color:#ccc;font-family:serif;font-size:24px;padding:40px;background:#000;height:100vh;">Þú mátt loka glugganum.</div>';
  }

  async parseStoryPage(screen: number): Promise<void> {
    if (this.parsed[screen]) return;

    // Strict: the parser sees this chapter's names and no others. The old
    // fallback to a global union bound this chapter's quantums to whatever the
    // previously-parsed chapter happened to define under the same name, and
    // that binding is permanent — no amount of runtime scoping undoes it.
    const objects = this.scopes.open(screen);
    this.parser.setContainer({
      objects,
      get: (name: string) => objects.get(name),
      put: (name: string, obj: any) => { objects.set(name, obj); },
    });
    const name = CHAPTER_NAMES[screen];

    this.onLoadingProgress?.(`Þáttar ${name}...`, 5);
    await this.parser.parseGMLFile(name);

    // <StateController name="sc"> is declared once per chapter; the parser
    // callback overwrote this.stateController while parsing. Remember whose.
    this.chapterControllers[screen] = this.stateController;

    // Forhleða allar PNG-myndir kaflans (audio er áfram lazy)
    await prewarmChapter(objects, this.loader, (loaded, total) => {
      const pct = total > 0 ? Math.round(loaded / total * 95) + 5 : 100;
      this.onLoadingProgress?.(`Forhleður myndir ${loaded}/${total}`, pct);
    });

    this.onLoadingProgress?.(`${name} hlaðið`, 100);
    this.parsed[screen] = true;
  }

  /**
   * Play the backstory film. Audio from the game is stopped first so the
   * film's own soundtrack is not competing with a lingering theme.
   */
  private async playBackstory(): Promise<void> {
    const container = document.getElementById('game-container');
    if (!container) return;

    stopAllAudio();
    const result = await playBackstory({
      container,
      src: BACKSTORY_SRC,
      onUnavailable: why => gameLog('WARN', `backstory unavailable: ${why}`, this.world.pulser.elapsed),
    });
    gameLog('GAME', `backstory ${result}`, this.world.pulser.elapsed);
  }

  private getSequenceContext(): SequenceContext {
    return {
      container: this.scopes.objects() ?? new Map<string, any>(),
      world: this.world,
      fastForward: this.fastForward,
    };
  }

  /**
   * Resolve a GML name in the current chapter, and only there — the same
   * guarantee the 1999 engine got by emptying its container at every chapter
   * transition. A name this chapter does not declare resolves to nothing;
   * silently borrowing another chapter's object under that name is the bug.
   */
  private lookup<T = any>(name: string): T | undefined {
    return this.scopes.lookup<T>(name);
  }

  /** Objects declared by the chapter now current. */
  private chapterValues(): Iterable<any> {
    return this.scopes.values();
  }

  /**
   * Every parsed object across every chapter. Deliberately unscoped: a sequence
   * still performing in a chapter we have left must remain stoppable.
   */
  private allNamedObjects(): Generator<[string, any]> {
    return this.scopes.all();
  }

  /** Make `chapter` current, restoring the StateController it declared. */
  setCurrentChapter(chapter: number): void {
    this.currentScreen = chapter;
    this.scopes.current = chapter;
    const sc = this.chapterControllers[chapter];
    if (sc && sc !== this.stateController) {
      this.stateController = sc;
      gameLog('GAME', `StateController → ${CHAPTER_NAMES[chapter]}`, this.world.pulser.elapsed);
    }
  }

  async performSequence(name: string): Promise<void> {
    const seq = this.lookup<Sequence>(name);
    if (!seq) {
      console.warn(`Sequence not found: ${name}`);
      return;
    }
    this.updateDebugPanel();
    await seq.perform(this.getSequenceContext());
    this.updateDebugPanel();
  }

  /** Start a game chapter */
  async startChapter(chapter: number): Promise<void> {
    const gen = ++this.chapterGeneration;
    gameLog('GAME', `startChapter ${chapter} (${CHAPTER_NAMES[chapter]})`, this.world.pulser.elapsed);
    this.stopAllSequences();
    stopAllAudio();
    this.world.pulser.clear();
    // Point name resolution at this chapter before anything can look a name up.
    this.setCurrentChapter(chapter);
    this.world.setCurrentScene(this.blackScene);

    await this.parseStoryPage(chapter);
    if (this.chapterGeneration !== gen) return; // interrupted
    // Re-apply now the chapter's own StateController is known: returning to an
    // already-parsed chapter would otherwise keep the last-parsed chapter's.
    this.setCurrentChapter(chapter);
    this.updateDebugPanel();

    // Run chapter sequences — s_always, s_prepare, s_begin
    await this.performSequence('s_always');
    if (this.chapterGeneration !== gen) return;
    await this.performSequence('s_prepare');
    if (this.chapterGeneration !== gen) return;
    await this.performSequence('s_begin');
  }

  private themeFinished(): void {
    const next = this.currentScreen + 1;
    const gen = this.chapterGeneration;
    gameLog('GAME', `themeFinished for chapter ${this.currentScreen}`, this.world.pulser.elapsed);
    const doEnd = async () => {
      await this.performSequence('s_end');
      if (this.chapterGeneration !== gen) return;
      await this.performSequence('s_final');
      if (this.chapterGeneration !== gen) return;
      if (next <= EXTRO) {
        await this.startChapter(next);
      }
    };
    doEnd();
  }

  setCursorFace(n: number): void {
    const scene = this.world.currentScene;
    if (!scene) return;
    const cursor = n === 2 ? this.hiliteCursor : this.normalCursor;
    cursor.setLocation(this.world.mouseX, this.world.mouseY);
    scene.cursorFace = cursor;
  }

  /**
   * Jump directly to a scene (debug). Prepares it, then replays the game's own
   * arrival sequence for its state-establishing quantums so the scene is
   * populated and walkable rather than an empty backdrop.
   */
  async jumpToScene(sceneName: string): Promise<void> {
    const scene = this.lookup<Scene>(sceneName);
    if (!scene) {
      console.warn(`Scene not found: ${sceneName}`);
      return;
    }
    const gen = ++this.chapterGeneration;
    const t = () => this.world.pulser.elapsed;
    this.stopAllSequences();
    stopAllAudio();
    this.world.pulser.clear();
    this.world.setCurrentScene(this.blackScene);

    // Before s_prepare, not after: s_prepare's q_CheckPrepare branches on
    // f_CurrentScene to decide which scene's faces to load.
    this.setCurrentSceneFlag(sceneName);

    // Run s_always (prepares music etc) and s_prepare (prepares scene assets)
    await this.performSequence('s_always');
    if (this.chapterGeneration !== gen) return;
    await this.performSequence('s_prepare');
    if (this.chapterGeneration !== gen) return;

    // Prepare loads faces and nothing more. Populate the scene the way the
    // game does — see the comment on findArrivalSequence above.
    const arrival = findArrivalSequence(this.chapterValues(), scene);
    if (arrival) {
      const n = await this.replayArrivalState(arrival);
      gameLog('GAME', `jump state from ${arrival.name} (${n} state quantums)`, t());
    } else {
      gameLog('ERR', `no arrival sequence switches to ${sceneName} — scene may be unpopulated`, t());
    }
    if (this.chapterGeneration !== gen) return;

    await this.ensurePlayerInScene(scene);

    // Switch to target scene and give player control
    this.world.setCurrentScene(scene);
    this.stateController?.setState(MOVING);
    gameLog('GAME', `jumpToScene ${sceneName}`, t());
  }

  /**
   * Execute a sequence's state-establishing quantums, in order, skipping the
   * rest. `tunnel()` throughout: it is the engine's own fast-forward path, so a
   * SetDestinationQuantum lands the actor on its mark instead of walking there,
   * and the other three behave exactly as they do in play.
   */
  private async replayArrivalState(seq: Sequence): Promise<number> {
    const ctx = this.getSequenceContext();
    let applied = 0;
    for (const q of stateQuanta(seq)) {
      try {
        await q.tunnel(ctx);
        applied++;
      } catch (e) {
        gameLog('ERR', `arrival quantum failed: ${e}`, this.world.pulser.elapsed);
      }
    }
    return applied;
  }

  /**
   * Last resort when the chosen arrival sequence did not bring the player
   * along: any authored MoveActorQuantum that puts the player on a terrain of
   * this scene. Still the game's own data — no invented coordinates. If none
   * exists, say so rather than leave the owner wondering where he is.
   */
  private async ensurePlayerInScene(scene: Scene): Promise<void> {
    const player = this.stateController?.mainActor;
    const t = () => this.world.pulser.elapsed;
    if (!player) {
      gameLog('ERR', `no player actor set — ${scene.name} is not playable`, t());
      return;
    }
    if (player.currentTerrain?.scene === scene) return;

    for (const obj of this.chapterValues()) {
      if (obj instanceof MoveActorQuantum && obj.actor === player &&
          obj.terrain?.scene === scene && obj.hasLocation) {
        await obj.tunnel(this.getSequenceContext());
        gameLog('GAME', `placed ${player.name} via ${(obj as any).gmlName ?? 'MoveActorQuantum'}`, t());
        return;
      }
    }
    gameLog('ERR', `${player.name} is not on a terrain of ${scene.name} — jump is not walkable`, t());
  }

  /**
   * Set the chapter's "which scene am I in" flag from the target scene name.
   * s_prepare branches on it, so it must be right before s_prepare runs.
   *
   * Three chapters name the pair f_CurrentScene / q_Current<Scene>; Kristnitaka
   * names it f_CS / q_CS<Scene> (kristnit.gml:166-175), which the old
   * f_CurrentScene-only lookup silently missed. The quantum carries its own
   * flag reference, so finding the quantum is enough.
   */
  private setCurrentSceneFlag(sceneName: string): void {
    const suffix = sceneName.replace(/^s_/, '');
    for (const quantumName of [`q_Current${suffix}`, `q_CS${suffix}`]) {
      const quantum = this.lookup<any>(quantumName);
      if (!(quantum instanceof SetFlagQuantum)) continue;
      const flag = quantum.flag as ConditionFlag;
      flag.value = quantum.value;
      gameLog('GAME', `${flag.name} = ${flag.value} (${quantumName})`, this.world.pulser.elapsed);
      return;
    }
    gameLog('ERR', `no q_Current/q_CS quantum for ${sceneName} — s_prepare may prepare the wrong scene`,
      this.world.pulser.elapsed);
  }

  stopAllSequences(): void {
    for (const [, obj] of this.allNamedObjects()) {
      if (obj instanceof Sequence && obj.isPerforming()) {
        obj.stopPerforming();
      }
    }
  }

  private handleKeyDown(key: string): void {
    // Lyklar fara í valmynd ef hún er opin
    if (this.menuOpen) {
      this.saveScene.handleKeyDown(key);
      return;
    }

    // Space: cycle state via StateController
    if (key === ' ') {
      this.stateController?.doRightButton();
    }

    // Enter: fast-forward sequences
    if (key === 'Enter') {
      this.fastForward = true;
      for (const [, obj] of this.allNamedObjects()) {
        if (obj instanceof Sequence && obj.isPerforming()) {
          obj.fastForward();
        }
      }
    }

    // F1: open pause menu
    if (key === 'F1') {
      this.openPauseMenu();
    }
  }

  private async openPauseMenu(): Promise<void> {
    if (this.menuOpen) return;
    // Aðeins leyfa að opna ef leikur er í MOVING
    const inMoving = (this.stateController as any)?.state === 0;
    if (!inMoving) {
      gameLog('GAME', 'Cannot pause now (not in MOVING)', this.world.pulser.elapsed);
      return;
    }

    const result = await this.openMenu('pause');
    if (result.kind === 'resume') {
      // Already restored by openMenu
    } else if (result.kind === 'saveSlot') {
      const data = serializeSave(this, result.name);
      await this.saveScene.store.putSlot(result.index, data);
      // Skila í leik (scene was already restored, but pulser is thawed)
    } else if (result.kind === 'loadSlot') {
      await this.loadFromSave(result.data);
    } else if (result.kind === 'quit') {
      this.quit();
    }
  }

  // === Debug Panel ===

  private createDebugPanel(): void {
    // Side panel (controls, flow tree, active sequences)
    const panel = document.createElement('div');
    panel.style.cssText = 'position:fixed;right:0;top:0;width:280px;bottom:180px;background:#1a1a2e;color:#aaa;font:11px monospace;z-index:200;border-left:1px solid #333;overflow-y:auto;padding:8px;';

    panel.innerHTML = `
      <div style="font-size:13px;color:#eee;margin-bottom:4px;">Debug <span id="dbg-clock" style="color:#4af;float:right;">0:00.000</span></div>
      <div style="display:flex;gap:2px;margin-bottom:4px;">
        <button id="dbg-skip" style="flex:1;padding:3px;background:#600;color:#fff;border:1px solid #900;cursor:pointer;font:10px monospace;">Skip</button>
        <button id="dbg-unfreeze" style="flex:1;padding:3px;background:#060;color:#fff;border:1px solid #090;cursor:pointer;font:10px monospace;">MOVING</button>
        <button id="dbg-overlay" style="flex:1;padding:3px;background:#333;color:#ccc;border:1px solid #555;cursor:pointer;font:10px monospace;">Boxes</button>
      </div>
      <div style="color:#888;margin:4px 0 2px;">Flow:</div>
      <div id="dbg-tree" style="font-size:10px;line-height:1.6;margin-bottom:4px;"></div>
      <div style="color:#888;margin:4px 0 2px;">Active:</div>
      <div id="dbg-seqs"></div>
      <div style="color:#888;margin:4px 0 2px;">Pulser: <span id="dbg-pulser" style="color:#6a6;">0 entries</span></div>
    `;
    document.body.appendChild(panel);

    // Bottom log bar (full width)
    const logBar = document.createElement('div');
    // Collapsed by default. Expanded it eats 180px, and with the canvas at a
    // fixed 800x600 that clips the top of the game — you lose actors walking in
    // along the skyline, which is exactly when you want to be watching.
    const LOG_COLLAPSED_H = 24, LOG_EXPANDED_H = 180;
    logBar.style.cssText = `position:fixed;left:0;right:0;bottom:0;height:${LOG_COLLAPSED_H}px;background:#111;color:#aaa;font:10px monospace;z-index:200;border-top:1px solid #333;display:flex;flex-direction:column;transition:height .12s;`;
    logBar.innerHTML = `
      <div id="dbg-logbar-head" style="flex:0 0 auto;padding:3px 8px;color:#888;border-bottom:1px solid #222;cursor:pointer;user-select:none;" title="Sýna/fela annál">
        <span id="dbg-log-caret">\u25B8</span> Log
        <span id="dbg-clock2" style="color:#4af;float:right;">0:00.000</span>
      </div>
      <div id="dbg-log" style="flex:1 1 0;overflow-y:auto;padding:2px 8px;line-height:1.35;display:none;"></div>
    `;
    document.body.appendChild(logBar);

    this.debugPanel = panel;
    this.debugSeqList = panel.querySelector('#dbg-seqs');
    this.debugLogDiv = logBar.querySelector('#dbg-log');
    this.debugClock = panel.querySelector('#dbg-clock');
    // Second clock ref in log bar
    (this as any)._debugClock2 = logBar.querySelector('#dbg-clock2');

    // Skip button
    // Log expand/collapse. Also drives the body height reservation in
    // index.html, so the canvas gets the space back when the log is hidden.
    const logHead = logBar.querySelector('#dbg-logbar-head') as HTMLElement;
    const logBody = logBar.querySelector('#dbg-log') as HTMLElement;
    const caret = logBar.querySelector('#dbg-log-caret') as HTMLElement;
    let logOpen = false;
    const applyLogState = () => {
      logBar.style.height = `${logOpen ? LOG_EXPANDED_H : LOG_COLLAPSED_H}px`;
      logBody.style.display = logOpen ? 'block' : 'none';
      caret.textContent = logOpen ? '\u25BE' : '\u25B8';
      document.documentElement.dataset.dbgLog = logOpen ? 'open' : 'closed';
      if (logOpen && this.debugLogDiv) this.debugLogDiv.scrollTop = this.debugLogDiv.scrollHeight;
    };
    logHead.onclick = () => { logOpen = !logOpen; applyLogState(); };
    applyLogState();

    this.debugSkipBtn = panel.querySelector('#dbg-skip');
    this.debugSkipBtn!.onclick = () => {
      this.stopAllSequences();
    };

    // Force MOVING button
    (panel.querySelector('#dbg-unfreeze') as HTMLButtonElement).onclick = () => {
      this.stateController?.setState(0); // MOVING
    };

    // Debug overlay toggle
    const overlayBtn = panel.querySelector('#dbg-overlay') as HTMLButtonElement;
    overlayBtn.onclick = () => {
      Scene.debugOverlay = !Scene.debugOverlay;
      overlayBtn.style.background = Scene.debugOverlay ? '#440' : '#333';
    };

    // Build game flow tree
    this.buildFlowTree(panel.querySelector('#dbg-tree') as HTMLDivElement);

    // Log panel — auto-scroll on new entries
    onLogUpdate(() => this.renderLog());

    // Update panel periodically (clock, active seqs, pulser info)
    setInterval(() => this.updateDebugPanel(), 200);
  }

  private renderLog(): void {
    if (!this.debugLogDiv) return;
    const entries = getLogEntries();
    const wasAtBottom = this.debugLogDiv.scrollTop + this.debugLogDiv.clientHeight >= this.debugLogDiv.scrollHeight - 20;

    // Only render last 100 visible
    const visible = entries.slice(-100);
    const tagColors: Record<string, string> = {
      SEQ: '#5f5', ERR: '#f55', AUDIO: '#fa5', GAME: '#5af', PULSE: '#a8a',
    };
    this.debugLogDiv.innerHTML = visible.map(e => {
      const tc = tagColors[e.tag] ?? '#888';
      const time = `<span style="color:#555;">${formatTime(e.time)}</span>`;
      const tag = `<span style="color:${tc};">[${e.tag}]</span>`;
      return `<div>${time} ${tag} ${this.escapeHtml(e.msg)}</div>`;
    }).join('');

    if (wasAtBottom) {
      this.debugLogDiv.scrollTop = this.debugLogDiv.scrollHeight;
    }
  }

  private escapeHtml(s: string): string {
    return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  private updateDebugPanel(): void {
    if (!this.debugSeqList) return;

    // Clock
    const timeStr = formatTime(this.world.pulser.elapsed);
    if (this.debugClock) {
      this.debugClock.textContent = timeStr;
    }
    const clock2 = (this as any)._debugClock2 as HTMLSpanElement | null;
    if (clock2) {
      clock2.textContent = timeStr;
    }

    // Pulser entry count
    const pulserSpan = this.debugPanel?.querySelector('#dbg-pulser');
    if (pulserSpan) {
      const count = (this.world.pulser as any).entries?.length ?? 0;
      const frozen = (this.world.pulser as any).frozen ? ' (frozen)' : '';
      pulserSpan.textContent = `${count} entries${frozen}`;
    }

    // Active sequences
    const active: string[] = [];
    for (const [name, obj] of this.allNamedObjects()) {
      if (obj instanceof Sequence && obj.isPerforming()) {
        const cur = (obj as any).currentQuantum;
        const curName = cur?.gmlName ?? cur?.constructor?.name ?? '';
        active.push(`▶ ${name} → ${curName}`);
      }
    }
    this.debugSeqList.innerHTML = active.length
      ? active.map(s => `<div style="color:#5f5;">${s}</div>`).join('')
      : '<div style="color:#555;">None</div>';
  }

  private static readonly FLOW_TREE = [
    {
      id: INTRO, name: 'Intro', gml: 'intro',
      scenes: ['s_Intro', 's_Black'],
      endTrigger: 's_end → q_Fin',
    },
    {
      id: LANDNAM, name: 'Landnám', gml: 'landnam',
      scenes: ['s_Skipingolfs', 's_Ingolfshofdi', 's_Hjorleifshofdi', 's_SudurThjorsa', 's_NordurThjorsa', 's_Reykjavik', 's_Map', 's_BeginScene'],
      endTrigger: 's_blessingo → q_ThemeFin',
    },
    {
      id: KRISTNITAKA, name: 'Kristnitaka', gml: 'kristnit',
      scenes: ['s_HjaHestasveini', 's_Logberg', 's_HeidnarBudir', 's_KristnarBudir', 's_HjaVolvu', 's_Runir', 's_ErnaRunir', 's_Letur', 's_BeginScene'],
      endTrigger: 's_BeginConvHallur → q_ThemeFin',
    },
    {
      id: SIDASKIPTI, name: 'Siðaskipti', gml: 'sidaskip',
      scenes: ['s_HjaBryta', 's_FyrirUtan', 's_Kirkja', 's_Skrifstofa', 's_Svefnherbergi', 's_Kopavogur', 's_Askur', 's_Map', 's_BeginScene'],
      endTrigger: 's_HannGaetiVeridHja → q_Fin',
    },
    {
      id: TYRKJARAN, name: 'Tyrkjaránið', gml: 'tyrkran',
      scenes: ['s_Kot', 's_UtanHusid', 's_DansktHus', 's_UtanDanskaHusid', 's_Fjaran', 's_Dekkid', 's_Kaetan', 's_UtanHelli', 's_Innihellir', 's_BeginScene'],
      endTrigger: 's_MakaEdalstein → q_Fin',
    },
    {
      id: EXTRO, name: 'Extro', gml: 'extro',
      scenes: ['s_Extro', 's_Black'],
      endTrigger: 's_end → q_Fin → END',
    },
  ];

  private buildFlowTree(div: HTMLDivElement): void {
    const chapters = Timaflakkarinn.FLOW_TREE;
    div.innerHTML = '';

    for (const ch of chapters) {
      const isCurrent = this.currentScreen === ch.id;

      // Chapter header — click to jump to chapter
      const header = document.createElement('div');
      header.style.cssText = `margin:4px 0 2px;cursor:pointer;padding:2px 4px;${isCurrent ? 'color:#fff;font-weight:bold;background:#335;' : 'color:#aaa;'}`;
      header.dataset.ch = String(ch.id);
      header.className = 'dbg-ch';
      header.textContent = `${isCurrent ? '▶ ' : '  '}${ch.name}`;
      header.title = `Hoppa á ${ch.name} (hleður GML og keyrir s_always → s_begin)`;
      header.onclick = () => {
        this.startChapter(ch.id).then(() => this.buildFlowTree(div));
      };
      div.appendChild(header);

      // Scene buttons — click to jump to scene within chapter
      const sceneRow = document.createElement('div');
      sceneRow.style.cssText = 'padding-left:12px;margin-bottom:2px;';
      for (const sceneName of ch.scenes) {
        const btn = document.createElement('span');
        const isActiveScene = this.world.currentScene?.name === sceneName;
        btn.textContent = `◆ ${sceneName}`;
        btn.style.cssText = `display:block;cursor:pointer;padding:1px 4px;color:${isActiveScene ? '#fff' : '#6a6'};${isActiveScene ? 'background:#243;' : ''}`;
        btn.className = 'dbg-scene';
        btn.dataset.scene = sceneName;
        btn.title = `Hoppa á ${sceneName}`;
        btn.onclick = async () => {
          // Ensure chapter is parsed first
          if (!this.parsed[ch.id]) {
            await this.parseStoryPage(ch.id);
          } else if (this.currentScreen !== ch.id) {
            // Chapter is parsed but not current — switch to it without re-running
            // s_begin. setCurrentChapter re-points name resolution and the
            // StateController at this chapter's objects.
            this.stopAllSequences();
            stopAllAudio();
          }
          this.setCurrentChapter(ch.id);
          await this.jumpToScene(sceneName);
          this.buildFlowTree(div);
        };
        sceneRow.appendChild(btn);
      }
      div.appendChild(sceneRow);

      // End trigger
      const endDiv = document.createElement('div');
      endDiv.style.cssText = 'color:#a86;padding-left:12px;font-size:9px;';
      endDiv.textContent = `⏹ ${ch.endTrigger}`;
      div.appendChild(endDiv);
    }

    // Update scene highlighting periodically
    if (!(div as any)._highlightInterval) {
      (div as any)._highlightInterval = setInterval(() => {
        const currentSceneName = this.world.currentScene?.name;
        div.querySelectorAll('.dbg-ch').forEach(el => {
          const chId = parseInt((el as HTMLElement).dataset.ch!);
          const cur = this.currentScreen === chId;
          (el as HTMLElement).style.color = cur ? '#fff' : '#aaa';
          (el as HTMLElement).style.fontWeight = cur ? 'bold' : 'normal';
          (el as HTMLElement).style.background = cur ? '#335' : 'transparent';
          const ch = chapters.find(c => c.id === chId);
          (el as HTMLElement).textContent = `${cur ? '▶ ' : '  '}${ch?.name}`;
        });
        div.querySelectorAll('.dbg-scene').forEach(el => {
          const sName = (el as HTMLElement).dataset.scene;
          const active = sName === currentSceneName;
          (el as HTMLElement).style.color = active ? '#fff' : '#6a6';
          (el as HTMLElement).style.background = active ? '#243' : 'transparent';
        });
      }, 1000);
    }
  }
}
