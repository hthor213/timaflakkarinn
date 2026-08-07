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
  private currentQuantum: Quantum | null = null;
  private frozen = false;
  /**
   * Every run currently parked at the freeze gate.
   *
   * Java parks the sequence *thread* on `freezeLock` and `thaw()` wakes it with
   * `notifyAll()` (`Sequence.java:91-97,170-177`), so a thaw releases all of
   * them. A single `resolve` field is the opposite: each new waiter overwrites
   * the previous one and only the last is ever released. A `Set` is the direct
   * analogue of `notifyAll` and, unlike the field, does not depend on every
   * future caller remembering to release the gate before parking a new run.
   */
  private thawWaiters = new Set<() => void>();
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
    this.fastForwarding = false;

    for (let i = 0; i < this.quanta.length; i++) {
      if (this.generation !== gen) return; // superseded by new run or stop
      const quantum = this.quanta[i];

      // Freeze gate. Java's is `synchronized (freezeLock) { if (frozen) wait(); }`
      // at the top of each quantum (`Sequence.java:170-177`); the monitor is what
      // makes checking the flag and parking one indivisible step, and `notifyAll`
      // is what releases every parked sequence.
      //
      // Two adaptations to a single-threaded async world:
      //   - `while`, not `if`. Java's `if` proceeds on any wake, so a freeze that
      //     lands between the thaw and the resumption would run anyway; here the
      //     flag is re-read, which is the guarantee `if` was assuming.
      //   - a generation bump must release the gate as well as a thaw. Java can
      //     leave a stopped-and-parked thread parked, because the thread is
      //     reused and nobody is blocked on it. Here every run is a promise a
      //     caller may be awaiting (`SubSequenceQuantum` with wait="true"), so a
      //     run left parked is a hang rather than a pause. Woken on the bump, it
      //     falls out of the loop and returns just below.
      while (this.frozen && this.generation === gen) {
        await new Promise<void>(resolve => { this.thawWaiters.add(resolve); });
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

  /** Release every run parked at the freeze gate — Java's `freezeLock.notifyAll()`. */
  private releaseGate(): void {
    if (this.thawWaiters.size === 0) return;
    // Swap first: a released run re-parks itself if it is still frozen, and it
    // must land in the new set rather than one we are mid-iteration over.
    const parked = this.thawWaiters;
    this.thawWaiters = new Set();
    for (const resolve of parked) resolve();
  }

  /** Freeze execution */
  freeze(): void {
    this.frozen = true;
  }

  /** Thaw (resume) execution */
  thaw(): void {
    this.frozen = false;
    this.releaseGate();
  }

  /** Stop execution */
  stopPerforming(): void {
    ++this.generation; // invalidate any running perform() loop
    this.performing = false;
    // Release the gate so a parked run can see the bump and return — but do NOT
    // clear `frozen`. In Java the flag is owned solely by freeze()/thaw(), which
    // World broadcasts to every sequence at once (`GMLParser.java:1774`), so a
    // stop that quietly thawed would drop a world-wide freeze on the floor and
    // let this one sequence run on alone.
    this.releaseGate();
    if (this.currentQuantum) {
      // Deviation from 1999, kept deliberately: Java's stopPerforming only sets
      // its `stopping` flag and lets the running quantum finish on its own,
      // whereas the port preempts. Without it a stop cannot take effect until
      // the current quantum resolves by itself, which the debug "stop all
      // sequences" path depends on.
      this.currentQuantum.finish();
      this.currentQuantum = null;
    }
  }
}
