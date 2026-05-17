/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

public class ScreenMode {
    public int width;
    public int height;
    public int colordepth;
    public int yrefresh;
    public int xrefresh;

    public ScreenMode(int xsize, int ysize, int colordepth, int yrefresh, int xrefresh) {
        this.width = xsize;
        this.height = ysize;
        this.colordepth = colordepth;
        this.yrefresh = yrefresh;
        this.xrefresh = xrefresh;
    }

    public String toString() {
        String result = super.toString();
        result = result.concat(" ");
        result = result.concat(String.valueOf(this.width));
        result = result.concat("x");
        result = result.concat(String.valueOf(this.height));
        result = result.concat("x");
        result = result.concat(String.valueOf(this.colordepth));
        if (this.yrefresh != 0) {
            result = result.concat(" @ ");
            result = result.concat(String.valueOf(this.yrefresh));
            result = result.concat("Hz");
        }
        if (this.xrefresh != 0) {
            result = result.concat(", ");
            result = result.concat(String.valueOf(this.xrefresh));
            result = result.concat("Hz");
        }
        return result;
    }
}
