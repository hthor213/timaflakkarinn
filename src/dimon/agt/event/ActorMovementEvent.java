/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Float3DPoint;
import is.dimon.agt.event.AGTEvent;

public class ActorMovementEvent
extends AGTEvent {
    private Float3DPoint newLocation;

    public Float3DPoint getLocation() {
        return this.newLocation;
    }

    public ActorMovementEvent(Object object, int n, Float3DPoint float3DPoint) {
        super(object, n);
        this.newLocation = float3DPoint;
    }
}
