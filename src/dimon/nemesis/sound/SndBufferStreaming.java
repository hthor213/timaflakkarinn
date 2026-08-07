/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

import is.dimon.nemesis.sound.SndBuffer;
import is.dimon.nemesis.sound.SndFormat;
import java.io.InputStream;

public class SndBufferStreaming
extends SndBuffer {
    private static final int defaultLength = 2000;
    private InputStream source;
    private int writePointer;
    private int stoppedPlayingPointer;

    public SndBufferStreaming(SndFormat sndFormat, InputStream inputStream) {
        this.sndFormat = sndFormat;
        this.source = inputStream;
        this.sampleLength = 2000 * this.sndFormat.sampleRate / 1000;
    }

    public SndBufferStreaming(SndFormat sndFormat, InputStream inputStream, int n) {
        this.sndFormat = sndFormat;
        this.source = inputStream;
        this.sampleLength = n * this.sndFormat.sampleRate / 1000;
    }

    public native void tankUp();

    public native void play();
}
