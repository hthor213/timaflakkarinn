/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.AGTEvent;

public class ActorStateChangeEvent
extends AGTEvent {
    private String newState;

    public String getState() {
        return this.newState;
    }

    public ActorStateChangeEvent(Object object, int n, String string) {
        super(object, n);
        this.newState = string;
    }
}
