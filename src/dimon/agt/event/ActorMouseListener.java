/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.AGTMouseEvent;
import java.util.EventListener;

public interface ActorMouseListener
extends EventListener {
    public void actorClicked(AGTMouseEvent var1);

    public void actorEntered(AGTMouseEvent var1);

    public void actorExited(AGTMouseEvent var1);
}
