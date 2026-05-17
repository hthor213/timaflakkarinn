/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.common.AlreadyExistsException;
import is.dimon.nemesis.common.NotAvailableException;
import is.dimon.nemesis.draw.Display;
import is.dimon.nemesis.draw.ScreenMode;

public class Draw {
    private Display display;
    private static int refCount;
    private boolean isStartedUp = false;
    private String title = "Nemesis";

    public Draw() throws AlreadyExistsException {
        Draw draw = this;
        synchronized (draw) {
            if (refCount != 0) {
                throw new AlreadyExistsException("Draw object already exists");
            }
            ++refCount;
        }
        System.loadLibrary("Nemesis");
        this.display = new Display();
    }

    protected void finalize() throws Throwable {
        if (this.isStartedUp) {
            this.shutDown();
        }
        --refCount;
    }

    public synchronized void startUp() throws NotAvailableException {
        if (this.isStartedUp) {
            return;
        }
        if (this.display.startUp(this.title) != 0) {
            throw new NotAvailableException("Failed to acquire graphics device");
        }
        this.isStartedUp = true;
    }

    public synchronized void shutDown() {
        if (!this.isStartedUp) {
            return;
        }
        this.isStartedUp = false;
        this.display.shutDown();
    }

    private native void shutDownNative();

    public native ScreenMode[] listScreenModes();

    public Display getDisplay() {
        return this.display;
    }

    public void setWindowTitle(String string) {
        this.title = string;
    }

    public String getWindowTitle() {
        return this.title;
    }
}
