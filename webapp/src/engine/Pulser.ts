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
        // Carry the remainder instead of discarding it. Zeroing made every
        // interval round up to the next frame boundary: a 50 ms speech pulse at
        // 60 fps fired every ~66 ms, so subtitles drifted progressively late
        // against their audio across a long line, and animations ran ~30% slow.
        entry.accumulated -= entry.interval;
        // Don't let a stall bank arrears and then fire a burst of catch-up
        // pulses — a paused tab would rattle through an animation on resume.
        if (entry.accumulated >= entry.interval) entry.accumulated = 0;
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
