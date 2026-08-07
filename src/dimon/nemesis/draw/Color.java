/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

public abstract class Color {
    public abstract short getRed();

    public abstract short getGreen();

    public abstract short getBlue();

    public short getAlpha() {
        return 0;
    }

    public String toString() {
        return "is.dimon.nemesis.draw.Color:(" + Integer.toString(this.getRed()) + "," + Integer.toString(this.getGreen()) + "," + Integer.toString(this.getBlue()) + ")";
    }
}
