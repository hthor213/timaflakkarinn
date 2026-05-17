/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

import is.dimon.nemesis.common.Nemesis;

class EventThread
extends Thread {
    public void run() {
        boolean die = false;
        while (!die) {
            die = Nemesis.pollSystemEvents();
            try {
                Thread.sleep(Nemesis.pollingPeriod);
            }
            catch (Exception exception) {}
        }
    }

    EventThread() {
    }
}
