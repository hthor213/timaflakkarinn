/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.input;

import is.dimon.nemesis.input.MouseButtonState;
import is.dimon.nemesis.input.MouseEvent;
import is.dimon.nemesis.input.MouseListener;
import is.dimon.nemesis.input.MouseState;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.HashSet;
import is.dimon.util.Iterator;
import java.awt.Point;
import java.util.NoSuchElementException;

public class Mouse {
    private HashSet listeners = new HashSet(20);

    public MouseState getState() {
        return new MouseState(this.getPosition(), this.getButtonState());
    }

    public native Point getPosition();

    public native MouseButtonState getButtonState();

    public void startYellingAt(MouseListener mouseListener) {
        this.listeners.add(mouseListener);
    }

    public void stopYellingAt(MouseListener mouseListener) {
        this.listeners.remove(mouseListener);
    }

    public void handleMouseEvent(MouseEvent mouseEvent) {
        Iterator iterator = this.listeners.iterator();
        while (iterator.hasNext()) {
            MouseListener mouseListener;
            try {
                mouseListener = (MouseListener)iterator.next();
            }
            catch (NoSuchElementException noSuchElementException) {
                return;
            }
            catch (ConcurrentModificationException concurrentModificationException) {
                return;
            }
            mouseListener.handleMouseEvent(mouseEvent);
        }
    }
}
