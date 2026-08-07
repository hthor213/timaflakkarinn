/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Killable;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import java.util.Enumeration;
import java.util.Vector;

public class Sequence
extends Thread
implements Killable,
FreezeListener {
    public static final int IDLE = 0;
    public static final int PERFORMING = 1;
    public static final int FASTFORWARDING = 2;
    private static long coun = 0L;
    private static long count = 0L;
    private Vector quanta;
    private boolean kill = false;
    private Vector waitingThreads;
    private boolean frozen = false;
    private boolean stopping = false;
    private int performingMode = 0;
    private Quantum currentQuantum;
    public Object runLock = new Object();
    public Object freezeLock = new Object();

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void fastForward(boolean bl) {
        if (this.performingMode == 2) {
            return;
        }
        if (this.performingMode == 0) {
            if (bl) {
                this.performingMode = 2;
                this.perform();
            }
        } else if (this.performingMode == 1) {
            this.performingMode = 2;
            this.preemptCurrentQuantum();
        }
    }

    public void fastForward(boolean bl, Thread thread) {
        if (this.performingMode == 2) {
            return;
        }
        if (this.performingMode == 0) {
            if (bl) {
                this.performingMode = 2;
                this.perform(thread);
            }
        } else if (this.performingMode == 1) {
            if (!this.waitingThreads.contains(thread)) {
                this.waitingThreads.addElement(thread);
            }
            this.performingMode = 2;
            this.preemptCurrentQuantum();
        }
    }

    public void freeze(FreezeEvent freezeEvent) {
        this.frozen = true;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void preemptCurrentQuantum() {
        try {
            this.currentQuantum.finish();
            return;
        }
        catch (NullPointerException nullPointerException) {
        }
    }

    public void thaw(FreezeEvent freezeEvent) {
        Object object = this.freezeLock;
        synchronized (object) {
            this.frozen = false;
            this.freezeLock.notifyAll();
        }
    }

    public void stopPerforming() {
        if (this.performingMode == 0) {
            return;
        }
        this.stopping = true;
    }

    public boolean contains(Quantum quantum) {
        return this.quanta.contains(quantum);
    }

    public Quantum getQuantum(int n) throws ArrayIndexOutOfBoundsException {
        return (Quantum)this.quanta.elementAt(n);
    }

    public Enumeration getEnumeration() {
        return this.quanta.elements();
    }

    public void add(Quantum quantum) {
        this.quanta.addElement(quantum);
    }

    public void add(Quantum quantum, int n) {
        this.quanta.insertElementAt(quantum, n);
    }

    public void remove(Quantum quantum) {
        this.quanta.removeElement(quantum);
    }

    public void remove(int n) throws ArrayIndexOutOfBoundsException {
        this.quanta.removeElementAt(n);
    }

    public void perform() {
        if (this.performingMode == 0) {
            this.performingMode = 1;
        }
        if (!this.isAlive()) {
            this.start();
        }
        Object object = this.runLock;
        synchronized (object) {
            this.runLock.notifyAll();
        }
    }

    public void perform(Thread thread) {
        if (this.performingMode == 0) {
            this.performingMode = 1;
        }
        this.waitingThreads.addElement(thread);
        if (!this.isAlive()) {
            this.start();
        }
        Object object = this.runLock;
        synchronized (object) {
            this.runLock.notifyAll();
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void run() {
        while (!this.kill) {
            int n = 1;
            Object object = this.quanta.elements();
            while (object.hasMoreElements()) {
                if (this.stopping) break;
                Object object2 = this.freezeLock;
                synchronized (object2) {
                    if (this.frozen) {
                        try {
                            this.freezeLock.wait();
                        }
                        catch (InterruptedException interruptedException) {
                        }
                    }
                }
                this.currentQuantum = (Quantum)object.nextElement();
                if (this.currentQuantum != null) {
                    System.out.println("Sequence " + this.getName() + " is about to perform quantum no.: " + n);
                    if (this.performingMode == 1) {
                        this.currentQuantum.leap();
                    } else if (this.performingMode == 2) {
                        this.currentQuantum.tunnel();
                    }
                    System.out.println("Sequence " + this.getName() + " has finished performing quantum no.: " + n);
                } else {
                    System.out.println("Caught NullPointerException - Count is: " + n + " I am: " + this.getName());
                }
                ++n;
            }
            if (!this.waitingThreads.isEmpty()) {
                object = this.waitingThreads.elements();
                while (object.hasMoreElements()) {
                    ((Thread)object.nextElement()).interrupt();
                }
                this.waitingThreads.removeAllElements();
            }
            this.stopping = false;
            this.performingMode = 0;
            if (this.kill) continue;
            object = this.runLock;
            synchronized (object) {
                try {
                    this.runLock.wait();
                }
                catch (InterruptedException interruptedException) {
                }
            }
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void kill() {
        this.kill = true;
        if (!this.isAlive()) {
            this.start();
        } else {
            this.stopPerforming();
            Object object = this.runLock;
            synchronized (object) {
                this.runLock.notifyAll();
            }
        }
        try {
            this.join(1L);
        }
        catch (InterruptedException interruptedException) {
        }
        this.quanta.removeAllElements();
        this.quanta = null;
        this.waitingThreads.removeAllElements();
        this.currentQuantum = null;
        this.runLock = null;
        this.freezeLock = null;
    }

    public Sequence() {
        this.setName("Sequence-" + ++count);
        this.quanta = new Vector(10, 10);
        this.waitingThreads = new Vector(3, 2);
        ++coun;
    }
}
