/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.AGTMouseEvent;
import java.util.EventListener;

public interface AGTMouseListener
extends EventListener {
    public void mouseClicked(AGTMouseEvent var1);

    public void mousePressed(AGTMouseEvent var1);

    public void mouseReleased(AGTMouseEvent var1);

    public void mouseEntered(AGTMouseEvent var1);

    public void mouseExited(AGTMouseEvent var1);
}
