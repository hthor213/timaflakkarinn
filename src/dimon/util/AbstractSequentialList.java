/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;

public abstract class AbstractSequentialList
extends AbstractList {
    public Object get(int index) {
        ListIterator e = this.listIterator(index);
        try {
            return e.next();
        }
        catch (NoSuchElementException noSuchElementException) {
            throw new IndexOutOfBoundsException("Index: " + index);
        }
    }

    public Object set(int index, Object element) {
        ListIterator e = this.listIterator(index);
        try {
            Object oldVal = e.next();
            e.set(element);
            return oldVal;
        }
        catch (NoSuchElementException noSuchElementException) {
            throw new IndexOutOfBoundsException("Index: " + index);
        }
    }

    public void add(int index, Object element) {
        ListIterator e = this.listIterator(index);
        e.add(element);
    }

    public Object remove(int index) {
        Object outCast;
        ListIterator e = this.listIterator(index);
        try {
            outCast = e.next();
        }
        catch (NoSuchElementException noSuchElementException) {
            throw new IndexOutOfBoundsException("Index: " + index);
        }
        e.remove();
        return outCast;
    }

    public void removeRange(int fromIndex, int toIndex) {
        if (fromIndex > toIndex) {
            throw new IllegalArgumentException("fromIndex > toIndex");
        }
        if (toIndex > this.size()) {
            throw new IndexOutOfBoundsException("Index: " + toIndex);
        }
        ListIterator e = this.listIterator(fromIndex);
        int i = fromIndex;
        while (i < toIndex) {
            e.next();
            e.remove();
            ++i;
        }
    }

    public boolean addAll(int index, Collection c) {
        boolean modified = false;
        ListIterator e1 = this.listIterator(index);
        Iterator e2 = c.iterator();
        while (e2.hasNext()) {
            e1.add(e2.next());
            e1.next();
            modified = true;
        }
        return modified;
    }

    public Iterator iterator() {
        return this.listIterator();
    }

    public abstract ListIterator listIterator(int var1);
}
