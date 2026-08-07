/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.common.AlreadyExistsException;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.ColorPalette;
import is.dimon.nemesis.draw.ScreenMode;

public class Display {
    private int numBuffers = 2;
    private ScreenMode screenMode;
    private ColorPalette palette = new ColorPalette();
    private BitBuffer backBuf;
    private int displayBuffer;
    private static int refCount;

    public void Display() throws AlreadyExistsException {
        Display display = this;
        synchronized (display) {
            if (refCount != 0) {
                throw new AlreadyExistsException("Draw object already exists");
            }
            ++refCount;
        }
    }

    public void setBuffering(int numBufs) {
    }

    public int getBuffering() {
        return this.numBuffers;
    }

    public native int setScreenMode(ScreenMode var1);

    public ScreenMode getScreenMode() {
        return this.screenMode;
    }

    public native int setPalette(ColorPalette var1);

    public ColorPalette getPalette() {
        return this.palette;
    }

    public native BitBuffer getBackBuffer();

    public native int flip(boolean var1);

    native int startUp(String var1);

    native int shutDown();

    public native void purge();
}
