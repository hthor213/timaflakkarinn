/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Killable;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.action.Sequence;

public class SubSequenceQuantum
implements Quantum,
Killable {
    private Sequence sequence;
    private boolean wait = false;
    private Thread waitingThread;

    public void setSequence(Sequence sequence) {
        this.sequence = sequence;
    }

    public Sequence getSequence() {
        return this.sequence;
    }

    public void setWait(boolean bl) {
        this.wait = bl;
    }

    public boolean getWait() {
        return this.wait;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        if (!this.wait) {
            this.sequence.perform();
            return;
        }
        this.sequence.perform(Thread.currentThread());
        try {
            this.wait();
            return;
        }
        catch (InterruptedException interruptedException) {
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void tunnel() {
        if (!this.wait) {
            this.sequence.fastForward(true);
            return;
        }
        this.sequence.fastForward(true, Thread.currentThread());
        SubSequenceQuantum subSequenceQuantum = this;
        synchronized (subSequenceQuantum) {
            try {
                this.wait();
            }
            catch (InterruptedException interruptedException) {
            }
            return;
        }
    }

    public synchronized void finish() {
        this.sequence.fastForward(false);
    }

    public void kill() {
        this.sequence = null;
        this.waitingThread = null;
    }
}
