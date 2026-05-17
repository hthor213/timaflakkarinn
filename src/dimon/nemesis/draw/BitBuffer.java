/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.draw.Color;
import is.dimon.nemesis.draw.ColorPalette;
import is.dimon.nemesis.draw.Font;
import is.dimon.nemesis.draw.ImageReader;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;

public class BitBuffer {
    ImageReader source;
    private int pitch;
    private int hotspot_x;
    private int hotspot_y;
    private long nativeBitmapBuffer;
    private boolean releaseOnFinalize = true;
    private ColorPalette palette;
    private int width;
    private int height;
    private int colorDepth;
    private Color transparentColor;
    private static Color defaultTransparentColor = null;

    public BitBuffer(int width, int height, int colorDepth) {
        this.width = width;
        this.height = height;
        this.createNative();
        this.setTransparentColor(defaultTransparentColor);
    }

    private native int createNative();

    BitBuffer(long nativeBitmapBuffer) {
        this.nativeBitmapBuffer = nativeBitmapBuffer;
        this.wrapNative(nativeBitmapBuffer);
        this.setTransparentColor(defaultTransparentColor);
    }

    private native int wrapNative(long var1);

    public byte[] lockRawBuffer() {
        return null;
    }

    public void unlockRawBuffer() {
    }

    public int getPitch() {
        return this.pitch;
    }

    public Dimension getSize() {
        return new Dimension(this.width, this.height);
    }

    public int getColorDepth() {
        return this.colorDepth;
    }

    public boolean isDisplayBuffer() {
        return false;
    }

    public native boolean isBackBuffer();

    public void fillColor(Color color) {
    }

    public native void blit(BitBuffer var1, Rectangle var2, Point var3);

    public native void blitScaled(BitBuffer var1, Rectangle var2, Rectangle var3);

    public native int renderText(String var1, Font var2, Point var3, Color var4, Color var5);

    public native int print();

    public Color getTransparentColor() {
        return this.transparentColor;
    }

    public native void setTransparentColor(Color var1);

    public static Color getDefaultTransparentColor() {
        return defaultTransparentColor;
    }

    public static void setDefaultTransparentColor(Color color) {
        defaultTransparentColor = color;
    }

    public Point getHotSpot() {
        return new Point(this.hotspot_x, this.hotspot_y);
    }

    public void setHotSpot(Point hotspot) {
        this.hotspot_x = hotspot.x;
        this.hotspot_y = hotspot.y;
    }

    public ColorPalette getPalette() {
        return this.palette;
    }

    public void setPalette(ColorPalette palette) {
        this.palette = palette;
        this.setPaletteNative();
    }

    public native int testFunk(int var1);

    public native void clearToBlack();

    public native void fill(Color var1);

    private native int setPaletteNative();

    protected void finalize() {
        if (this.releaseOnFinalize) {
            this.finalizeNative();
        }
    }

    private native void finalizeNative();

    public native void purge();
}
