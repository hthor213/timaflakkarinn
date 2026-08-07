/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

import is.dimon.nemesis.common.AlreadyExistsException;
import is.dimon.nemesis.common.NotAvailableException;
import is.dimon.nemesis.sound.SndFormat;

public class Sound {
    private static int refCount;
    private boolean isStartedUp = false;
    private int masterVolume = 10000;
    private SndFormat sndFormat = new SndFormat(22050, 16, 1);

    public Sound() throws AlreadyExistsException {
        Sound sound = this;
        synchronized (sound) {
            if (refCount != 0) {
                throw new AlreadyExistsException("Draw object already exists");
            }
            ++refCount;
            return;
        }
    }

    protected void finalize() throws Throwable {
        if (this.isStartedUp) {
            this.shutDown();
        }
        --refCount;
    }

    public synchronized void startUp() throws NotAvailableException {
        if (this.isStartedUp) {
            return;
        }
        if (this.startUpNative() != 0) {
            throw new NotAvailableException("Sound device is in use by another application.");
        }
        this.isStartedUp = true;
    }

    private native int startUpNative();

    public void shutDown() {
        if (!this.isStartedUp) {
            return;
        }
        this.isStartedUp = false;
        this.shutDownNative();
    }

    private native void shutDownNative();

    public int getMasterVolume() {
        return this.masterVolume;
    }

    public native int setMasterVolume(int var1);

    public SndFormat getSndFormat() {
        return this.sndFormat;
    }

    public native int setSndFormat(SndFormat var1);
}
