/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.ActorFaceEvent;
import java.util.EventListener;

public interface ActorFaceListener
extends EventListener {
    public void actorAnimationFinished(ActorFaceEvent var1);
}
