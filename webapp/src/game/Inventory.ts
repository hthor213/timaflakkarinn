import { Terrain } from '../engine/Terrain';

/** Inventory terrain with grid-based item positioning */
export class Inventory extends Terrain {
  /** Get grid position for item at index n */
  getPosition(n: number): { x: number; y: number; z: number } {
    return {
      x: 55 * (n % 5) + 220,
      y: 55 * Math.floor(n / 5) + 190,
      z: 10,
    };
  }

  /** Reposition all items in grid order */
  updatePositions(): void {
    this.actors.forEach((actor, i) => {
      const pos = this.getPosition(i);
      actor.setLocation(pos.x, pos.y, pos.z);
    });
  }
}
