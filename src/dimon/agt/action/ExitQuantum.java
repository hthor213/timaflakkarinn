/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.World;
import is.dimon.agt.action.Quantum;

public class ExitQuantum
implements Quantum {
    private World world;

    public void setWorld(World world) {
        this.world = world;
    }

    public void leap() {
        System.out.println("Exiting from ExitQuantum");
        this.world.shutDown();
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
