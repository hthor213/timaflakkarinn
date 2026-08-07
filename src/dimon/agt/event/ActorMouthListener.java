/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorMouthEvent;
import java.util.EventListener;

public interface ActorMouthListener
extends EventListener {
    public void actorMouthFinished(ActorMouthEvent var1);
}
