/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorMovementEvent;
import java.util.EventListener;

public interface ActorMovementListener
extends EventListener {
    public void actorMoves(ActorMovementEvent var1);
}
