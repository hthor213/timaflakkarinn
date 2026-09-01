import type { Actor } from '../engine/Actor';
import type { MovingActor } from '../engine/Actor';
import type { Scene } from '../engine/Scene';
import { ScrollingScene } from '../engine/Scene';
import type { Sequence } from '../engine/Sequence';
import type { World } from '../engine/World';
import { TextActorFace } from '../engine/ActorFace';
import { SentenceContainer } from './SentenceContainer';
import type { Inventory } from './Inventory';

export const MOVING = 0;
export const TAKING = 1;
export const LOOKING = 2;
export const TALKING = 3;
export const FREEZE = 4;
export const USING = 5;
export const CONVERSATING = 6;

export class StateController {
  private world: World;
  private state = FREEZE;
  mainActor: MovingActor | null = null;
  private usedActor: Actor | null = null;

  stateActor: Actor;
  inventoryActor: Actor;
  textActor: Actor;

  private inventoryOn = false;
  private currentScene: Scene | null = null;
  inventoryScene: Scene | null = null;
  inventoryTerrain: Inventory | null = null;
  private currentOverActor: Actor | null = null;
  private justLeftInventory = false;

  // Action reaction maps
  lookReactions = new Map<Actor, Sequence>();
  takeReactions = new Map<Actor, Sequence>();
  talkReactions = new Map<Actor, Sequence>();
  useReactions = new Map<Actor, Map<Actor, Sequence>>();

  // Description maps
  movingDescriptions = new Map<Actor, string>();
  lookingDescriptions = new Map<Actor, string>();
  talkingDescriptions = new Map<Actor, string>();
  takingDescriptions = new Map<Actor, string>();
  usingDescriptions = new Map<Actor, Map<Actor, string>>();
  tholfall = new Map<Actor, string>();

  // Callback to game for performing sequences
  performSequence: (name: string, wait: boolean) => void = () => {};
  // Callback to game for cursor changes
  setCursorFace: (n: number) => void = () => {};
  /**
   * Fired whenever the verb or the inventory changes. The touch verb bar is a
   * view of this controller and must follow it, not just drive it: FREEZE
   * during a cut-scene, CONVERSATING during dialogue, USING when an item is
   * picked up, and the inventory opening are all state changes the player did
   * not make from the bar.
   */
  onStateChanged: () => void = () => {};

  constructor(world: World, stateActor: Actor, inventoryActor: Actor, textActor: Actor) {
    this.world = world;
    this.stateActor = stateActor;
    this.inventoryActor = inventoryActor;
    this.textActor = textActor;

    // Set text actor position and alignment (matches Java constructor line 513)
    textActor.setLocation(400, 1850, 1800);
    const textFace = textActor.currentFace;
    if (textFace instanceof TextActorFace) {
      textFace.alignment = 'center';
    }
  }

  getState(): number {
    return this.state;
  }

  setState(n: number): void {
    const names = ['MOVING','TAKING','LOOKING','TALKING','FREEZE','USING','CONVERSATING'];
    if (n >= 0 && n <= 6) {
      console.log(`[SC] setState: ${names[this.state]} → ${names[n]}`);
      this.state = n;
      this.updateState();
      this.onStateChanged();
    }
  }

  setStateUsing(actor: Actor): void {
    this.usedActor = actor;
    this.setState(USING);
  }

  setPlayer(actor: MovingActor): void {
    this.mainActor = actor;
    console.log(`[SC] Player set: ${actor.name}`);
    // Log wiring stats
    console.log(`[SC] Reactions: look=${this.lookReactions.size} take=${this.takeReactions.size} talk=${this.talkReactions.size} use=${this.useReactions.size}`);
    console.log(`[SC] Descriptions: moving=${this.movingDescriptions.size} looking=${this.lookingDescriptions.size} talking=${this.talkingDescriptions.size} taking=${this.takingDescriptions.size}`);
  }

  setInventoryScene(scene: Scene): void {
    this.inventoryScene = scene;
  }

  // === Description setters ===

  setMovingDescription(actor: Actor, desc: string): void {
    this.movingDescriptions.set(actor, desc);
  }

  setLookingDescription(actor: Actor, desc: string): void {
    this.lookingDescriptions.set(actor, desc);
  }

  setTalkingDescription(actor: Actor, desc: string): void {
    this.talkingDescriptions.set(actor, desc);
  }

  setTakingDescription(actor: Actor, desc: string): void {
    this.takingDescriptions.set(actor, desc);
  }

  setTholfall(actor: Actor, text: string): void {
    this.tholfall.set(actor, text);
  }

  setUsingDescription(actor: Actor, actor2: Actor, text: string): void {
    let map = this.usingDescriptions.get(actor);
    if (!map) {
      map = new Map();
      this.usingDescriptions.set(actor, map);
    }
    map.set(actor2, text);
  }

  // === Input handling ===

  handleMouseEvent(x: number, y: number, button: number): void {
    if (button === 0 && !this.inventoryOn) {
      if (this.state === MOVING && !this.justLeftInventory && this.mainActor) {
        console.log(`[SC] moving to (${x}, ${y}), mainActor=${this.mainActor?.name}`);
        // Account for scroll offset
        let scrollX = 0, scrollY = 0;
        if (this.currentScene instanceof ScrollingScene) {
          scrollX = this.currentScene.scrollX;
          scrollY = this.currentScene.scrollY;
        }
        this.mainActor.setDestination(x + scrollX, y + scrollY);
      }
      this.justLeftInventory = false;
    }
  }

  handleKeyEvent(key: string): void {
    if (key === ' ') {
      this.doRightButton();
    }
  }

  /** The four verbs a player can choose, in the order doRightButton cycles them. */
  static readonly VERBS = [MOVING, TAKING, LOOKING, TALKING];

  isInventoryOn(): boolean {
    return this.inventoryOn;
  }

  /**
   * The dialogue options on screen right now, in the order they are stacked.
   *
   * On a phone these are the least usable thing in the game: the canvas is
   * 800x600 scaled to the width of a handset, so a 22px line of dialogue lands
   * at roughly ten physical pixels, and each option's hit box is that line's
   * own measured width -- a target a few millimetres tall. This lets the touch
   * layout re-present the same options as real rows underneath the picture.
   *
   * A query, not a second copy of the conversation: the returned actors are the
   * actors, and choosing one goes back through actorClicked exactly as a click
   * on the canvas does.
   *
   * Visibility is read off position because that is how the game hides them --
   * SentenceContainer.hideAll parks every line at y = -3000 rather than
   * detaching it, so a container can hold options that are not currently
   * offered.
   */
  getVisibleSentences(): { actor: Actor; text: string }[] {
    if (this.state !== CONVERSATING) return [];
    const scene = this.world.currentScene;
    if (!scene) return [];

    const out: { actor: Actor; text: string }[] = [];
    for (const terrain of scene.terrains) {
      if (!(terrain instanceof SentenceContainer)) continue;
      for (const actor of terrain.actors) {
        const face = actor.currentFace;
        if (!(face instanceof TextActorFace)) continue;
        if (actor.location.y < 0) continue;      // parked by hideAll
        const text = face.text.trim();
        if (text) out.push({ actor, text });
      }
    }
    return out;
  }

  /**
   * Can this verb be chosen right now? Drives both the tap and the button's
   * enabled state, so a verb bar never offers something that would be ignored.
   *
   * These are exactly doRightButton's rules, read off it rather than re-derived:
   *
   *  - FREEZE and CONVERSATING do not change verb at all. A cut-scene or a
   *    dialogue owns the controller; letting a tap change the verb underneath
   *    it is how a player ends up holding LOOKING in a conversation.
   *  - With the inventory open only TAKING and LOOKING mean anything — the
   *    same pair doRightButton toggles between there.
   *  - MOVING is refused when the player has no face for its current movement
   *    state. doRightButton skips MOVING for the same reason, and it is why a
   *    boxless actor cannot walk (known-issues #17).
   */
  canSetVerb(n: number): boolean {
    if (!StateController.VERBS.includes(n)) return false;
    if (this.state === FREEZE || this.state === CONVERSATING) return false;
    if (this.inventoryOn) return n === TAKING || n === LOOKING;
    if (n === MOVING && this.mainActor
        && !this.mainActor.states.has(this.mainActor.currentStateName)) return false;
    return true;
  }

  /**
   * Choose a verb directly. doRightButton cycles; this picks. Same rules.
   *
   * Choosing a verb while holding an item puts the item back, because
   * doRightButton does: an item taken for USING has been removed from its
   * terrain, and leaving USING without returning it strands it attached to
   * nothing and out of the inventory.
   */
  setVerb(n: number): void {
    if (!this.canSetVerb(n)) return;
    if (this.state === USING && this.usedActor && this.inventoryTerrain) {
      this.usedActor.setTerrain(this.inventoryTerrain);
      this.inventoryTerrain.updatePositions();
    }
    this.setState(n);
  }

  doRightButton(): void {
    if (!this.inventoryOn) {
      switch (this.state) {
        case FREEZE:
        case CONVERSATING:
          // Don't cycle in these states
          break;
        case USING:
          // Return item to inventory
          if (this.usedActor && this.inventoryTerrain) {
            this.usedActor.setTerrain(this.inventoryTerrain);
            this.inventoryTerrain.updatePositions();
          }
          this.setState(MOVING);
          break;
        default:
          this.setState((this.state + 1) % 4);
          break;
      }
      // If mainActor doesn't have a face for current movement state, skip MOVING
      if (this.mainActor && !this.mainActor.states.has(this.mainActor.currentStateName) && this.state === MOVING) {
        this.setState(TAKING);
      }
    } else {
      // In inventory: toggle between TAKING and LOOKING
      switch (this.state) {
        case TAKING:
          this.setState(LOOKING);
          break;
        case LOOKING:
          this.setState(TAKING);
          break;
        case USING:
          if (this.usedActor && this.inventoryTerrain) {
            this.usedActor.setTerrain(this.inventoryTerrain);
            this.inventoryTerrain.updatePositions();
          }
          this.setState(TAKING);
          break;
      }
    }
    this.updateText(this.currentOverActor);
  }

  actorClicked(actor: Actor, button: number): void {
    const names = ['MOVING','TAKING','LOOKING','TALKING','FREEZE','USING','CONVERSATING'];
    console.log(`[SC] actorClicked: ${actor.name} button=${button} state=${names[this.state]}`);
    // Ignore right-click and middle-click
    if (button !== 0) return;

    // Inventory toggle
    if (actor === this.inventoryActor && this.state !== FREEZE && this.state !== CONVERSATING) {
      if (!this.inventoryOn) {
        // Open inventory
        this.mainActor?.stopMoving();
        if (this.inventoryScene) {
          this.world.setCurrentScene(this.inventoryScene);
        }
        if (this.state !== USING && this.state !== TAKING) {
          this.setState(TAKING);
        }
        this.inventoryOn = true;
      } else {
        // Close inventory — restore previous game scene directly
        // (Java original calls s_prepare blocking, but scene is already prepared)
        this.justLeftInventory = true;
        this.inventoryOn = false;
        console.log(`[SC] Closing inventory, restoring scene: ${this.currentScene?.name}`);
        if (this.currentScene) {
          this.world.setCurrentScene(this.currentScene);
        }
        if (this.state !== USING && this.mainActor?.states.has(this.mainActor.currentStateName)) {
          this.setState(MOVING);
        }
      }
      // Both branches above can return without calling setState -- opening with
      // the state already TAKING, closing while USING. inventoryOn still
      // changed, and it decides which verbs are offered, so say so explicitly.
      this.onStateChanged();
      return;
    }

    // In inventory TAKING mode: pick up item for USING
    if (this.inventoryOn && this.state === TAKING && actor.states.has('use')) {
      this.inventoryTerrain = actor.currentTerrain as Inventory | null;
      actor.setTerrain(null);
      this.setStateUsing(actor);
      return;
    }

    // Dispatch based on state
    switch (this.state) {
      case TAKING: {
        const seq = this.takeReactions.get(actor);
        if (seq) {
          seq.perform(this.getSequenceContext());
        } else if (actor.random) {
          this.performSequence('s_randomTake', false);
        }
        break;
      }
      case LOOKING: {
        const seq = this.lookReactions.get(actor);
        if (seq) {
          seq.perform(this.getSequenceContext());
        } else if (actor.random) {
          this.performSequence('s_randomLook', false);
        }
        break;
      }
      case TALKING: {
        this.updateText(null);
        const seq = this.talkReactions.get(actor);
        if (seq) {
          seq.perform(this.getSequenceContext());
        } else if (actor.random) {
          this.performSequence('s_randomTalk', false);
        }
        break;
      }
      case USING: {
        if (this.usedActor) {
          const actorMap = this.useReactions.get(this.usedActor);
          const seq = actorMap?.get(actor);
          if (seq) {
            seq.perform(this.getSequenceContext());
          } else if (actor.random && this.usedActor.random) {
            this.performSequence('s_randomUse', false);
            if (this.inventoryTerrain) {
              this.usedActor.setTerrain(this.inventoryTerrain);
              this.inventoryTerrain.updatePositions();
            }
            this.setState(TAKING);
          }
        }
        break;
      }
      case CONVERSATING: {
        // In conversation mode, clicking a TextActorFace triggers talk
        if (actor.currentFace instanceof TextActorFace) {
          const seq = this.talkReactions.get(actor);
          if (seq) seq.perform(this.getSequenceContext());
        }
        break;
      }
    }
    this.updateText(null);
  }

  actorEntered(actor: Actor): void {
    this.currentOverActor = actor;
    console.log(`[SC] actorEntered: ${actor.name}, hasMovingDesc=${this.movingDescriptions.has(actor)}`);
    this.updateText(actor);
  }

  actorExited(_actor: Actor): void {
    this.currentOverActor = null;
    this.updateText(null);
  }

  // === Internal ===

  private updateState(): void {
    const stateNames = ['moving', 'taking', 'looking', 'talking', 'freeze', 'using'];
    if (this.state === USING && this.usedActor) {
      // For USING, copy the item's "use" face onto the state actor
      const useFace = this.usedActor.states.get('use');
      if (useFace?.face) {
        this.stateActor.addState('using', useFace.face, null);
      }
      this.stateActor.setState('using');
    } else {
      this.stateActor.setState(stateNames[this.state] || 'moving');
    }

    if (this.state === FREEZE) {
      // Hide cursor during freeze
      const scene = this.world.currentScene;
      if (scene) scene.cursorFace = null;
      this.updateText(null);
    } else {
      this.setCursorFace(1); // Normal cursor by default
      // Check if hovering over an interactive actor
      if (this.currentOverActor && this.movingDescriptions.has(this.currentOverActor)) {
        this.setCursorFace(2);
        this.updateText(this.currentOverActor);
      }
    }
  }

  private updateText(actor: Actor | null): void {
    let text: string | null = null;

    if (actor && this.movingDescriptions.has(actor)) {
      switch (this.state) {
        case MOVING:
          text = this.movingDescriptions.get(actor) ?? null;
          break;
        case TAKING:
          text = this.takingDescriptions.get(actor) ?? null;
          if (!text) {
            const thf = this.tholfall.get(actor);
            if (thf) text = `Taka ${thf}`;
          }
          break;
        case LOOKING:
          text = this.lookingDescriptions.get(actor) ?? null;
          if (!text) {
            const thf = this.tholfall.get(actor);
            if (thf) text = `Skoða ${thf}`;
          }
          break;
        case TALKING:
          text = this.talkingDescriptions.get(actor) ?? null;
          if (!text) {
            const thf = this.tholfall.get(actor);
            if (thf) text = `Tala við ${thf}`;
          }
          break;
        case USING:
          if (this.usedActor) {
            const map = this.usingDescriptions.get(this.usedActor);
            text = map?.get(actor) ?? null;
            if (!text) {
              const thf1 = this.tholfall.get(this.usedActor);
              const thf2 = this.tholfall.get(actor);
              if (thf1 && thf2) text = `Nota ${thf1} á ${thf2}`;
            }
          }
          break;
      }
    }

    // Set text on the textActor's face
    const face = this.textActor.currentFace;
    if (face instanceof TextActorFace) {
      face.setText(text ?? '');
    }

    // Update cursor
    if (this.state !== FREEZE) {
      if (text) {
        this.setCursorFace(2); // Hand cursor
      } else {
        this.setCursorFace(1); // Normal cursor
      }
    }
  }

  worldChangesScene(scene: Scene): void {
    // Skip non-game scenes (matching Java StateController.worldChangesScene)
    if (['saveScene', 'waitScene', 'blackScene', 's_Black'].includes(scene.name)) return;
    if (!this.inventoryActor) return;

    // Move UI overlay terrains to new scene
    const invTerrain = this.inventoryActor.currentTerrain;
    const stateTerrain = this.stateActor.currentTerrain;
    if (invTerrain) invTerrain.setScene(scene);
    if (stateTerrain && stateTerrain !== invTerrain) stateTerrain.setScene(scene);

    // Track current scene (but not inventory scene)
    if (scene !== this.inventoryScene) {
      this.currentScene = scene;
    }
  }

  getSequenceContext() {
    return {
      container: new Map<string, any>(),
      world: this.world,
      fastForward: false,
    };
  }
}
