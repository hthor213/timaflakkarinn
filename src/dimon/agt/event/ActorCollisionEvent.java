/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Actor;
import is.dimon.agt.event.AGTEvent;

public class ActorCollisionEvent
extends AGTEvent {
    private Actor collider;

    public Actor getCollider() {
        return this.collider;
    }

    public ActorCollisionEvent(Object object, int n, Actor actor) {
        super(object, n);
        this.collider = actor;
    }
}
