/**
 * Central game timer — mirrors the Java Pulser thread.
 * All timed updates (animation, movement, speech, fades) register here
 * instead of spawning independent setInterval/setTimeout calls.
 */

export interface Pulsable {
  /** Called when accumulated time >= pulse interval. delta = accumulated ms. */
  pulse(delta: number): void;
  /** Desired pulse interval in milliseconds. */
  getPulseInterval(): number;
}

interface PulseEntry {
  target: Pulsable;
  interval: number;
  accumulated: number;
}

export class Pulser {
  private entries: PulseEntry[] = [];
  private frozen = false;
  /** Total elapsed game time in ms (paused when frozen). */
  elapsed = 0;

  /** Register a pulsable. No-op if already registered. */
  register(target: Pulsable): void {
    if (this.entries.some(e => e.target === target)) return;
    this.entries.push({
      target,
      interval: target.getPulseInterval(),
      accumulated: 0,
    });
  }

  /** Unregister a pulsable. */
  unregister(target: Pulsable): void {
    const idx = this.entries.findIndex(e => e.target === target);
    if (idx !== -1) this.entries.splice(idx, 1);
  }

  /** Called once per frame from World's RAF loop with frame delta in ms. */
  update(delta: number): void {
    if (this.frozen) return;
    // Clamp insane deltas (tab-away, debugger pause)
    if (delta < 0 || delta > 10000) delta = 15;
    this.elapsed += delta;

    // Iterate a snapshot so pulse() callbacks can safely register/unregister
    const snapshot = this.entries.slice();
    for (const entry of snapshot) {
      entry.accumulated += delta;
      if (entry.accumulated >= entry.interval) {
        entry.target.pulse(entry.accumulated);
        entry.accumulated = 0;
      }
    }
  }

  /** Freeze all pulsing (game pause). */
  freeze(): void {
    this.frozen = true;
  }

  /** Resume pulsing. */
  thaw(): void {
    this.frozen = false;
  }

  /** Remove all entries. */
  clear(): void {
    this.entries.length = 0;
  }
}
