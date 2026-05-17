/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import java.awt.Rectangle;

public class Font {
    public static final int STYLE_NORMAL = 0;
    public static final int STYLE_ITALIC = 1;
    public static final int STYLE_BOLD = 2;
    public static final int STYLE_UNDERLINE = 4;
    public static final int bottomAlign = -1;
    public static final int baselineAlign = 0;
    public static final int topAlign = 1;
    public static final int leftAlign = -1;
    public static final int centerAlign = 0;
    public static final int rightAlign = 1;
    private String name;
    private float pointSize;
    protected long nativeFontRef;
    private boolean releaseOnFinalize = true;
    protected int vertAlign;
    protected int horizAlign = -1;

    protected Font(float f, long l, String string) {
        this.name = string;
        this.pointSize = f;
        this.nativeFontRef = l;
    }

    public static Font createDefaultFont(float f) {
        return Font.createDefaultFont(f, 0);
    }

    public static native Font createDefaultFont(float var0, int var1);

    public native Rectangle calcTextBounds(String var1);

    public String getName() {
        return this.name;
    }

    public float getPointSize() {
        return this.pointSize;
    }

    public int setVertAlignment(int n) {
        switch (n) {
            case -1: 
            case 0: 
            case 1: {
                this.vertAlign = n;
                return 0;
            }
        }
        return -1;
    }

    public int setHorizAlignment(int n) {
        switch (n) {
            case -1: 
            case 0: 
            case 1: {
                this.horizAlign = n;
                return 0;
            }
        }
        return -1;
    }

    public int getVertAlignment() {
        return this.vertAlign;
    }

    public int getHorizAlignment() {
        return this.horizAlign;
    }

    protected void finalize() {
        if (this.releaseOnFinalize) {
            this.finalizeNative();
        }
    }

    private native void finalizeNative();
}
