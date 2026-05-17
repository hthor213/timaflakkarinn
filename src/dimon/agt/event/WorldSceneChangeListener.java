/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.WorldSceneChangeEvent;
import java.util.EventListener;

public interface WorldSceneChangeListener
extends EventListener {
    public void worldChangesScene(WorldSceneChangeEvent var1);
}
