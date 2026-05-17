/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.ActorMouth;
import is.dimon.agt.Killable;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.ActorMouthEvent;
import is.dimon.agt.event.ActorMouthListener;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.sound.SndBuffer;
import is.dimon.nemesis.sound.SoundEvent;
import is.dimon.nemesis.sound.SoundListener;
import is.dimon.nemesis.sound.SoundReaderWAV;
import java.io.FileNotFoundException;

public class SimpleActorMouth
implements ActorMouth,
SoundListener,
Killable,
FreezeListener {
    private static int count = 0;
    private static long coun = 0L;
    protected SndBuffer soundBuffer;
    protected Object freezeLock;
    protected String soundFilePath;
    boolean prepared = false;
    boolean loop = false;
    protected boolean finished = true;
    transient ActorMouthListener actorMouthListener;
    protected float volume = 100.0f;
    protected long duration = -1L;
    protected float balance = 0.0f;
    private String name;
    protected boolean frozen = false;
    private boolean wasPlaying = false;

    public void kill() {
    }

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void setSoundFilePath(String string) {
        this.soundFilePath = string;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void prepare() {
        if (this.soundFilePath == null) {
            System.err.println("No path set for SimpleActorMouth: " + this.getName());
            return;
        }
        if (this.prepared) {
            return;
        }
        try {
            SoundReaderWAV soundReaderWAV = new SoundReaderWAV(this.soundFilePath);
            this.soundBuffer = soundReaderWAV.getSndBuffer();
        }
        catch (FileNotFoundException fileNotFoundException) {
            System.err.println("Can't find file.\n" + fileNotFoundException.toString());
            return;
        }
        catch (BogusFileFormatException bogusFileFormatException) {
            System.err.println("Can't understand file.\n" + bogusFileFormatException.toString());
            return;
        }
        catch (Exception exception) {
            System.err.println("Caught misterious exception.\n" + exception.toString());
            return;
        }
        if (this.soundBuffer == null) {
            System.out.println("Error: SoundBuffer is null!!!");
        }
        if (this.balance != 0.0f) {
            this.soundBuffer.setPan(this.balance);
        }
        if (this.volume != 100.0f) {
            this.setVolume(this.volume);
        }
        this.soundBuffer.notifyOnEnd(this);
        this.prepared = true;
    }

    public synchronized void unprepare() {
        if (!this.prepared) {
            return;
        }
        this.stop();
        if (this.soundBuffer != null) {
            this.soundBuffer.dontNotifyOnEnd(this);
            this.soundBuffer.purge();
            this.soundBuffer = null;
        }
        this.prepared = false;
    }

    public boolean isPrepared() {
        return this.prepared;
    }

    public synchronized void start() {
        if (!this.prepared) {
            this.prepare();
        }
        if (!this.loop) {
            this.soundBuffer.playOnce();
        } else {
            this.soundBuffer.playLooped();
        }
        this.finished = false;
    }

    public synchronized void stop() {
        if (this.soundBuffer != null) {
            this.soundBuffer.stop();
            this.finished = true;
        }
    }

    public void freeze(FreezeEvent freezeEvent) {
        Object object = this.freezeLock;
        synchronized (object) {
            if (this.frozen) {
                Object var3_3 = null;
                return;
            }
            this.frozen = true;
            if (this.soundBuffer != null && this.soundBuffer.isPlaying()) {
                this.soundBuffer.pause();
                this.wasPlaying = true;
            }
        }
    }

    public void thaw(FreezeEvent freezeEvent) {
        Object object = this.freezeLock;
        synchronized (object) {
            if (!this.frozen) {
                Object var3_3 = null;
                return;
            }
            if (this.wasPlaying && this.soundBuffer != null) {
                this.soundBuffer.resume();
            }
            this.wasPlaying = false;
            this.frozen = false;
        }
    }

    public long getDuration() {
        if ((float)this.duration == -1.0f) {
            this.prepare();
            this.unprepare();
        }
        return this.duration;
    }

    public void setBalance(float f) {
        if (f < -1.0f || f > 1.0f) {
            return;
        }
        this.balance = f;
        if (this.prepared) {
            this.soundBuffer.setPan(this.balance);
        }
    }

    public float getBalance() {
        return this.balance;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public void setVolume(float f) {
        if ((double)f < 0.0 || (double)f > 100.0) {
            return;
        }
        this.volume = f;
        if (this.prepared) {
            this.soundBuffer.setVolume(this.volume / 100.0f);
        }
    }

    public float getVolume() {
        return this.volume;
    }

    public void handleSoundEvent(SoundEvent soundEvent) {
        SimpleActorMouth simpleActorMouth = this;
        synchronized (simpleActorMouth) {
            if (!this.finished) {
                this.finished = true;
                this.processActorMouthEvent(new ActorMouthEvent(this, 0));
            }
        }
    }

    public synchronized boolean isFinished() {
        return this.finished;
    }

    public void setLoop(boolean bl) {
        this.loop = bl;
    }

    public synchronized void addActorMouthListener(ActorMouthListener actorMouthListener) {
        this.actorMouthListener = AGTEventMulticaster.add(this.actorMouthListener, actorMouthListener);
    }

    public synchronized void removeActorMouthListener(ActorMouthListener actorMouthListener) {
        this.actorMouthListener = AGTEventMulticaster.remove(this.actorMouthListener, actorMouthListener);
    }

    protected void processActorMouthEvent(ActorMouthEvent actorMouthEvent) {
        if (this.actorMouthListener != null) {
            this.actorMouthListener.actorMouthFinished(actorMouthEvent);
        }
    }

    public SimpleActorMouth() {
        this.setName("ActorMouth" + count++);
        ++coun;
        this.freezeLock = new Object();
    }
}
