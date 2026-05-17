/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Comparator;
import is.dimon.util.SortedSet;

static class Collections.SynchronizedSortedSet
extends Collections.SynchronizedSet
implements SortedSet {
    private SortedSet ss;

    Collections.SynchronizedSortedSet(SortedSet s) {
        super(s);
        this.ss = s;
    }

    Collections.SynchronizedSortedSet(SortedSet s, Object mutex) {
        super(s, mutex);
        this.ss = s;
    }

    public Comparator comparator() {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Comparator comparator = this.ss.comparator();
            Object var3_3 = null;
            return comparator;
        }
    }

    public SortedSet subSet(Object fromElement, Object toElement) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedSet synchronizedSortedSet = new Collections.SynchronizedSortedSet(this.ss.subSet(fromElement, toElement), ((Collections.SynchronizedCollection)this).mutex);
            Object var5_5 = null;
            return synchronizedSortedSet;
        }
    }

    public SortedSet headSet(Object toElement) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedSet synchronizedSortedSet = new Collections.SynchronizedSortedSet(this.ss.headSet(toElement), ((Collections.SynchronizedCollection)this).mutex);
            Object var4_4 = null;
            return synchronizedSortedSet;
        }
    }

    public SortedSet tailSet(Object fromElement) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedSet synchronizedSortedSet = new Collections.SynchronizedSortedSet(this.ss.tailSet(fromElement), ((Collections.SynchronizedCollection)this).mutex);
            Object var4_4 = null;
            return synchronizedSortedSet;
        }
    }

    public Object first() {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Object object2 = this.ss.first();
            Object var3_3 = null;
            return object2;
        }
    }

    public Object last() {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Object object2 = this.ss.last();
            Object var3_3 = null;
            return object2;
        }
    }
}
