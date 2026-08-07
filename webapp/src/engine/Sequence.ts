import { gameLog } from './GameLog';

/** A Quantum is a single action step in a sequence */
export interface Quantum {
  /** Normal execution */
  execute(ctx: SequenceContext): Promise<void>;
  /** Fast-forward execution (skip delays) */
  tunnel(ctx: SequenceContext): Promise<void>;
  /** Force finish (preempt) */
  finish(): void;
}

/** Context passed to quantums during execution */
export interface SequenceContext {
  container: Map<string, any>;
  world: import('./World').World;
  fastForward: boolean;
}

/** Condition flag - integer variable for game logic branching */
export class ConditionFlag {
  name: string;
  value = 0;
  saveable = false;

  constructor(name: string) {
    this.name = name;
  }
}

/** A named group of objects */
export class Groups {
  private static groups = new Map<string, Set<any>>();

  static add(groupName: string, obj: any): void {
    let group = this.groups.get(groupName);
    if (!group) {
      group = new Set();
      this.groups.set(groupName, group);
    }
    group.add(obj);
  }

  static remove(groupName: string, obj: any): void {
    this.groups.get(groupName)?.delete(obj);
  }

  static get(groupName: string): Set<any> | undefined {
    return this.groups.get(groupName);
  }

  static clear(groupName: string): void {
    this.groups.get(groupName)?.clear();
  }

  static clearAll(): void {
    this.groups.clear();
  }
}

/** Sequence - ordered list of quantums executed in series */
export class Sequence {
  name: string;
  quanta: Quantum[] = [];
  private performing = false;
  private fastForwarding = false;
  private stopRequested = false;
  private currentQuantum: Quantum | null = null;
  private frozen = false;
  private frozenResolve: (() => void) | null = null;
  private generation = 0;

  constructor(name: string) {
    this.name = name;
  }

  addQuantum(q: Quantum): void {
    this.quanta.push(q);
  }

  isPerforming(): boolean {
    return this.performing;
  }

  /** Execute all quantums in order */
  async perform(ctx: SequenceContext): Promise<void> {
    // If already performing, stop the old run first so we can restart
    if (this.performing) {
      this.stopPerforming();
    }
    const gen = ++this.generation;
    this.performing = true;
    this.stopRequested = false;
    this.fastForwarding = false;

    for (let i = 0; i < this.quanta.length; i++) {
      if (this.generation !== gen) return; // superseded by new run or stop
      const quantum = this.quanta[i];

      // Wait if frozen
      while (this.frozen && this.generation === gen) {
        await new Promise<void>(resolve => { this.frozenResolve = resolve; });
      }
      if (this.generation !== gen) return;

      this.currentQuantum = quantum;
      const qType = (quantum as any).constructor?.name ?? '?';
      const qGmlName = (quantum as any).gmlName ?? '';
      const qDetail = (quantum as any).state ?? (quantum as any).scene?.name ?? (quantum as any).time ?? '';
      const label = `${this.name} [${i+1}/${this.quanta.length}] ${qType}${qDetail ? `(${qDetail})` : ''}${qGmlName ? ` <${qGmlName}>` : ''}`;
      gameLog('SEQ', label, ctx.world.pulser.elapsed);
      try {
        if (this.fastForwarding) {
          await quantum.tunnel(ctx);
        } else {
          await quantum.execute(ctx);
        }
      } catch (e) {
        gameLog('ERR', `${this.name} [${i+1}/${this.quanta.length}] ${qType} error: ${e}`, ctx.world.pulser.elapsed);
      }
    }

    if (this.generation === gen) {
      this.currentQuantum = null;
      this.performing = false;
    }
  }

  /** Fast-forward: skip delays */
  fastForward(): void {
    this.fastForwarding = true;
    if (this.currentQuantum) {
      this.currentQuantum.finish();
    }
  }

  /** Freeze execution */
  freeze(): void {
    this.frozen = true;
  }

  /** Thaw (resume) execution */
  thaw(): void {
    this.frozen = false;
    this.frozenResolve?.();
    this.frozenResolve = null;
  }

  /** Stop execution */
  stopPerforming(): void {
    ++this.generation; // invalidate any running perform() loop
    this.performing = false;
    this.stopRequested = true;
    this.frozen = false;
    this.frozenResolve?.();
    this.frozenResolve = null;
    if (this.currentQuantum) {
      this.currentQuantum.finish();
      this.currentQuantum = null;
    }
  }
}
