/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Scene;
import is.dimon.agt.World;
import is.dimon.agt.action.Quantum;

public class SwitchSceneQuantum
implements Quantum {
    private Scene scene;
    private World world;

    public Scene getScene() {
        return this.scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public void setWorld(World world) {
        this.world = world;
    }

    public void leap() {
        this.world.setCurrentScene(this.scene);
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
