/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.List;
import is.dimon.util.ListIterator;

static class Collections.SynchronizedList
extends Collections.SynchronizedCollection
implements List {
    private List list;

    Collections.SynchronizedList(List list) {
        super(list);
        this.list = list;
    }

    public boolean equals(Object o) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            boolean bl = this.list.equals(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public int hashCode() {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = this.list.hashCode();
            Object var3_3 = null;
            return n;
        }
    }

    public Object get(int index) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Object object2 = this.list.get(index);
            Object var4_4 = null;
            return object2;
        }
    }

    public Object set(int index, Object element) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Object object2 = this.list.set(index, element);
            Object var5_5 = null;
            return object2;
        }
    }

    public void add(int index, Object element) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            this.list.add(index, element);
        }
    }

    public Object remove(int index) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            Object object2 = this.list.remove(index);
            Object var4_4 = null;
            return object2;
        }
    }

    public int indexOf(Object o) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = this.list.indexOf(o);
            Object var4_4 = null;
            return n;
        }
    }

    public int indexOf(Object o, int i) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = this.list.indexOf(o, i);
            Object var5_5 = null;
            return n;
        }
    }

    public int lastIndexOf(Object o) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = this.list.lastIndexOf(o);
            Object var4_4 = null;
            return n;
        }
    }

    public int lastIndexOf(Object o, int i) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = this.list.lastIndexOf(o, i);
            Object var5_5 = null;
            return n;
        }
    }

    public void removeRange(int fromIndex, int toIndex) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            this.list.removeRange(fromIndex, toIndex);
        }
    }

    public boolean addAll(int index, Collection c) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            boolean bl = this.list.addAll(index, c);
            Object var5_5 = null;
            return bl;
        }
    }

    public ListIterator listIterator() {
        return this.list.listIterator();
    }

    public ListIterator listIterator(int index) {
        return this.list.listIterator(index);
    }
}
