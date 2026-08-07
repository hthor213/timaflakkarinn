/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.draw.Color;

public class Color24
extends Color {
    private short red;
    private short green;
    private short blue;

    public Color24() {
        this.red = 0;
        this.green = 0;
        this.blue = 0;
    }

    public Color24(float f, float f2, float f3) {
        this((int)(f * 255.0f), (int)(f2 * 255.0f), (int)(f3 * 255.0f));
    }

    public Color24(int n, int n2, int n3) {
        if (n > 255) {
            n = 255;
        }
        if (n < 0) {
            n = 0;
        }
        if (n2 > 255) {
            n2 = 255;
        }
        if (n2 < 0) {
            n2 = 0;
        }
        if (n3 > 255) {
            n3 = 255;
        }
        if (n3 < 0) {
            n3 = 0;
        }
        this.red = (short)n;
        this.green = (short)n2;
        this.blue = (short)n3;
    }

    public short getRed() {
        return this.red;
    }

    public short getGreen() {
        return this.green;
    }

    public short getBlue() {
        return this.blue;
    }

    public Color duplicate() {
        return new Color24(this.red, this.green, this.blue);
    }
}
