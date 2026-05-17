/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Pulsable;
import java.util.Enumeration;
import java.util.Vector;

public class Pulser
extends Thread {
    private Vector pulsatingClasses = new Vector(10, 5);
    private Vector tempClasses;
    private long timeToSleep = 10L;
    private long sleepTime;
    private long lastTime;
    private long tempTime;
    private boolean sleep = true;

    public synchronized void pulse(Pulsable pulsable) {
        if (this.contains(pulsable)) {
            return;
        }
        Pulser pulser = this;
        if (pulser == null) {
            throw null;
        }
        PulsatingClass pulsatingClass = pulser.new PulsatingClass();
        pulsatingClass.pClass = pulsable;
        pulsatingClass.interval = pulsable.getPulseInterval();
        this.pulsatingClasses.addElement(pulsatingClass);
        this.sleep = false;
        this.notify();
    }

    private boolean contains(Pulsable pulsable) {
        Enumeration enumeration = this.pulsatingClasses.elements();
        while (enumeration.hasMoreElements()) {
            PulsatingClass pulsatingClass = (PulsatingClass)enumeration.nextElement();
            if (pulsatingClass.pClass != pulsable) continue;
            return true;
        }
        return false;
    }

    public synchronized void stopPulsing(Pulsable pulsable) {
        Enumeration enumeration = this.pulsatingClasses.elements();
        while (enumeration.hasMoreElements()) {
            PulsatingClass pulsatingClass = (PulsatingClass)enumeration.nextElement();
            if (pulsatingClass.pClass != pulsable) continue;
            this.pulsatingClasses.removeElement(pulsatingClass);
            if (!this.pulsatingClasses.isEmpty()) continue;
            this.sleep = true;
        }
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void run() {
        this.lastTime = this.tempTime = System.currentTimeMillis();
        while (true) {
            block11: {
                this.tempTime = System.currentTimeMillis();
                this.sleepTime = this.tempTime - this.lastTime;
                if (this.sleepTime < 0L || this.sleepTime > 10000L) {
                    this.sleepTime = 15L;
                }
                this.lastTime = this.tempTime;
                if (this.sleep) break block11;
                this.tempClasses = (Vector)this.pulsatingClasses.clone();
                var1_1 = this.tempClasses.elements();
                if (true) ** GOTO lbl32
            }
            try {
                var1_1 = this;
                synchronized (var1_1) {
                    this.wait();
                }
            }
            catch (InterruptedException var1_3) {
            }
            this.lastTime = System.currentTimeMillis();
            continue;
            do {
                var2_4 = (PulsatingClass)var1_1.nextElement();
                var2_4.subInterval += this.sleepTime;
                if (var2_4.subInterval < var2_4.interval) continue;
                var2_4.pClass.pulse(var2_4.subInterval);
                var2_4.subInterval = 0L;
lbl32:
                // 3 sources

            } while (var1_1.hasMoreElements());
            try {
                Thread.sleep(this.timeToSleep);
            }
            catch (InterruptedException var1_2) {
                continue;
            }
            break;
        }
    }

    public Pulser() {
        this.setName("theMightyPulser");
        this.start();
    }

    private class PulsatingClass {
        Pulsable pClass;
        long interval;
        long subInterval = 0L;
    }
}
