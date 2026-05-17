/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Scene;
import is.dimon.agt.Terrain;
import is.dimon.agt.action.Quantum;

public class MoveTerrainQuantum
implements Quantum {
    private Scene scene;
    private Terrain terrain;

    public Terrain getTerrain() {
        return this.terrain;
    }

    public void setTerrain(Terrain terrain) {
        this.terrain = terrain;
    }

    public Scene getScene() {
        return this.scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public void leap() {
        this.terrain.setScene(this.scene);
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
