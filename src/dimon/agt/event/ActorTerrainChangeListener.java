/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorTerrainChangeEvent;
import java.util.EventListener;

public interface ActorTerrainChangeListener
extends EventListener {
    public void actorChangesTerrain(ActorTerrainChangeEvent var1);
}
