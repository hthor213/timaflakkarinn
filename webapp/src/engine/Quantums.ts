import type { Quantum, SequenceContext } from './Sequence';
import { ConditionFlag, Sequence } from './Sequence';
import type { Actor } from './Actor';
import { MovingActor } from './Actor';
import type { ActorFace } from './ActorFace';
import { AnimatedActorFace } from './ActorFace';
import type { ActorMouth } from './ActorMouth';
import type { Scene } from './Scene';
import type { Terrain } from './Terrain';
import type { StateController } from '../game/StateController';
import type { Pulsable } from './Pulser';

/** Wait for a specified time */
export class PauseQuantum implements Quantum {
  time: number;
  private resolve: (() => void) | null = null;

  constructor(time: number) {
    this.time = time;
  }

  async execute(ctx: SequenceContext): Promise<void> {
    let elapsed = 0;
    const pulser = ctx.world.pulser;
    const pulsable: Pulsable = {
      pulse: (delta: number) => {
        elapsed += delta;
        if (elapsed >= this.time) {
          pulser.unregister(pulsable);
          this.resolve?.();
          this.resolve = null;
        }
      },
      getPulseInterval: () => 15,
    };
    await new Promise<void>(resolve => {
      this.resolve = resolve;
      pulser.register(pulsable);
    });
  }

  async tunnel(_ctx: SequenceContext): Promise<void> {
    // Skip pause in fast-forward
  }

  finish(): void {
    this.resolve?.();
  }
}

/** Change actor state (face/animation) */
export class StateQuantum implements Quantum {
  actor: Actor;
  state: string;
  wait: boolean;
  private resolve: (() => void) | null = null;

  constructor(actor: Actor, state: string, wait = false) {
    this.actor = actor;
    this.state = state;
    this.wait = wait;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.actor.setState(this.state);
    if (this.wait) {
      await this.waitForCompletion();
    }
  }

  async tunnel(_ctx: SequenceContext): Promise<void> {
    this.actor.setState(this.state);
  }

  private waitForCompletion(): Promise<void> {
    return new Promise<void>(resolve => {
      this.resolve = resolve;

      const face = this.actor.currentFace;
      const mouth = this.actor.currentMouth;
      // Infinite-repeat animations (repeats === -1) should not block
      const isInfiniteAnim = face instanceof AnimatedActorFace && face.repeats === -1;
      let faceFinished = !face?.isAnimated() || isInfiniteAnim;
      let mouthFinished = !mouth || mouth.finished;

      const checkDone = () => {
        if (faceFinished && mouthFinished) {
          resolve();
          this.resolve = null;
        }
      };

      if (face?.isAnimated()) {
        face.onAnimationFinished = () => {
          faceFinished = true;
          checkDone();
        };
      }

      if (mouth && !mouth.finished) {
        mouth.onFinished = () => {
          mouthFinished = true;
          checkDone();
        };
      }

      checkDone();
    });
  }

  finish(): void {
    this.resolve?.();
  }
}

/** Switch world scene */
export class SwitchSceneQuantum implements Quantum {
  scene: Scene;

  constructor(scene: Scene) {
    this.scene = scene;
  }

  async execute(ctx: SequenceContext): Promise<void> {
    ctx.world.setCurrentScene(this.scene);
  }

  async tunnel(ctx: SequenceContext): Promise<void> {
    ctx.world.setCurrentScene(this.scene);
  }

  finish(): void {}
}

/** Teleport actor to position and/or change terrain */
export class MoveActorQuantum implements Quantum {
  actor: Actor;
  x: number;
  y: number;
  z: number;
  terrain: Terrain | null;
  hasLocation: boolean;

  constructor(actor: Actor, x: number, y: number, z: number,
              terrain: Terrain | null = null, hasLocation = true) {
    this.actor = actor;
    this.x = x;
    this.y = y;
    this.z = z;
    this.terrain = terrain;
    this.hasLocation = hasLocation;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    if (this.terrain) {
      this.actor.setTerrain(this.terrain);
    } else if (!this.hasLocation) {
      // No terrain and no location = remove from terrain (hide actor)
      this.actor.setTerrain(null);
    }
    if (this.hasLocation) {
      this.actor.setLocation(this.x, this.y, this.z);
    }
  }

  async tunnel(ctx: SequenceContext): Promise<void> {
    await this.execute(ctx);
  }

  finish(): void {}
}

/** Set movement destination (optionally wait for arrival) */
export class SetDestinationQuantum implements Quantum {
  actor: MovingActor;
  x: number;
  y: number;
  speed: number | null;
  wait: boolean;
  private resolve: (() => void) | null = null;

  constructor(actor: MovingActor, x: number, y: number, wait = false, speed: number | null = null) {
    this.actor = actor;
    this.x = x;
    this.y = y;
    this.wait = wait;
    this.speed = speed;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    if (this.speed !== null) {
      this.actor.speed = this.speed;
    }
    this.actor.setDestination(this.x, this.y);

    if (this.wait) {
      await new Promise<void>(resolve => {
        this.resolve = resolve;
        const prevHandler = this.actor.onDestinationReached;
        this.actor.onDestinationReached = () => {
          this.actor.onDestinationReached = prevHandler;
          resolve();
          this.resolve = null;
        };
      });
    }
  }

  async tunnel(_ctx: SequenceContext): Promise<void> {
    this.actor.stopMoving();
    this.actor.setLocation(this.x, this.y, this.actor.location.z);
  }

  finish(): void {
    this.actor.stopMoving();
    this.actor.setLocation(this.x, this.y, this.actor.location.z);
    this.resolve?.();
  }
}

/** Set actor speed */
export class SetSpeedQuantum implements Quantum {
  actor: MovingActor;
  speed: number;

  constructor(actor: MovingActor, speed: number) {
    this.actor = actor;
    this.speed = speed;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.actor.speed = this.speed;
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Stop actor movement */
export class StopActorQuantum implements Quantum {
  actor: MovingActor;

  constructor(actor: MovingActor) {
    this.actor = actor;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.actor.stopMoving();
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Move terrain to a scene */
export class MoveTerrainQuantum implements Quantum {
  terrain: Terrain;
  scene: Scene;

  constructor(terrain: Terrain, scene: Scene) {
    this.terrain = terrain;
    this.scene = scene;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    if (this.terrain.scene) {
      this.terrain.scene.removeTerrain(this.terrain);
    }
    this.scene.addTerrain(this.terrain);
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Set condition flag to value */
export class SetFlagQuantum implements Quantum {
  flag: ConditionFlag;
  value: number;

  constructor(flag: ConditionFlag, value: number) {
    this.flag = flag;
    this.value = value;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.flag.value = this.value;
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Increment condition flag */
export class IncrementFlagQuantum implements Quantum {
  flag: ConditionFlag;

  constructor(flag: ConditionFlag) {
    this.flag = flag;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.flag.value++;
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Decrement condition flag */
export class DecrementFlagQuantum implements Quantum {
  flag: ConditionFlag;

  constructor(flag: ConditionFlag) {
    this.flag = flag;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.flag.value--;
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Set flag to random value in range */
export class RandomSetFlagQuantum implements Quantum {
  flag: ConditionFlag;
  low: number;
  high: number;

  constructor(flag: ConditionFlag, low: number, high: number) {
    this.flag = flag;
    this.low = low;
    this.high = high;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.flag.value = this.low + Math.floor(Math.random() * (this.high - this.low + 1));
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Branch based on condition flag value */
export class CheckConditionQuantum implements Quantum {
  flag: ConditionFlag;
  reactions = new Map<number, Sequence>();
  wait: boolean;

  constructor(flag: ConditionFlag, wait = true) {
    this.flag = flag;
    this.wait = wait;
  }

  addReaction(value: number, sequence: Sequence): void {
    this.reactions.set(value, sequence);
  }

  async execute(ctx: SequenceContext): Promise<void> {
    const seq = this.reactions.get(this.flag.value);
    if (seq) {
      if (this.wait) {
        await seq.perform(ctx);
      } else {
        seq.perform(ctx); // Fire and forget
      }
    }
  }

  async tunnel(ctx: SequenceContext): Promise<void> {
    await this.execute(ctx);
  }

  finish(): void {}
}

/** Execute a sub-sequence */
export class SubSequenceQuantum implements Quantum {
  sequence: Sequence;
  wait: boolean;

  constructor(sequence: Sequence, wait = false) {
    this.sequence = sequence;
    this.wait = wait;
  }

  async execute(ctx: SequenceContext): Promise<void> {
    if (this.wait) {
      await this.sequence.perform(ctx);
    } else {
      this.sequence.perform(ctx);
    }
  }

  async tunnel(ctx: SequenceContext): Promise<void> {
    await this.sequence.perform({ ...ctx, fastForward: true });
  }

  finish(): void {
    this.sequence.stopPerforming();
  }
}

/** Fast-forward a sequence */
export class FastForwardSequenceQuantum implements Quantum {
  sequence: Sequence;

  constructor(sequence: Sequence) {
    this.sequence = sequence;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.sequence.fastForward();
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Stop a sequence */
export class StopSequenceQuantum implements Quantum {
  sequence: Sequence;

  constructor(sequence: Sequence) {
    this.sequence = sequence;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.sequence.stopPerforming();
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Freeze/thaw a sequence */
export class FreezeSequenceQuantum implements Quantum {
  sequence: Sequence;
  freeze: boolean;

  constructor(sequence: Sequence, freeze: boolean) {
    this.sequence = sequence;
    this.freeze = freeze;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    if (this.freeze) {
      this.sequence.freeze();
    } else {
      this.sequence.thaw();
    }
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}

/** Fade mouth volume */
export class FadeQuantum implements Quantum {
  mouth: ActorMouth;
  goalVolume: number;
  speed: number;
  private resolve: (() => void) | null = null;

  constructor(mouth: ActorMouth, goalVolume: number, speed = 10) {
    this.mouth = mouth;
    this.goalVolume = goalVolume;
    this.speed = speed;
  }

  async execute(ctx: SequenceContext): Promise<void> {
    // speed=0 means instant set (matches Java behavior)
    if (this.speed <= 0) {
      this.mouth.setVolume(this.goalVolume);
      return;
    }
    const pulser = ctx.world.pulser;
    const pulsable: Pulsable = {
      pulse: (_delta: number) => {
        const current = this.mouth.volume;
        if (Math.abs(current - this.goalVolume) <= this.speed) {
          this.mouth.setVolume(this.goalVolume);
          pulser.unregister(pulsable);
          this.resolve?.();
          this.resolve = null;
        } else if (current < this.goalVolume) {
          this.mouth.setVolume(current + this.speed);
        } else {
          this.mouth.setVolume(current - this.speed);
        }
      },
      getPulseInterval: () => 50,
    };
    await new Promise<void>(resolve => {
      this.resolve = resolve;
      pulser.register(pulsable);
    });
  }

  async tunnel(_ctx: SequenceContext): Promise<void> {
    this.mouth.setVolume(this.goalVolume);
  }

  finish(): void {
    this.mouth.setVolume(this.goalVolume);
    this.resolve?.();
  }
}

/** Prepare/unprepare resources */
export class PrepareQuantum implements Quantum {
  target: { prepare: (loader: import('./AssetLoader').AssetLoader) => Promise<void>; unprepare: () => void };
  doPrepare: boolean;
  loader: import('./AssetLoader').AssetLoader;

  constructor(target: any, doPrepare: boolean, loader: any) {
    this.target = target;
    this.doPrepare = doPrepare;
    this.loader = loader;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    if (this.doPrepare) {
      await this.target.prepare(this.loader);
    } else {
      this.target.unprepare();
    }
  }

  async tunnel(ctx: SequenceContext): Promise<void> {
    if (!this.doPrepare) {
      this.target.unprepare();
    }
  }

  finish(): void {}
}

/** Switch game state (freeze/moving/talking etc.) */
export class SwitchStateQuantum implements Quantum {
  controller: StateController;
  stateValue: number;

  constructor(controller: StateController, stateValue: number) {
    this.controller = controller;
    this.stateValue = stateValue;
  }

  async execute(_ctx: SequenceContext): Promise<void> {
    this.controller.setState(this.stateValue);
  }

  async tunnel(ctx: SequenceContext): Promise<void> { await this.execute(ctx); }
  finish(): void {}
}
