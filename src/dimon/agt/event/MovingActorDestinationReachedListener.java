/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.MovingActorDestinationReachedEvent;
import java.util.EventListener;

public interface MovingActorDestinationReachedListener
extends EventListener {
    public void movingActorDestinationReached(MovingActorDestinationReachedEvent var1);
}
