/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import java.io.Serializable;

static class Collections.SynchronizedCollection
implements Collection,
Serializable {
    private Collection c;
    private Object mutex;

    Collections.SynchronizedCollection(Collection c) {
        this.c = c;
        this.mutex = this;
    }

    Collections.SynchronizedCollection(Collection c, Object mutex) {
        this.c = c;
        this.mutex = mutex;
    }

    public int size() {
        Object object = this.mutex;
        synchronized (object) {
            int n = this.c.size();
            Object var3_3 = null;
            return n;
        }
    }

    public boolean isEmpty() {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.isEmpty();
            Object var3_3 = null;
            return bl;
        }
    }

    public boolean contains(Object o) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.contains(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public Object[] toArray() {
        Object object = this.mutex;
        synchronized (object) {
            Object[] objectArray = this.c.toArray();
            Object var3_3 = null;
            return objectArray;
        }
    }

    public Object[] toArray(Object[] a) {
        Object object = this.mutex;
        synchronized (object) {
            Object[] objectArray = this.c.toArray(a);
            Object var4_4 = null;
            return objectArray;
        }
    }

    public Iterator iterator() {
        return this.c.iterator();
    }

    public boolean add(Object o) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.add(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean remove(Object o) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.remove(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean containsAll(Collection coll) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.containsAll(coll);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean addAll(Collection coll) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.addAll(coll);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean removeAll(Collection coll) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.removeAll(coll);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean retainAll(Collection coll) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.c.retainAll(coll);
            Object var4_4 = null;
            return bl;
        }
    }

    public void clear() {
        Object object = this.mutex;
        synchronized (object) {
            this.c.clear();
        }
    }

    static /* synthetic */ Object access$0(Collections.SynchronizedCollection $0) {
        return $0.mutex;
    }

    static /* synthetic */ Collection access$1(Collections.SynchronizedCollection $0) {
        return $0.c;
    }
}
