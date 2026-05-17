/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.Quantum;

public class PauseQuantum
implements Quantum {
    private long pauseTime = 1000L;
    private boolean frozen = false;

    public long getPauseTime() {
        return this.pauseTime;
    }

    public void setPauseTime(long l) {
        if (l <= 0L) {
            return;
        }
        this.pauseTime = l;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        try {
            this.wait(this.pauseTime);
            return;
        }
        catch (InterruptedException interruptedException) {
        }
    }

    public void tunnel() {
    }

    public synchronized void finish() {
        this.notifyAll();
    }
}
