/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.input;

import is.dimon.nemesis.input.KeyEvent;
import is.dimon.nemesis.input.KeyListener;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.HashSet;
import is.dimon.util.Iterator;
import java.util.NoSuchElementException;

public class Keyboard {
    private HashSet listeners = new HashSet(20);

    public boolean[] getKeyboardState() {
        return null;
    }

    public native boolean getKeyState(int var1);

    public void startYellingAt(KeyListener keyListener) {
        this.listeners.add(keyListener);
    }

    public void stopYellingAt(KeyListener keyListener) {
        this.listeners.remove(keyListener);
    }

    public void handleKeyEvent(KeyEvent keyEvent) {
        Iterator iterator = this.listeners.iterator();
        while (iterator.hasNext()) {
            KeyListener keyListener;
            try {
                keyListener = (KeyListener)iterator.next();
            }
            catch (NoSuchElementException noSuchElementException) {
                return;
            }
            catch (ConcurrentModificationException concurrentModificationException) {
                return;
            }
            keyListener.handleKeyEvent(keyEvent);
        }
    }
}
