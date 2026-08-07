/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.AGTEvent;

public class FreezeEvent
extends AGTEvent {
    public static final int FREEZE = 0;
    public static final int THAW = 1;

    public FreezeEvent(Object object, int n) {
        super(object, n);
    }
}
