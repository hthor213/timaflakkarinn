/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Terrain;
import is.dimon.agt.event.AGTEvent;

public class ActorTerrainChangeEvent
extends AGTEvent {
    private Terrain newTerrain;

    public Terrain getTerrain() {
        return this.newTerrain;
    }

    public ActorTerrainChangeEvent(Object object, int n, Terrain terrain) {
        super(object, n);
        this.newTerrain = terrain;
    }
}
