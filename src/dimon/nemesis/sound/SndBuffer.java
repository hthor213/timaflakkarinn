/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

import is.dimon.nemesis.sound.SndFormat;
import is.dimon.nemesis.sound.SoundEvent;
import is.dimon.nemesis.sound.SoundListener;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.HashSet;
import is.dimon.util.Iterator;
import is.dimon.util.NoSuchElementException;

public class SndBuffer {
    private HashSet listeners = new HashSet(20);
    protected SndFormat sndFormat = new SndFormat(44100, 16, 2);
    protected int sampleLength;
    protected float mixingVolume = 1.0f;
    protected float mixingPan;
    private SoundEvent sndEvent = new SoundEvent(this);
    private long nativeSoundBuffer;
    private boolean releaseOnFinalize = true;

    protected SndBuffer() {
    }

    SndBuffer(long nativeSoundBuffer) {
        this.nativeSoundBuffer = nativeSoundBuffer;
        this.wrapNative(nativeSoundBuffer);
    }

    private native void wrapNative(long var1);

    private native void createNative();

    public SndBuffer(SndFormat format, int sampleLength) {
        this.sndFormat = format;
        this.sampleLength = sampleLength;
        this.createNative();
    }

    public SndBuffer(SndFormat format, byte[] data) {
        this(format, data.length * format.bitsPerSample / 8);
    }

    public byte[] lockBufferPortion(int which) {
        return null;
    }

    public void unlockBufferPortion(int which) {
    }

    public int getLength() {
        return this.sampleLength;
    }

    public float getTimeLength() {
        return (float)this.sampleLength / (float)this.sndFormat.sampleRate;
    }

    public float getVolume() {
        return this.mixingVolume;
    }

    public native void setVolume(float var1);

    public float getPan() {
        return this.mixingPan;
    }

    public native void setPan(float var1);

    public native void playOnce();

    public native void playLooped();

    public native void stop();

    public native void pause();

    public native void resume();

    public native boolean isPlaying();

    public native boolean isPaused();

    public native int getCurPosition();

    public native void setCurPosition(int var1);

    public float getCurTime() {
        return (float)this.getCurPosition() / (float)this.sndFormat.sampleRate;
    }

    public void setCurTime(float time) {
        this.setCurPosition((int)(time * (float)this.sndFormat.sampleRate));
    }

    public SndFormat getSndFormat() {
        return this.sndFormat;
    }

    public void convertSndFormat(SndFormat newFormat) {
    }

    public void notifyOnEnd(SoundListener soundListener) {
        if (!this.listeners.add(soundListener)) {
            System.err.println("FAILED!\n");
        }
    }

    public void dontNotifyOnEnd(SoundListener soundListener) {
        this.listeners.remove(soundListener);
    }

    public void handleSoundEvent() {
        Iterator iter = this.listeners.iterator();
        SoundEvent sndEvent = new SoundEvent(this);
        while (iter.hasNext()) {
            SoundListener sl;
            try {
                sl = (SoundListener)iter.next();
            }
            catch (NoSuchElementException noSuchElementException) {
                return;
            }
            catch (ConcurrentModificationException concurrentModificationException) {
                return;
            }
            sl.handleSoundEvent(sndEvent);
        }
    }

    public native int testFunk();

    protected void finalize() {
        if (this.releaseOnFinalize) {
            this.finalizeNative();
        }
    }

    private native void finalizeNative();

    public native void purge();
}
