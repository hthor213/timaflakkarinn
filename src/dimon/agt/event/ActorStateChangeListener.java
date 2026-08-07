/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorStateChangeEvent;
import java.util.EventListener;

public interface ActorStateChangeListener
extends EventListener {
    public void actorChangesState(ActorStateChangeEvent var1);
}
