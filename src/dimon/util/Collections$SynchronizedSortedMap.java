/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Comparator;
import is.dimon.util.SortedMap;

static class Collections.SynchronizedSortedMap
extends Collections.SynchronizedMap
implements SortedMap {
    private SortedMap sm;

    Collections.SynchronizedSortedMap(SortedMap m) {
        super(m);
        this.sm = m;
    }

    Collections.SynchronizedSortedMap(SortedMap m, Object mutex) {
        super(m, mutex);
        this.sm = m;
    }

    public Comparator comparator() {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Comparator comparator = this.sm.comparator();
            Object var3_3 = null;
            return comparator;
        }
    }

    public SortedMap subMap(Object fromKey, Object toKey) {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedMap synchronizedSortedMap = new Collections.SynchronizedSortedMap(this.sm.subMap(fromKey, toKey), ((Collections.SynchronizedMap)this).mutex);
            Object var5_5 = null;
            return synchronizedSortedMap;
        }
    }

    public SortedMap headMap(Object toKey) {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedMap synchronizedSortedMap = new Collections.SynchronizedSortedMap(this.sm.headMap(toKey), ((Collections.SynchronizedMap)this).mutex);
            Object var4_4 = null;
            return synchronizedSortedMap;
        }
    }

    public SortedMap tailMap(Object fromKey) {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Collections.SynchronizedSortedMap synchronizedSortedMap = new Collections.SynchronizedSortedMap(this.sm.tailMap(fromKey), ((Collections.SynchronizedMap)this).mutex);
            Object var4_4 = null;
            return synchronizedSortedMap;
        }
    }

    public Object firstKey() {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Object object2 = this.sm.firstKey();
            Object var3_3 = null;
            return object2;
        }
    }

    public Object lastKey() {
        Object object = ((Collections.SynchronizedMap)this).mutex;
        synchronized (object) {
            Object object2 = this.sm.lastKey();
            Object var3_3 = null;
            return object2;
        }
    }
}
