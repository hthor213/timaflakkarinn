/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.draw.BitBuffer;
import java.awt.Dimension;

public abstract class ImageReader {
    private int colorDepth;
    private BitBuffer bitBuf;

    public Dimension getSize() {
        if (this.bitBuf != null) {
            return this.bitBuf.getSize();
        }
        return null;
    }

    public int getColorDepth() {
        return this.colorDepth;
    }

    public BitBuffer getBitBuffer() {
        return this.bitBuf;
    }

    public abstract boolean reload();
}
