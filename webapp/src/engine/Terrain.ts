import { Float3DPoint, pointInPolygon } from './types';
import type { Actor } from './Actor';
import type { Scene } from './Scene';

export class Terrain {
  name: string;
  scene: Scene | null = null;
  actors: Actor[] = [];
  polygon: number[][] = [];
  zMin = 0;
  zMax = 1000;
  defaultScaling = 1.0;
  scrolling = false;

  // Linear scaling: scaling = a * y + b
  private a = 0;
  private b = 1;

  constructor(name: string) {
    this.name = name;
  }

  setPolygon(points: number[][]): void {
    this.polygon = points;
  }

  setScalingParameters(focalY: number, refY: number, refScaling: number): void {
    if (focalY !== refY) {
      this.a = (this.defaultScaling - refScaling) / (focalY - refY);
      this.b = refScaling - this.a * refY;
    } else {
      this.a = 0;
      this.b = this.defaultScaling;
    }
  }

  contains(p: Float3DPoint): boolean {
    if (this.polygon.length === 0) return true;
    return p.z >= this.zMin && p.z <= this.zMax &&
           pointInPolygon(p.x, p.y, this.polygon);
  }

  getScaling(p: Float3DPoint): number {
    // Mirrors Java SimplePseudo3DTerrain.getScaling. A terrain only gets a
    // scaling ramp if the content authored scanline1/scanline2/scaling2; 83 of
    // the game's 84 terrains did not, leaving a == 0. In that case the original
    // scales by the terrain's declared defaultscaling — not by b, whose initial
    // value of 1 made every character on those terrains render too large.
    if (this.a === 0) return this.defaultScaling;
    return this.a * p.y + this.b;
  }

  getPhysicalX(p: Float3DPoint, scrollX = 0): number {
    return this.scrolling ? p.x - scrollX : p.x;
  }

  getPhysicalY(p: Float3DPoint, scrollY = 0): number {
    const base = p.y - p.z;
    return this.scrolling ? base - scrollY : base;
  }

  /** Move this terrain to a different scene (used for UI overlays) */
  setScene(newScene: Scene | null): void {
    if (this.scene === newScene) return;
    // Remove from old scene
    if (this.scene) {
      this.scene.removeTerrain(this);
    }
    // Add to new scene
    if (newScene) {
      newScene.addTerrain(this);
    }
  }

  addActor(actor: Actor): void {
    if (!this.actors.includes(actor)) {
      this.actors.push(actor);
    }
  }

  removeActor(actor: Actor): void {
    const idx = this.actors.indexOf(actor);
    if (idx >= 0) this.actors.splice(idx, 1);
  }
}
