/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Scene;
import is.dimon.agt.World;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.event.WorldSceneChangeEvent;
import is.dimon.agt.event.WorldSceneChangeListener;

public class WorldSceneChangeReactor
extends AGTEventReactor
implements WorldSceneChangeListener {
    private Scene scene;
    private World world;

    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public Scene getScene() {
        return this.scene;
    }

    public World getWorld() {
        return this.world;
    }

    public void setWorld(World world) {
        this.world = world;
        this.world.addWorldSceneChangeListener(this);
    }

    public void worldChangesScene(WorldSceneChangeEvent worldSceneChangeEvent) {
        if (!this.enabled) {
            return;
        }
        if (this.scene != null && this.scene != worldSceneChangeEvent.getScene()) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.world != null) {
                this.world.removeWorldSceneChangeListener(this);
            }
            this.world = null;
            this.scene = null;
        }
    }

    public void setGroupName(String string) {
        System.err.println("Warning! setGroupName called in a WorldSceneChangeReactor.");
    }

    public String getGroupName() {
        System.err.println("Warning! getGroupName called in a WorldSceneChangeReactor.");
        return null;
    }
}
