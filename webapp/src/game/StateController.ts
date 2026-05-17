import type { Actor } from '../engine/Actor';
import type { MovingActor } from '../engine/Actor';
import type { Scene } from '../engine/Scene';
import { ScrollingScene } from '../engine/Scene';
import type { Sequence } from '../engine/Sequence';
import type { World } from '../engine/World';
import { TextActorFace } from '../engine/ActorFace';
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
