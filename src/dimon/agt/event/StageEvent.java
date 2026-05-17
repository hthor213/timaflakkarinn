/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Scene;
import is.dimon.agt.event.AGTEvent;

public class StageEvent
extends AGTEvent {
    public static final int OFF = 0;
    public static final int ON = 1;

    public StageEvent(Scene scene, int n) {
        super(scene, n);
    }
}
