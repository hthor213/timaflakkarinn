/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.FreezeEvent;
import java.util.EventListener;

public interface FreezeListener
extends EventListener {
    public void freeze(FreezeEvent var1);

    public void thaw(FreezeEvent var1);
}
