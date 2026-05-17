/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.StageEvent;
import java.util.EventListener;

public interface StageListener
extends EventListener {
    public void onStage(StageEvent var1);

    public void offStage(StageEvent var1);
}
