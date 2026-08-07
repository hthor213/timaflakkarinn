import { Scene, ScrollingScene } from './Scene';
import { Terrain } from './Terrain';
import { Actor, MovingActor, NO_SCALING, STATIC_SCALING, DYNAMIC_SCALING } from './Actor';
import { StaticActorFace, AnimatedActorFace, TextActorFace, CursorFace } from './ActorFace';
import { SimpleActorMouth, SpeechActorMouth } from './ActorMouth';
import { Sequence, ConditionFlag, Groups } from './Sequence';
import type { Quantum, SequenceContext } from './Sequence';
import * as Q from './Quantums';
import type { AssetLoader } from './AssetLoader';
import type { World } from './World';
import type { Color } from './types';
import { StateController } from '../game/StateController';
import { Inventory } from '../game/Inventory';
import { SentenceContainer } from '../game/SentenceContainer';

/** Named color lookup */
const NAMED_COLORS: Record<string, Color> = {
  white:   { r: 255, g: 255, b: 255 },
  yellow:  { r: 255, g: 255, b: 0   },
  red:     { r: 255, g: 0,   b: 0   },
  blue:    { r: 0,   g: 0,   b: 255 },
  green:   { r: 0,   g: 255, b: 0   },
  cyan:    { r: 0,   g: 255, b: 255 },
  magenta: { r: 255, g: 0,   b: 255 },
  black:   { r: 0,   g: 0,   b: 0   },
};

/**
 * RGB(0,255,0) is the transparency key everywhere in this engine — see
 * `AssetLoader.applyChromaKey`. Text authored in it was the 1998 way of hiding a
 * text actor: it drew as nothing.
 *
 * The test is on the *resolved* colour, not on the attribute spelling, because
 * the content writes the same colour two ways. `a_Karli_acc` (landnam.gml:1632)
 * uses `r="0" g="255" b="0"`; `a_Halldora_acc` (tyrkran.gml:473) uses
 * `color="green"`, and `NAMED_COLORS.green` is the identical triple. Keying off
 * one syntax fixed Karli and left Halldóra flashing green on every line.
 */
export function isChromaKey(c: Color): boolean {
  return c.r === 0 && c.g === 255 && c.b === 0;
}

/**
 * Resolve a `<Text>` element's colour. A named `color=` wins over `r`/`g`/`b`,
 * which default to white — the 1999 precedence. Exported so the regression
 * guard can resolve the real content's colours with the engine's own table
 * rather than a copy of it.
 */
export function resolveTextColor(
  colorName: string,
  r: number, g: number, b: number,
): Color {
  const named = colorName ? NAMED_COLORS[colorName] : undefined;
  return named ? { ...named } : { r, g, b };
}

export interface GameContainer {
  objects: Map<string, any>;
  get(name: string): any;
  put(name: string, obj: any): void;
}

function createContainer(): GameContainer {
  const objects = new Map<string, any>();
  return {
    objects,
    get(name: string) { return objects.get(name); },
    put(name: string, obj: any) { objects.set(name, obj); },
  };
}

/** Parse GML XML files and create game objects */
export class GMLParser {
  container: GameContainer;
  loader: AssetLoader;
  world: World;
  resourcePath: string;
  gmlBasePath: string;

  // Current state controller (set during parsing)
  currentSC: StateController | null = null;

  // Game-specific callbacks
  onThemeFinished?: () => void;
  onBeginningScene?: (scene: Scene) => void;
  /** Völva name puzzle: show the prompt and run the resulting sequence. */
  onGuess?: () => Promise<void>;
  stateControllerSetup?: (name: string, sc: StateController) => void;

  constructor(loader: AssetLoader, world: World, resourcePath: string, gmlBasePath: string) {
    this.container = createContainer();
    this.loader = loader;
    this.world = world;
    this.resourcePath = resourcePath.replace(/\/$/, '');
    this.gmlBasePath = gmlBasePath.replace(/\/$/, '');
  }

  setContainer(container: GameContainer): void {
    this.container = container;
  }

  /** Get a default sequence context for fire-and-forget sequences */
  getDefaultContext(): import('./Sequence').SequenceContext {
    return {
      container: new Map(),
      world: this.world,
      fastForward: false,
    };
  }

  /** Load and parse a GML file */
  async parseGMLFile(name: string): Promise<void> {
    const url = `${this.gmlBasePath}/${name}.gml`;
    const response = await fetch(url);
    if (!response.ok) {
      console.error(`Failed to load GML: ${url}`);
      return;
    }
    // GML files are ISO-8859-1 encoded — decode explicitly
    const buf = await response.arrayBuffer();
    let text = new TextDecoder('iso-8859-1').decode(buf);

    // Remove DOCTYPE (it references local DTD)
    text = text.replace(/<!DOCTYPE[^>]*>/g, '');

    const parser = new DOMParser();
    const doc = parser.parseFromString(text, 'text/xml');
    const root = doc.documentElement;

    if (root.nodeName === 'parsererror' || doc.querySelector('parsererror')) {
      console.error('XML parse error:', root.textContent);
      return;
    }

    await this.parseElements(root);
  }

  private async parseElements(parent: Element): Promise<void> {
    for (const el of Array.from(parent.children)) {
      await this.parseElement(el);
    }
  }

  private async parseElement(el: Element): Promise<void> {
    const tag = el.tagName;
    const name = el.getAttribute('name') || '';
    console.log(`[GML] <${tag}${name ? ` name="${name}"` : ''}>`);
    const c = this.container;

    switch (tag) {
      case 'Scene': {
        const scene = new Scene(attr(el, 'name'));
        if (scene.name === 's_Black') {
          scene.backgroundColor = { r: 0, g: 0, b: 0 };
        }
        c.put(scene.name, scene);
        break;
      }

      case 'ScrollingScene': {
        const scene = new ScrollingScene(attr(el, 'name'));
        scene.realWidth = int(el, 'width', 800);
        scene.realHeight = int(el, 'height', 600);
        scene.leftScrollDist = 325;
        scene.rightScrollDist = 475;
        scene.topScrollDist = 300;
        scene.bottomScrollDist = 450;
        c.put(scene.name, scene);
        break;
      }

      case 'Polygon': {
        const points: number[][] = [];
        for (const pt of Array.from(el.getElementsByTagName('Point'))) {
          points.push([int(pt, 'x'), int(pt, 'y')]);
        }
        c.put(attr(el, 'name'), points);
        break;
      }

      case 'SimplePseudo3DTerrain': {
        const terrain = new Terrain(attr(el, 'name'));
        const scene = c.get(attr(el, 'scene')) as Scene;
        const polygon = c.get(attr(el, 'polygon')) as number[][];
        terrain.setPolygon(polygon || []);
        terrain.zMin = int(el, 'zmin');
        terrain.zMax = int(el, 'zmax');
        terrain.defaultScaling = float(el, 'defaultscaling', 1.0);
        terrain.scrolling = attr(el, 'scrolling', 'true') === 'true';

        const scanline1 = float(el, 'scanline1', 0);
        const scaling2 = float(el, 'scaling2', 0);
        const scanline2 = float(el, 'scanline2', 0);
        if (scanline1 && scaling2) {
          terrain.setScalingParameters(scanline1, scanline2, scaling2);
        }

        if (scene) scene.addTerrain(terrain);
        c.put(terrain.name, terrain);
        break;
      }

      case 'Inventory': {
        const terrain = new Inventory(attr(el, 'name'));
        const scene = c.get(attr(el, 'scene')) as Scene;
        const polygon = c.get(attr(el, 'polygon')) as number[][];
        terrain.setPolygon(polygon || []);
        terrain.zMin = int(el, 'zmin');
        terrain.zMax = int(el, 'zmax');
        if (scene) scene.addTerrain(terrain);
        c.put(terrain.name, terrain);
        break;
      }

      case 'SentenceContainer': {
        const terrain = new SentenceContainer(attr(el, 'name'));
        const sceneName = attr(el, 'scene', '');
        const scene = sceneName ? c.get(sceneName) as Scene : null;
        const polygon = c.get(attr(el, 'polygon')) as number[][];
        terrain.setPolygon(polygon || []);
        terrain.zMin = int(el, 'zmin');
        terrain.zMax = int(el, 'zmax');
        if (scene) scene.addTerrain(terrain);
        c.put(terrain.name, terrain);
        break;
      }

      case 'StaticActorFace': {
        const name = attr(el, 'name');
        const file = attr(el, 'file', '') || attr(el, 'image', '');
        const face = new StaticActorFace(name, file);
        face.xOffset = int(el, 'xoffset', 0);
        face.yOffset = int(el, 'yoffset', 0);
        face.transparent = attr(el, 'transparent', 'true') === 'true';
        face.loader = this.loader;
        face.pulser = this.world.pulser;
        c.put(name, face);
        break;
      }

      case 'TransparentActorFace': {
        // Invisible collision area
        const name = attr(el, 'name');
        const face = new StaticActorFace(name, '');
        face.xOffset = int(el, 'xoffset', 0);
        face.yOffset = int(el, 'yoffset', 0);
        face.frameWidth = int(el, 'width', 1);
        face.frameHeight = int(el, 'height', 1);
        face.bounds.width = face.frameWidth;
        face.bounds.height = face.frameHeight;
        face.transparent = false; // clickable but invisible
        face.prepared = true;
        // Override paint to be invisible
        face.paint = () => {};
        c.put(name, face);
        break;
      }

      case 'CelledAnimated2DActorFace': {
        const name = attr(el, 'name');
        const file = attr(el, 'file');
        const face = new AnimatedActorFace(
          name,
          file,
          int(el, 'count', 1),
          int(el, 'speed', 75),
          int(el, 'repeat', -1),
        );
        face.xOffset = int(el, 'xoffset', 0);
        face.yOffset = int(el, 'yoffset', 0);
        face.random = attr(el, 'random', 'false') === 'true';
        face.loader = this.loader;
        face.pulser = this.world.pulser;
        c.put(name, face);
        break;
      }

      case 'Pseudo3DCollisionBox': {
        c.put(attr(el, 'name'), {
          width: int(el, 'x'),
          height: int(el, 'y'),
          depth: int(el, 'z'),
        });
        break;
      }

      case 'JMFActorMouth': {
        const name = attr(el, 'name');
        const file = attr(el, 'file');
        const mouth = new SimpleActorMouth(name, file);
        mouth.loop = attr(el, 'repeat', 'false') === 'true';
        (mouth as any)._loader = this.loader; // lazy load on start()
        c.put(name, mouth);
        break;
      }

      case 'SpeechActorMouth': {
        const name = attr(el, 'name');
        const file = attr(el, 'file');
        const mouth = new SpeechActorMouth(name, file);
        for (const sent of Array.from(el.getElementsByTagName('Sentence'))) {
          mouth.addSentence(attr(sent, 'text'), int(sent, 'time'));
        }
        // Wire text display via acc attribute (text accumulator actor)
        const accName = attr(el, 'acc', '');
        if (accName) {
          const accActor = c.get(accName) as Actor;
          if (accActor?.currentFace instanceof TextActorFace) {
            mouth.setTextActorFace(accActor.currentFace);
          }
        }
        (mouth as any)._loader = this.loader; // lazy load on start()
        (mouth as any)._pulser = this.world.pulser;
        c.put(name, mouth);
        break;
      }

      case 'Text': {
        const name = attr(el, 'name');
        const textFace = new TextActorFace(name + '_face');
        textFace.setText(attr(el, 'text'));

        textFace.color = resolveTextColor(
          attr(el, 'color', ''),
          int(el, 'r', 255), int(el, 'g', 255), int(el, 'b', 255),
        );

        // Green text drew as nothing in 1999; painting it literally puts a green
        // flash at the top of the screen on every line the speaker says. Two
        // accumulators in the shipped content are chroma green — a_Karli_acc and
        // a_Halldora_acc — so their dialogue was unsubtitled in 1999. Whether
        // that was intended is a remaster question; see docs/known-issues.md.
        // Faithful behaviour is invisible.
        if (isChromaKey(textFace.color)) {
          textFace.transparent = true;
        }

        textFace.highlighted = attr(el, 'hilite', 'true') === 'true';

        const actor = new Actor(name);
        actor.addState('default', textFace, null);
        actor.setLocation(0, -1000, 0);
        actor.saveable = attr(el, 'save', 'true') === 'true';

        const terrainName = attr(el, 'terrain', '');
        if (terrainName) {
          const terrain = c.get(terrainName) as Terrain;
          if (terrain) actor.setTerrain(terrain);
        }

        actor.setState('default');
        c.put(name, actor);
        c.put(name + '_face', textFace);
        break;
      }

      case 'StaticActor': {
        const name = attr(el, 'name');
        const actor = new Actor(name);
        this.parseActorCommon(el, actor);
        c.put(name, actor);
        break;
      }

      case 'MovingActor': {
        const name = attr(el, 'name');
        const actor = new MovingActor(name);
        actor.pulser = this.world.pulser;
        this.parseActorCommon(el, actor);
        if (actor instanceof MovingActor) {
          actor.speed = float(el, 'speed', 75);
        }
        c.put(name, actor);
        break;
      }

      case 'StateController': {
        const name = attr(el, 'name');
        const stateActor = c.get(attr(el, 'stateactor')) as Actor;
        const inventoryActor = c.get(attr(el, 'inventoryactor')) as Actor;
        const textActor = c.get(attr(el, 'textactor')) as Actor;
        const inventoryScene = c.get(attr(el, 'inventory')) as Scene;

        const sc = new StateController(this.world, stateActor, inventoryActor, textActor);
        if (inventoryScene) sc.setInventoryScene(inventoryScene);
        this.currentSC = sc;
        c.put(name, sc);
        this.stateControllerSetup?.(name, sc);
        break;
      }

      case 'ActorMoused': {
        const actor = c.get(attr(el, 'actor')) as Actor;
        const sc = c.get(attr(el, 'listener')) as StateController | null;
        if (actor && sc instanceof StateController) {
          const moving = attr(el, 'moving', '');
          if (moving) sc.setMovingDescription(actor, moving);
          const thf = attr(el, 'thf', '');
          if (thf) sc.setTholfall(actor, thf);
          const looking = attr(el, 'looking', '');
          if (looking) sc.setLookingDescription(actor, looking);
          const talking = attr(el, 'talking', '');
          if (talking) sc.setTalkingDescription(actor, talking);
          const taking = attr(el, 'taking', '');
          if (taking) sc.setTakingDescription(actor, taking);
        }
        break;
      }

      case 'UseText': {
        const actor = c.get(attr(el, 'actor')) as Actor;
        const actor2 = c.get(attr(el, 'actor2')) as Actor;
        const text = attr(el, 'text');
        const sc = c.get(attr(el, 'listener')) as StateController | null;
        if (sc instanceof StateController && actor && actor2 && text) {
          sc.setUsingDescription(actor, actor2, text);
        }
        break;
      }

      case 'ConditionFlag': {
        const flag = new ConditionFlag(attr(el, 'name'));
        flag.saveable = attr(el, 'save', 'true') === 'true';
        c.put(flag.name, flag);
        break;
      }

      case 'SetFlagQuantum': {
        const flag = c.get(attr(el, 'flag')) as ConditionFlag;
        if (flag) {
          c.put(attr(el, 'name'), new Q.SetFlagQuantum(flag, int(el, 'value')));
        }
        break;
      }

      case 'IncrementFlagQuantum': {
        const flag = c.get(attr(el, 'flag')) as ConditionFlag;
        if (flag) c.put(attr(el, 'name'), new Q.IncrementFlagQuantum(flag));
        break;
      }

      case 'DecrementFlagQuantum': {
        const flag = c.get(attr(el, 'flag')) as ConditionFlag;
        if (flag) c.put(attr(el, 'name'), new Q.DecrementFlagQuantum(flag));
        break;
      }

      case 'RandomSetFlagQuantum': {
        const flag = c.get(attr(el, 'flag')) as ConditionFlag;
        if (flag) {
          c.put(attr(el, 'name'), new Q.RandomSetFlagQuantum(flag, int(el, 'low'), int(el, 'high')));
        }
        break;
      }

      case 'PauseQuantum': {
        c.put(attr(el, 'name'), new Q.PauseQuantum(int(el, 'time', 1000)));
        break;
      }

      case 'StateQuantum': {
        const actor = c.get(attr(el, 'actor')) as Actor;
        if (actor) {
          c.put(attr(el, 'name'), new Q.StateQuantum(actor, attr(el, 'state'),
                attr(el, 'wait', 'false') === 'true'));
        }
        break;
      }

      case 'SwitchSceneQuantum': {
        const scene = c.get(attr(el, 'scene')) as Scene;
        if (scene) c.put(attr(el, 'name'), new Q.SwitchSceneQuantum(scene));
        break;
      }

      case 'MoveActorQuantum': {
        const actor = c.get(attr(el, 'actor')) as Actor;
        const terrain = el.hasAttribute('terrain') ? c.get(attr(el, 'terrain')) as Terrain : null;
        const locEl = el.querySelector('Location');
        // hasLocation distinguishes "move to 0,0,0" from "only change terrain"
        const hasLocation = locEl !== null;
        const x = locEl ? int(locEl, 'x') : 0;
        const y = locEl ? int(locEl, 'y') : 0;
        const z = locEl ? int(locEl, 'z') : 0;
        if (actor) {
          c.put(attr(el, 'name'), new Q.MoveActorQuantum(actor, x, y, z, terrain, hasLocation));
        }
        break;
      }

      case 'MoveTerrainQuantum': {
        const terrain = c.get(attr(el, 'terrain')) as Terrain;
        const scene = c.get(attr(el, 'scene')) as Scene;
        if (terrain && scene) c.put(attr(el, 'name'), new Q.MoveTerrainQuantum(terrain, scene));
        break;
      }

      case 'SetDestinationQuantum': {
        const actor = c.get(attr(el, 'actor')) as MovingActor;
        if (actor) {
          c.put(attr(el, 'name'), new Q.SetDestinationQuantum(
            actor, int(el, 'x'), int(el, 'y'),
            attr(el, 'wait', 'false') === 'true',
            el.hasAttribute('speed') ? float(el, 'speed') : null
          ));
        }
        break;
      }

      case 'SetSpeedQuantum': {
        const actor = c.get(attr(el, 'actor')) as MovingActor;
        if (actor) c.put(attr(el, 'name'), new Q.SetSpeedQuantum(actor, float(el, 'speed')));
        break;
      }

      case 'StopActorQuantum': {
        const actor = c.get(attr(el, 'actor')) as MovingActor;
        if (actor) c.put(attr(el, 'name'), new Q.StopActorQuantum(actor));
        break;
      }

      case 'FadeQuantum': {
        const mouth = c.get(attr(el, 'mouth')) as import('./ActorMouth').ActorMouth;
        if (mouth) {
          c.put(attr(el, 'name'), new Q.FadeQuantum(mouth, float(el, 'goal'), float(el, 'speed', 10)));
        }
        break;
      }

      case 'PrepareQuantum': {
        const obj = c.get(attr(el, 'object'));
        if (obj) {
          const doPrepare = attr(el, 'prepare', 'true') === 'true';
          c.put(attr(el, 'name'), new Q.PrepareQuantum(obj, doPrepare, this.loader));
        }
        break;
      }

      case 'CheckConditionQuantum': {
        const flag = c.get(attr(el, 'flag')) as ConditionFlag;
        if (flag) {
          const q = new Q.CheckConditionQuantum(flag,
            attr(el, 'wait', 'false') === 'true');
          // Parse Trigger children
          for (const trigger of Array.from(el.getElementsByTagName('Trigger'))) {
            const value = int(trigger, 'value');
            const seqName = attr(trigger, 'seq');
            const seq = c.get(seqName) as Sequence;
            if (seq) q.addReaction(value, seq);
          }
          c.put(attr(el, 'name'), q);
        }
        break;
      }

      case 'ThemeFinishedQuantum': {
        const self = this;
        c.put(attr(el, 'name'), {
          async execute(_ctx: SequenceContext) { self.onThemeFinished?.(); },
          async tunnel(_ctx: SequenceContext) { self.onThemeFinished?.(); },
          finish() {},
        } as Quantum);
        break;
      }

      case 'GuessQuantum': {
        // The Völva's name puzzle. In 1999 this opened a text prompt and routed
        // the answer to s_GuessCorrect / s_GuessWrong, both of which unfreeze
        // the controller (GuessQuantum.java -> Timaflakkarinn.showDialog2, then
        // Timaflakkarinn.java:549-556). Stubbed out, it froze Kristnitaka solid:
        // s_ThuHeitir hides the dialogue options and sets FREEZE before calling
        // this, and nothing else unfreezes. s_GuessCorrect is also the only path
        // that trades the Thórshamar for the cross.
        const self = this;
        c.put(attr(el, 'name'), {
          async execute(_ctx: SequenceContext) { await self.onGuess?.(); },
          async tunnel(_ctx: SequenceContext) { await self.onGuess?.(); },
          finish() {},
        } as Quantum);
        break;
      }

      case 'SwitchStateQuantum': {
        const stateName = attr(el, 'state');
        const controller = c.get(attr(el, 'controller')) as StateController;
        const stateMap: Record<string, number> = {
          'Moving': 0, 'Taking': 1, 'Looking': 2, 'Talking': 3,
          'Freeze': 4, 'Using': 5, 'Conversating': 6,
        };
        const stateValue = stateMap[stateName] ?? 4;
        if (controller instanceof StateController) {
          c.put(attr(el, 'name'), new Q.SwitchStateQuantum(controller, stateValue));
        }
        break;
      }

      case 'UpdateQuantum': {
        const terrain = c.get(attr(el, 'terrain'));
        const show = attr(el, 'show', 'true') === 'true';
        c.put(attr(el, 'name'), {
          async execute(_ctx: SequenceContext) {
            if (show) {
              if (terrain instanceof Inventory) {
                terrain.updatePositions();
              } else if (terrain instanceof SentenceContainer) {
                terrain.showAll();
              } else if (terrain?.scene) {
                terrain.scene.rebuildFaces();
              }
            } else {
              if (terrain instanceof SentenceContainer) {
                terrain.hideAll();
              }
            }
          },
          async tunnel(ctx: SequenceContext) { await this.execute(ctx); },
          finish() {},
        } as Quantum);
        break;
      }

      case 'SetPlayer': {
        const obj = c.get(attr(el, 'object'));
        const player = c.get(attr(el, 'player'));
        if (obj instanceof ScrollingScene && player instanceof MovingActor) {
          obj.mainActor = player;
        }
        if (obj instanceof StateController && player instanceof MovingActor) {
          obj.setPlayer(player);
        }
        break;
      }

      case 'BeginningScene': {
        // Declared in scene.dtd and present once per chapter, but the 1999
        // engine never implemented it: TTParser dispatches on 48 element names
        // and this is not among them, so the original silently ignored it.
        //
        // The port used to switch the world to this scene *during parsing*,
        // which put Landnám's ship on screen for about a second before
        // s_prepare's q_ToBlack and the opening scroll. That flash was invented
        // by the recreation, not inherited from the game.
        //
        // Recorded, never displayed. What is on screen stays the business of
        // s_always / s_prepare / s_begin, exactly as in 1999.
        const scene = c.get(attr(el, 'scene')) as Scene;
        if (scene) this.onBeginningScene?.(scene);
        break;
      }

      case 'Sequence': {
        const seq = new Sequence(attr(el, 'name'));
        // First pass: register the sequence
        c.put(seq.name, seq);
        // Second pass: add quantums (they reference the container)
        for (const qEl of Array.from(el.getElementsByTagName('Quantum'))) {
          const qName = attr(qEl, 'name');
          const quantum = c.get(qName) as Quantum;
          if (quantum) {
            (quantum as any).gmlName = qName;
            seq.addQuantum(quantum);
          } else {
            console.warn(`Quantum not found: ${qName} in sequence ${seq.name}`);
          }
        }
        break;
      }

      case 'Reaction': {
        const reactorName = attr(el, 'reactor');
        const actor = c.get(attr(el, 'actor')) as Actor;
        const seq = c.get(attr(el, 'seq')) as Sequence;
        const actor2Name = attr(el, 'actor2', '');
        const actor2 = actor2Name ? c.get(actor2Name) as Actor : null;
        const sc = this.currentSC;

        if (actor && seq) {
          // Collision reactors (ac_*): wire actor→sequence on the ActionCollision map
          const collisionMap = c.get(reactorName) as Map<Actor, Sequence> | undefined;
          if (collisionMap instanceof Map) {
            collisionMap.set(actor, seq);
          } else if (sc) {
            // Action reactors (action_look/take/talk/use)
            if (reactorName === 'action_look') {
              sc.lookReactions.set(actor, seq);
            } else if (reactorName === 'action_take') {
              sc.takeReactions.set(actor, seq);
            } else if (reactorName === 'action_talk') {
              sc.talkReactions.set(actor, seq);
            } else if (reactorName === 'action_use' && actor2) {
              if (!sc.useReactions.has(actor)) sc.useReactions.set(actor, new Map());
              sc.useReactions.get(actor)!.set(actor2, seq);
            }
          }
        }
        break;
      }

      case 'Image':
      case 'Images':
      case 'Fetch':
        // Image preloading hints - not critical for web
        break;

      default:
        // Unknown element - skip
        break;
    }
  }

  private parseActorCommon(el: Element, actor: Actor): void {
    actor.setLocation(float(el, 'x'), float(el, 'y'), float(el, 'z'));
    actor.random = attr(el, 'random', 'false') === 'true';
    actor.saveable = attr(el, 'save', 'false') === 'true';

    const scaling = attr(el, 'scaling', 'no');
    if (scaling === 'static') actor.scalingType = STATIC_SCALING;
    else if (scaling === 'dynamic') actor.scalingType = DYNAMIC_SCALING;
    else actor.scalingType = NO_SCALING;

    // Parse states
    const initialState = attr(el, 'state');
    for (const stateEl of Array.from(el.getElementsByTagName('State'))) {
      const stateName = attr(stateEl, 'name');
      const face = stateEl.hasAttribute('face')
        ? this.container.get(attr(stateEl, 'face')) as import('./ActorFace').ActorFace
        : null;
      const mouth = stateEl.hasAttribute('mouth')
        ? this.container.get(attr(stateEl, 'mouth')) as import('./ActorMouth').ActorMouth
        : null;
      const colBox = stateEl.hasAttribute('collisionbox')
        ? this.container.get(attr(stateEl, 'collisionbox'))
        : null;

      actor.addState(
        stateName, face, mouth,
        colBox?.width ?? 0, colBox?.height ?? 0, colBox?.depth ?? 0
      );
    }

    // Set terrain
    const terrainName = attr(el, 'terrain', '');
    if (terrainName) {
      const terrain = this.container.get(terrainName) as Terrain;
      if (terrain) actor.setTerrain(terrain);
    }

    // Set initial state - auto-create empty state if missing (e.g. "stop" state with no face/mouth)
    if (initialState) {
      if (!actor.states.has(initialState)) {
        console.log(`[GML] Auto-creating empty state "${initialState}" for actor ${actor.name}`);
        actor.addState(initialState, null, null);
      }
      actor.setState(initialState);
    }

    // Wire collision attribute — creates ActionCollision handler
    const collisionName = attr(el, 'collision', '');
    if (collisionName) {
      // ActionCollision: Map<Actor, Sequence> stored in container
      const actionCollision = new Map<Actor, Sequence>();
      this.container.put(collisionName, actionCollision);
      // Register listener on the hotspot actor
      actor.collisionListeners.push((_self: Actor, other: Actor) => {
        const seq = actionCollision.get(other);
        if (seq) {
          console.log(`[COLLISION] ${actor.name} ↔ ${other.name} → running sequence`);
          seq.perform(this.getDefaultContext());
        }
      });
    }
  }
}

// Helper functions
function attr(el: Element, name: string, defaultVal = ''): string {
  return el.getAttribute(name) ?? defaultVal;
}

function int(el: Element, name: string, defaultVal = 0): number {
  const val = el.getAttribute(name);
  return val ? parseInt(val, 10) : defaultVal;
}

function float(el: Element, name: string, defaultVal = 0): number {
  const val = el.getAttribute(name);
  return val ? parseFloat(val) : defaultVal;
}
