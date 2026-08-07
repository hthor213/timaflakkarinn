import type { ActorFace } from './ActorFace';
import { TextActorFace, CursorFace } from './ActorFace';
import type { Actor, MovingActor } from './Actor';
import type { Terrain } from './Terrain';
import type { Rect, Color } from './types';

export class Scene {
  name: string;
  terrains: Terrain[] = [];
  backgroundColor: Color | null = null;
  active = false;
  cursorFace: CursorFace | null = null;

  /**
   * Scroll offset, subtracted at *layout* time by every scrolling terrain
   * (`Terrain.getPhysicalX/Y`). Always 0 on a plain Scene; only
   * `ScrollingScene` moves it. Because the offset is baked into
   * `ActorFace.bounds`, painting and hit-testing both work in screen space and
   * cannot drift apart.
   */
  scrollX = 0;
  scrollY = 0;

  // Sorted face list for rendering (by z-order)
  private faces: ActorFace[] = [];

  constructor(name: string) {
    this.name = name;
  }

  addTerrain(terrain: Terrain): void {
    if (!this.terrains.includes(terrain)) {
      this.terrains.push(terrain);
      terrain.scene = this;
      // Add all terrain actors' faces
      for (const actor of terrain.actors) {
        if (actor.currentFace) {
          this.addFace(actor.currentFace);
        }
      }
    }
  }

  removeTerrain(terrain: Terrain): void {
    const idx = this.terrains.indexOf(terrain);
    if (idx >= 0) {
      this.terrains.splice(idx, 1);
      // Remove all actor faces from this terrain
      for (const actor of terrain.actors) {
        if (actor.currentFace) {
          this.removeFace(actor.currentFace);
        }
      }
      terrain.scene = null;
    }
  }

  addFace(face: ActorFace): void {
    if (!this.faces.includes(face)) {
      this.faces.push(face);
      this.sortFaces();
    }
  }

  removeFace(face: ActorFace): void {
    const idx = this.faces.indexOf(face);
    if (idx >= 0) this.faces.splice(idx, 1);
  }

  sortFaces(): void {
    this.faces.sort((a, b) => a.getZOrder() - b.getZOrder());
  }

  onStage(): void {
    this.active = true;
  }

  offStage(): void {
    this.active = false;
  }

  /** Global debug overlay toggle */
  static debugOverlay = false;

  /** Paint all visible faces */
  paint(ctx: CanvasRenderingContext2D): void {
    const dirtyRect: Rect = { x: 0, y: 0, width: 800, height: 600 };

    // Clear
    if (this.backgroundColor) {
      ctx.fillStyle = `rgb(${this.backgroundColor.r},${this.backgroundColor.g},${this.backgroundColor.b})`;
    } else {
      ctx.fillStyle = '#000';
    }
    ctx.fillRect(0, 0, 800, 600);

    // Sort by z-order before painting
    this.sortFaces();

    // Paint faces
    for (const face of this.faces) {
      face.paint(ctx, dirtyRect);
    }

    // Debug overlay: draw bounding boxes for all faces
    if (Scene.debugOverlay) {
      this.paintDebugOverlay(ctx);
    }

    // Cursor last
    if (this.cursorFace) {
      this.cursorFace.paint(ctx, dirtyRect);
    }
  }

  /** Draw debug bounding boxes and collision areas */
  protected paintDebugOverlay(ctx: CanvasRenderingContext2D): void {
    ctx.save();
    ctx.lineWidth = 1;
    ctx.font = '9px monospace';

    for (const face of this.faces) {
      const b = face.bounds;
      if (b.width === 0 && b.height === 0) continue;

      const isHotspot = face.name === '' || (face as any).imagePath === '';
      const hasCollision = face.owner && face.owner.collisionListeners.length > 0;
      const isText = face instanceof TextActorFace;

      if (hasCollision) {
        // Collision hotspot — red dashed
        ctx.strokeStyle = '#f00';
        ctx.setLineDash([4, 4]);
        ctx.fillStyle = 'rgba(255,0,0,0.15)';
        ctx.fillRect(b.x, b.y, b.width, b.height);
      } else if (isHotspot) {
        // Invisible hotspot — yellow dashed
        ctx.strokeStyle = '#ff0';
        ctx.setLineDash([4, 4]);
        ctx.fillStyle = 'rgba(255,255,0,0.1)';
        ctx.fillRect(b.x, b.y, b.width, b.height);
      } else if (isText) {
        // Text face — cyan
        ctx.strokeStyle = '#0ff';
        ctx.setLineDash([]);
      } else {
        // Normal asset — green
        ctx.strokeStyle = '#0f0';
        ctx.setLineDash([]);
      }

      ctx.strokeRect(b.x + 0.5, b.y + 0.5, b.width, b.height);

      // Label
      const label = face.owner?.name ?? face.name;
      if (label) {
        ctx.fillStyle = ctx.strokeStyle;
        ctx.fillText(label, b.x + 2, b.y + 9);
      }
    }

    // Draw collision boxes for actors on all terrains
    for (const terrain of this.terrains) {
      for (const actor of terrain.actors) {
        if (actor.collisionWidth === 0) continue;
        const scale = terrain.getScaling(actor.location);
        const w = actor.collisionWidth * scale;
        const h = actor.collisionHeight * scale;
        // Same scroll the faces were laid out with, or the boxes would be the
        // only thing left in world space — the exact confusion that made #19
        // look like an oversized-hitbox problem.
        const px = terrain.getPhysicalX(actor.location, this.scrollX);
        const py = terrain.getPhysicalY(actor.location, this.scrollY);

        ctx.strokeStyle = actor.collisionListeners.length > 0 ? '#f80' : '#88f';
        ctx.setLineDash([2, 2]);
        ctx.strokeRect(px - w / 2 + 0.5, py - h / 2 + 0.5, w, h);
        ctx.fillStyle = ctx.strokeStyle;
        ctx.fillText(`cb:${actor.name}`, px - w / 2 + 2, py - h / 2 + 9);
      }
    }

    ctx.setLineDash([]);
    ctx.restore();
  }

  /** Get topmost actor face at screen coordinates */
  getActorFaceAt(x: number, y: number): ActorFace | null {
    // Walk backwards (topmost = rendered last = highest z-order)
    // Original Java walks forward keeping last match — same result
    for (let i = this.faces.length - 1; i >= 0; i--) {
      const face = this.faces[i];
      // Skip faces with zero-size bounds (not yet loaded)
      if (face.bounds.width === 0 || face.bounds.height === 0) continue;
      // All faces are hittable — including transparent/invisible hotspots
      if (face.contains(x, y)) {
        return face;
      }
    }
    return null;
  }

  /** Get all faces (for rebuilding) */
  getFaces(): ActorFace[] {
    return this.faces;
  }

  /** Rebuild face list from all terrains */
  rebuildFaces(): void {
    this.faces = [];
    for (const terrain of this.terrains) {
      for (const actor of terrain.actors) {
        if (actor.currentFace) {
          this.faces.push(actor.currentFace);
        }
      }
    }
    this.sortFaces();
  }
}

/** Scrolling scene that follows a main actor */
export class ScrollingScene extends Scene {
  realWidth = 800;
  realHeight = 600;
  mainActor: MovingActor | null = null;
  autoScroll = true;

  leftScrollDist = 325;
  rightScrollDist = 475;
  topScrollDist = 300;
  bottomScrollDist = 450;
  scrollStep = 30;

  /**
   * Move the viewport and re-lay-out the scene.
   *
   * The relayout is the whole point, and it is what 1999 does: after clamping,
   * `ScrollingScene.setScrollPosition` walks every terrain and every actor and
   * calls `actor.setLocation(actor.getLocation())`, which re-runs
   * `updateFace()` against the new scroll. Faces on scrolling terrains move,
   * faces on `scrolling="false"` terrains (the corner HUD, the subtitle
   * containers) deliberately do not.
   *
   * We call `updateFace()` directly rather than round-tripping through
   * `setLocation()`: identical layout effect, minus an `onMoved` storm that in
   * this port would re-enter `updateScroll()` once per actor.
   */
  setScrollPosition(x: number, y: number): void {
    const nx = Math.max(0, Math.min(x, this.realWidth - 800));
    const ny = Math.max(0, Math.min(y, this.realHeight - 600));
    if (nx === this.scrollX && ny === this.scrollY) return;
    this.scrollX = nx;
    this.scrollY = ny;
    this.relayout();
  }

  /**
   * A scene keeps its scroll offset between visits, and actors can change
   * state or terrain while it is off stage. Re-placing on entry costs one pass
   * over the terrains and removes any chance of a face carrying a stale offset
   * into the first hit test of the scene.
   */
  onStage(): void {
    super.onStage();
    this.relayout();
  }

  /** Re-place every face in the scene against the current scroll offset. */
  relayout(): void {
    for (const terrain of this.terrains) {
      for (const actor of terrain.actors) {
        actor.updateFace();
      }
    }
  }

  centerOnActor(): void {
    if (!this.mainActor) return;
    const loc = this.mainActor.location;
    this.setScrollPosition(
      Math.round(loc.x - 400),
      Math.round(loc.y - loc.z - 300)
    );
  }

  // No paint() override. The scroll offset is already baked into every face's
  // bounds by `relayout()`, exactly as in 1999, so the inherited screen-space
  // paint is correct — and the debug overlay, which draws `face.bounds`
  // straight onto the canvas, now shows the rectangle that is actually
  // hit-tested. Translating the canvas here instead was what let the drawn
  // scene and the pointer live in two different coordinate spaces; it also
  // dragged the `scrolling="false"` terrains (corner HUD, subtitles) sideways
  // with the viewport, which they are explicitly authored not to do.

  /** Update scroll to follow actor */
  updateScroll(): void {
    if (!this.mainActor || !this.autoScroll) return;
    const loc = this.mainActor.location;
    const screenX = loc.x - this.scrollX;
    const screenY = (loc.y - loc.z) - this.scrollY;

    if (screenX < this.leftScrollDist) {
      this.setScrollPosition(this.scrollX - this.scrollStep, this.scrollY);
    } else if (screenX > this.rightScrollDist) {
      this.setScrollPosition(this.scrollX + this.scrollStep, this.scrollY);
    }
    if (screenY < this.topScrollDist) {
      this.setScrollPosition(this.scrollX, this.scrollY - this.scrollStep);
    } else if (screenY > this.bottomScrollDist) {
      this.setScrollPosition(this.scrollX, this.scrollY + this.scrollStep);
    }
  }
}
