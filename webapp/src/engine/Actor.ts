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
  /**
   * Whether the content authored a `collisionbox=` on this state. Load-bearing:
   * see `MovingActor.updateLocation`. All 82 `Pseudo3DCollisionBox` elements in
   * the five chapters declare non-zero x/y/z, and every `collisionbox=`
   * reference resolves, so "all three dimensions are 0" is an exact test for
   * "no box was authored".
   */
  hasCollisionBox: boolean;
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
  /** Whether the *current* state has an authored collision box. */
  hasCollisionBox = false;

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
      hasCollisionBox: colW !== 0 || colH !== 0 || colD !== 0,
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
    this.hasCollisionBox = state.hasCollisionBox;

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

    // Scroll is part of the *layout*, not of painting.
    //
    // 1999 does it here: `SimplePseudo3DTerrain.getPhysicalXCoord()` subtracts
    // `((ScrollingScene) myScene).getScrollPosition()` whenever the terrain is
    // scrolling, so `ActorFace.bounds` is always screen space — which is the
    // space `Scene.getActorFaceAt(mouseX, mouseY)` hit-tests in.
    // `ScrollingScene.setScrollPosition()` then re-runs `setLocation` on every
    // actor of every terrain so the whole scene re-lays-out on each scroll step.
    //
    // The port used to pass 0 here and translate the canvas at paint time
    // instead. That drew correctly but left `bounds` in *world* space while the
    // pointer stayed in *screen* space, so every hit test in a scrolling scene
    // was wrong by exactly the scroll offset. See docs/known-issues.md #19.
    const scene = terrain.scene;
    const physX = terrain.getPhysicalX(this.location, scene?.scrollX ?? 0);
    const physY = terrain.getPhysicalY(this.location, scene?.scrollY ?? 0);

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

  // Obstacle-detour state — mirrors Java MovingActor's control/xFailed/yFailed/
  // tempDest. When the straight line to the destination is blocked, the walker
  // remembers the *real* target in trueDest and walks axis-aligned legs toward
  // it, re-deriving the course for each leg. Without this the actor keeps its
  // original course while sliding along a wall, drifts permanently off target
  // and ends up parked in a corner of the terrain polygon.
  private detouring = false;
  private xFailed = 0;      // 0 = not yet tried X, 1 = X leg failed once, 2 = give up
  private yFailed = false;
  private trueDest: { x: number; y: number } | null = null;

  onDestinationReached?: (actor: MovingActor) => void;

  setDestination(x: number, y: number): void {
    this.detouring = false;
    this.xFailed = 0;
    this.yFailed = false;
    this.trueDest = null;
    this.aimAt(x, y);

    this.pulser?.register(this);
  }

  /**
   * Java's private setDestination(float,float): retarget and re-derive the
   * course without clearing the detour bookkeeping.
   */
  private aimAt(x: number, y: number): void {
    this.destination = { x, y, z: this.location.z };
    this.course = Math.atan2(this.location.y - y, x - this.location.x);
  }

  getCourse(): number { return this.course; }

  stopMoving(): void {
    this.destination = null;
    this.course = 10.0;
    this.detouring = false;
    this.xFailed = 0;
    this.yFailed = false;
    this.trueDest = null;
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

    // Java computes the per-pulse step once and uses it both as the move
    // length and as the arrival threshold.
    const step = this.speed * dt * speedFactor;

    if (!this.checkDestinationReached(step)) {
      this.updateLocation(step);
    }
  }

  /**
   * Java MovingActor.destinationReached(). Runs *before* the move, so the
   * actor can never overshoot: the per-axis threshold is exactly one step.
   * While detouring, arriving at a leg end switches to the next leg instead of
   * declaring arrival.
   */
  private checkDestinationReached(step: number): boolean {
    const dest = this.destination;
    if (!dest || this.course === 10.0) return false;
    if (Math.abs(dest.x - this.location.x) >= step) return false;
    if (Math.abs(dest.y - this.location.y) >= step) return false;

    if (!this.detouring) {
      this.arrive(dest.x, dest.y);
      return true;
    }

    const t = this.trueDest!;
    if (Math.abs(t.x - this.location.x) < step && Math.abs(t.y - this.location.y) < step) {
      this.arrive(t.x, t.y);
      return true;
    }
    if (this.xFailed === 0) {
      this.xFailed = 2;
      this.aimAt(this.location.x, t.y);
      return false;
    }
    if (this.yFailed) return false;
    this.yFailed = true;
    this.aimAt(t.x, this.location.y);
    return false;
  }

  /** Settle on the target and fire the arrival event. */
  private arrive(x: number, y: number): void {
    this.setLocation(x, y, this.location.z);
    this.stopMoving();
    this.onDestinationReached?.(this);
  }

  /**
   * Java MovingActor.updateLocation(). On a blocked step, enter detour mode:
   * remember the real target and walk one axis at a time toward it, giving up
   * (and reporting arrival) once both axes are blocked.
   *
   * **A state with no collision box is never position-validated.** Java gates
   * the whole check on it (`Actor.setLocation`):
   *
   * ```java
   * if (currentTerrain != null && currentCollisionBox != null
   *     && !currentCollisionBox.validLocation(f, f2, f3)) throw ...
   * ```
   *
   * The port tested `terrain.contains()` unconditionally, which froze every
   * boxless scripted walk in the game — nine actors across three chapters,
   * all of them written to enter or leave the frame: Ingólfur coming up on
   * deck to throw the öndvegissúlur overboard (`ingolfur2`, z=327 against a
   * terrain of zmin=-7/zmax=0, so *every* step was rejected), the heathen and
   * Christian parties walking away from Lögberg to x=-250 and x=805, the
   * Turkish raiders, the drifting bottle, the floating log. Each reported its
   * destination as "reached" the instant it was told to move, so a
   * `wait="true"` sequence ran on and the actor simply never appeared.
   */
  private updateLocation(step: number): void {
    if (this.course === 10.0 || !this.destination) return;

    const terrain = this.currentTerrain;
    const newX = this.location.x + Math.cos(this.course) * step;
    const newY = this.location.y - Math.sin(this.course) * step;

    if (!terrain || !this.hasCollisionBox ||
        terrain.contains({ x: newX, y: newY, z: this.location.z })) {
      this.setLocation(newX, newY, this.location.z);
      this.checkCollisions();
      this.switchFace();
      return;
    }

    // Blocked.
    if (!this.detouring) {
      this.detouring = true;
      this.trueDest = { x: this.destination.x, y: this.destination.y };
    } else {
      if (this.xFailed === 0) this.xFailed = 1;
      else if (!this.yFailed) this.yFailed = true;
      else if (this.xFailed === 1) this.xFailed = 2;

      if (this.xFailed === 2) {
        // Both axes blocked — destination unreachable. Java stops here and
        // still reports "reached" so the waiting sequence continues.
        this.stopMoving();
        this.onDestinationReached?.(this);
        return;
      }
    }

    const t = this.trueDest!;
    if (this.xFailed === 0 || this.yFailed) {
      this.aimAt(t.x, this.location.y);   // horizontal leg
    } else {
      this.aimAt(this.location.x, t.y);   // vertical leg
    }
    this.updateLocation(step);
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
