import { Terrain } from '../engine/Terrain';

/** Terrain that manages positioning of dialogue text actors */
export class SentenceContainer extends Terrain {
  /** Hide all text actors by moving off-screen */
  hideAll(): void {
    for (const actor of this.actors) {
      actor.setLocation(0, -3000, 0);
    }
  }

  /** Show all text actors by repositioning in list */
  showAll(): void {
    this.updatePositions();
  }

  /** Reposition all actors vertically */
  updatePositions(): void {
    this.actors.forEach((actor, i) => {
      const pos = this.getPosition(i);
      actor.setLocation(pos.x, pos.y, pos.z);
    });
  }

  private getPosition(n: number): { x: number; y: number; z: number } {
    return { x: 50, y: 370 + n * 30 + 800, z: 800 };
  }
}
