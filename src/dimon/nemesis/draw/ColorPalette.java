/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.draw.Color;

public class ColorPalette {
    private static final int size = 256;
    private long nativePalette;
    private boolean releaseOnFinalize = true;

    public ColorPalette() {
        this.makeDefaultPalette();
    }

    private native void makeDefaultPalette();

    ColorPalette(long nativePalette) {
        this.nativePalette = nativePalette;
    }

    public native Color getColor(int var1);

    public native void setColor(int var1, Color var2);

    public int getSize() {
        return 256;
    }

    public native ColorPalette duplicate();

    protected void finalize() {
        System.err.println("finalizing " + this.toString());
        if (this.releaseOnFinalize) {
            this.finalizeNative();
        }
    }

    private native void finalizeNative();
}
