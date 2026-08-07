/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import java.util.EventObject;

public abstract class AGTEvent
extends EventObject {
    protected int id;

    public int getID() {
        return this.id;
    }

    public AGTEvent(Object object, int n) {
        super(object);
        this.id = n;
    }
}
