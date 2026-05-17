/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorCollisionEvent;
import java.util.EventListener;

public interface ActorCollisionListener
extends EventListener {
    public void actorCollides(ActorCollisionEvent var1);
}
