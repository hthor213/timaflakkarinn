/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.timaflakkarinn.Timaflakkarinn;

private class Timaflakkarinn.ThemeFinisher
extends Thread {
    private Thread waitingThread;

    public Timaflakkarinn.ThemeFinisher() {
        Timaflakkarinn.this = Timaflakkarinn.this;
    }

    public void doFinish(Thread thread) {
        this.waitingThread = thread;
        if (!this.isAlive()) {
            this.start();
        }
        this.resume();
    }

    public void run() {
        while (true) {
            this.waitingThread.stop();
            ++Timaflakkarinn.this.currentScreen;
            Timaflakkarinn.this.parseStoryPage(Timaflakkarinn.this.currentScreen);
            if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                Timaflakkarinn.access$1((Timaflakkarinn)Timaflakkarinn.this, (boolean)true);
            }
            if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                Timaflakkarinn.this.performSequence("s_always", true);
            }
            if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                Timaflakkarinn.this.performSequence("s_prepare", true);
            }
            if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                Timaflakkarinn.this.performSequence("s_begin", false);
            }
            this.suspend();
        }
    }
}
