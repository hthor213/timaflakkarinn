import type { Float3DPoint, Rect } from './types';
import type { ActorFace } from './ActorFace';
import type { ActorMouth } from './ActorMouth';
import type { Terrain } from './Terrain';
import type { AssetLoader } from './AssetLoader';
import type { Pulser, Pulsable } from './Pulser';

export const NO_SCALING = 0;
export const STATIC_SCALING = 1;
export const DYNAMIC_SCALING = 2;

export interface ActorState {
  face: ActorFace | null;
  mouth: ActorMouth | null;
  collisionWidth: number;
  collisionHeight: number;
  collisionDepth: number;
}

export class Actor {
  name: string;
  location: Float3DPoint = { x: 0, y: 0, z: 0 };
  states = new Map<string, ActorState>();
  currentStateName = '';
  currentFace: ActorFace | null = null;
  currentMouth: ActorMouth | null = null;
  currentTerrain: Terrain | null = null;
  scalingType = NO_SCALING;
  onStage = false;
  random = false;
  saveable = false;

  // Collision box for current state
  collisionWidth = 0;
  collisionHeight = 0;
  collisionDepth = 0;

  // Collision listeners: called with (thisActor, otherActor)
  collisionListeners: ((self: Actor, other: Actor) => void)[] = [];

  // Event callbacks
  onClicked?: (actor: Actor) => void;
  onEntered?: (actor: Actor) => void;
  onExited?: (actor: Actor) => void;
  onStateChanged?: (actor: Actor, state: string) => void;
  onTerrainChanged?: (actor: Actor, terrain: Terrain) => void;
  onMoved?: (actor: Actor) => void;

  constructor(name: string) {
    this.name = name;
  }

  addState(name: string, face: ActorFace | null, mouth: ActorMouth | null,
           colW = 0, colH = 0, colD = 0): void {
    if (face) face.owner = this;
    this.states.set(name, {
      face, mouth,
      collisionWidth: colW, collisionHeight: colH, collisionDepth: colD,
    });
  }

  setState(stateName: string): void {
    const state = this.states.get(stateName);
    if (!state) return;

    // Stop old mouth
    if (this.currentMouth) {
      this.currentMouth.stop();
    }

    const oldFace = this.currentFace;
    const newFace = state.face;

    // Stop old face animation and remove from scene
    if (oldFace && oldFace !== newFace) {
      oldFace.stopAnimation();
      if (this.currentTerrain?.scene) {
        this.currentTerrain.scene.removeFace(oldFace);
      }
    }

    this.currentStateName = stateName;
    this.currentFace = newFace;
    this.currentMouth = state.mouth;
    this.collisionWidth = state.collisionWidth;
    this.collisionHeight = state.collisionHeight;
    this.collisionDepth = state.collisionDepth;

    // Add new face to scene
    if (newFace) {
      newFace.reset();
      if (this.currentTerrain?.scene) {
        this.currentTerrain.scene.addFace(newFace);
      }
      if (newFace.isAnimated()) {
        newFace.startAnimation();
      }
    }

    if (this.currentMouth) {
      this.currentMouth.start();
    }

    this.updateFace();
    this.onStateChanged?.(this, stateName);
  }

  setLocation(x: number, y: number, z: number): void {
    this.location.x = x;
    this.location.y = y;
    this.location.z = z;
    this.updateFace();
    this.onMoved?.(this);
  }

  setTerrain(terrain: Terrain | null): void {
    const old = this.currentTerrain;
    // Remove face from old scene
    if (old?.scene && this.currentFace) {
      old.scene.removeFace(this.currentFace);
    }
    if (old) old.removeActor(this);
    this.currentTerrain = terrain;
    if (terrain) terrain.addActor(this);
    // Add face to new scene
    if (terrain?.scene && this.currentFace) {
      terrain.scene.addFace(this.currentFace);
    }
    this.updateFace();
    this.onTerrainChanged?.(this, terrain!);
  }

  updateFace(): void {
    if (!this.currentFace || !this.currentTerrain) return;

    const terrain = this.currentTerrain;
    const scrollX = 0; // ScrollingScene handles this
    const scrollY = 0;

    const physX = terrain.getPhysicalX(this.location, scrollX);
    const physY = terrain.getPhysicalY(this.location, scrollY);

    // Apply scaling
    let scale = 1.0;
    if (this.scalingType === STATIC_SCALING) {
      scale = terrain.defaultScaling;
    } else if (this.scalingType === DYNAMIC_SCALING) {
      scale = terrain.getScaling(this.location);
    }

    this.currentFace.setScaling(scale);

    // Position: center on X, offset by collision depth on Y
    const cx = physX - Math.round(this.collisionWidth * scale / 2);
    const cy = physY - Math.round(this.collisionDepth * scale);

    this.currentFace.setLocation(cx, cy);
  }

  /** Store loader reference on all faces/mouths for lazy loading */
  setLoader(loader: AssetLoader): void {
    for (const state of this.states.values()) {
      if (state.face) state.face.loader = loader;
      if (state.mouth) (state.mouth as any)._loader = loader;
    }
  }

  /** Fire collision event */
  fireCollision(other: Actor): void {
    for (const listener of this.collisionListeners) {
      listener(this, other);
    }
  }

  /** Check AABB collision between two actors */
  static checkCollision(a: Actor, b: Actor): boolean {
    // Both must have collision boxes
    if (a.collisionWidth === 0 || b.collisionWidth === 0) return false;

    // Get scaling factors
    const scaleA = a.currentTerrain?.getScaling(a.location) ?? 1;
    const scaleB = b.currentTerrain?.getScaling(b.location) ?? 1;

    const awHalf = (a.collisionWidth * scaleA) / 2;
    const bwHalf = (b.collisionWidth * scaleB) / 2;
    const ahHalf = (a.collisionHeight * scaleA) / 2;
    const bhHalf = (b.collisionHeight * scaleB) / 2;

    // AABB overlap in x,y
    if (Math.abs(a.location.x - b.location.x) >= awHalf + bwHalf) return false;
    if (Math.abs(a.location.y - b.location.y) >= ahHalf + bhHalf) return false;

    // Z-range overlap
    const aZMin = a.location.z;
    const aZMax = a.location.z + a.collisionDepth;
    const bZMin = b.location.z;
    const bZMax = b.location.z + b.collisionDepth;
    if (aZMax <= bZMin || aZMin >= bZMax) return false;

    return true;
  }

  /** Hit test: is point inside actor face? */
  containsPoint(x: number, y: number): boolean {
    return this.currentFace?.contains(x, y) ?? false;
  }

  getBounds(): Rect | null {
    return this.currentFace?.bounds ?? null;
  }

  getZOrder(): number {
    return this.location.y;
  }
}

/** Moving actor with pathfinding */
export class MovingActor extends Actor implements Pulsable {
  speed = 75.0;
  private destination: Float3DPoint | null = null;
  private course = 10.0; // 10 = stopped
  frozen = false;
  pulser: Pulser | null = null;

  onDestinationReached?: (actor: MovingActor) => void;

  setDestination(x: number, y: number): void {
    this.destination = { x, y, z: this.location.z };
    this.course = Math.atan2(this.location.y - y, x - this.location.x);

    this.pulser?.register(this);
  }

  getCourse(): number { return this.course; }

  stopMoving(): void {
    this.destination = null;
    this.course = 10.0;
    this.pulser?.unregister(this);
    this.switchFace();
  }

  // Pulsable interface
  pulse(delta: number): void {
    this.updateMovement(delta);
  }

  getPulseInterval(): number {
    return 30;
  }

  isMoving(): boolean {
    return this.destination !== null;
  }

  /** Walker face switching: map movement direction to animation state */
  private switchFace(): void {
    if (!this.isWalkerState(this.currentStateName)) return;
    const target = this.getStateFromCourse();
    if (target === this.currentStateName) return;

    // Check for transition state (e.g. "stop2right")
    if (!this.currentStateName.includes('2')) {
      const transition = this.currentStateName + '2' + target;
      if (this.states.has(transition)) {
        this.setState(transition);
        return;
      }
    } else if (this.course !== 10.0) {
      // In transition animation — wait for it to finish before switching
      const face = this.currentFace;
      if (face?.isAnimated() && !face.isAnimationFinished()) return;
    }
    this.setState(target);
  }

  private getStateFromCourse(): string {
    const c = this.course;
    if (c === 10.0) return 'stop';
    if (c < -2.356) return 'left';
    if (c < -0.785) return 'front';
    if (c < 0.785) return 'right';
    if (c < 2.356) return 'back';
    return 'left';
  }

  /** Check if state is a walker-managed directional state */
  private isWalkerState(state: string): boolean {
    return state === 'stop' || state === 'front' || state === 'back' ||
           state === 'left' || state === 'right' || state.includes('2');
  }

  private updateMovement(delta: number): void {
    if (!this.destination || this.frozen) return;

    const dt = Math.min(delta / 1000, 0.1); // Cap at 100ms to prevent jumps

    const terrain = this.currentTerrain;
    let speedFactor = 1.0;
    if (terrain && this.scalingType === DYNAMIC_SCALING) {
      speedFactor = terrain.getScaling(this.location);
    }

    const dx = Math.cos(this.course) * this.speed * dt * speedFactor;
    const dy = -Math.sin(this.course) * this.speed * dt * speedFactor;

    const newX = this.location.x + dx;
    const newY = this.location.y + dy;

    // Check if destination reached
    const distToDest = Math.hypot(this.destination.x - this.location.x,
                                   this.destination.y - this.location.y);
    const moveStep = Math.hypot(dx, dy);

    if (distToDest <= moveStep + 2) {
      // Snap to destination
      this.setLocation(this.destination.x, this.destination.y, this.location.z);
      this.stopMoving();
      this.onDestinationReached?.(this);
      return;
    }

    // Try full move
    let moved = false;
    const newPos = { x: newX, y: newY, z: this.location.z };
    if (!terrain || terrain.contains(newPos)) {
      this.setLocation(newX, newY, this.location.z);
      moved = true;
    } else {
      // Try X only
      const xPos = { x: newX, y: this.location.y, z: this.location.z };
      if (terrain.contains(xPos)) {
        this.setLocation(newX, this.location.y, this.location.z);
        moved = true;
      } else {
        // Try Y only
        const yPos = { x: this.location.x, y: newY, z: this.location.z };
        if (terrain.contains(yPos)) {
          this.setLocation(this.location.x, newY, this.location.z);
          moved = true;
        }
      }
    }

    // If completely blocked, stop — destination is unreachable
    if (!moved) {
      this.stopMoving();
      this.onDestinationReached?.(this);
      return;
    }

    // Check collisions with other actors on same terrain
    this.checkCollisions();

    this.switchFace();
  }

  /** Check collisions between this moving actor and all others on the terrain */
  private checkCollisions(): void {
    const terrain = this.currentTerrain;
    if (!terrain?.scene) return;

    // Check against all actors on all terrains in the scene
    for (const t of terrain.scene.terrains) {
      for (const other of t.actors) {
        if (other === this) continue;
        if (Actor.checkCollision(this, other)) {
          // Fire bidirectional collision
          this.fireCollision(other);
          other.fireCollision(this);
        }
      }
    }
  }
}
