/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Terrain;
import is.dimon.agt.action.Quantum;
import is.dimon.timaflakkarinn.Inventory;
import is.dimon.timaflakkarinn.SentenceContainer;

public class UpdateQuantum
implements Quantum {
    boolean show = true;
    Terrain terrain;

    public void setShow(boolean bl) {
        this.show = bl;
    }

    public void setTerrain(Terrain terrain) {
        this.terrain = terrain;
    }

    public synchronized void leap() {
        if (this.show) {
            if (this.terrain instanceof Inventory) {
                ((Inventory)this.terrain).updatePositions();
            } else if (this.terrain instanceof SentenceContainer) {
                ((SentenceContainer)this.terrain).showAll();
            }
        } else {
            ((SentenceContainer)this.terrain).hideAll();
        }
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
