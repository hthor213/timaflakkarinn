/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

import is.dimon.nemesis.sound.SndBuffer;
import is.dimon.nemesis.sound.SndFormat;

public abstract class SoundReader {
    private SndFormat sndFormat;
    private SndBuffer sndBuf;

    public SndBuffer getSndBuffer() {
        return this.sndBuf;
    }

    public SndFormat getSoundFormat() {
        return this.sndFormat;
    }

    public int getByteLength() {
        if (this.sndBuf != null) {
            return this.sndBuf.getLength() * this.sndFormat.bitsPerSample / 8;
        }
        return 0;
    }

    public float getTimeLength() {
        if (this.sndBuf != null) {
            return this.sndBuf.getTimeLength();
        }
        return 0.0f;
    }
}
