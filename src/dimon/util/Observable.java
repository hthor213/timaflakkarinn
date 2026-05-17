/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Observer;
import is.dimon.util.Vector;

public class Observable {
    private boolean changed = false;
    private Vector obs = new Vector();

    public synchronized void addObserver(Observer o) {
        if (!this.obs.contains(o)) {
            this.obs.addElement(o);
        }
    }

    public synchronized void deleteObserver(Observer o) {
        this.obs.removeElement(o);
    }

    public void notifyObservers() {
        this.notifyObservers(null);
    }

    public void notifyObservers(Object arg) {
        Object[] arrLocal;
        Observable observable = this;
        synchronized (observable) {
            if (!this.changed) {
                Object var4_4 = null;
                return;
            }
            arrLocal = this.obs.toArray();
            this.changed = false;
        }
        int i = arrLocal.length - 1;
        while (i >= 0) {
            ((Observer)arrLocal[i]).update(this, arg);
            --i;
        }
    }

    public synchronized void deleteObservers() {
        this.obs.removeAllElements();
    }

    protected synchronized void setChanged() {
        this.changed = true;
    }

    protected synchronized void clearChanged() {
        this.changed = false;
    }

    public synchronized boolean hasChanged() {
        return this.changed;
    }

    public synchronized int countObservers() {
        return this.obs.size();
    }
}
