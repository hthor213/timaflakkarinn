/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.UnsupportedOperationException;
import java.lang.reflect.Array;

public abstract class AbstractCollection
implements Collection {
    public abstract Iterator iterator();

    public abstract int size();

    public boolean isEmpty() {
        return this.size() == 0;
    }

    /*
     * Unable to fully structure code
     */
    public boolean contains(Object o) {
        block2: {
            e = this.iterator();
            if (o != null) ** GOTO lbl9
            while (e.hasNext()) {
                if (e.next() != null) continue;
                return true;
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                if (!o.equals(e.next())) continue;
                return true;
lbl9:
                // 2 sources

                ** while (e.hasNext())
            }
        }
        return false;
    }

    public Object[] toArray() {
        Object[] result = new Object[this.size()];
        Iterator e = this.iterator();
        int i = 0;
        while (e.hasNext()) {
            result[i] = e.next();
            ++i;
        }
        return result;
    }

    public Object[] toArray(Object[] a) {
        int size = this.size();
        if (a.length < size) {
            a = (Object[])Array.newInstance(a.getClass().getComponentType(), size);
        }
        Iterator it = this.iterator();
        int i = 0;
        while (i < size) {
            a[i] = it.next();
            ++i;
        }
        if (a.length > size) {
            a[size] = null;
        }
        return a;
    }

    public boolean add(Object o) {
        throw new UnsupportedOperationException();
    }

    /*
     * Unable to fully structure code
     */
    public boolean remove(Object o) {
        block2: {
            e = this.iterator();
            if (o != null) ** GOTO lbl11
            while (e.hasNext()) {
                if (e.next() != null) continue;
                e.remove();
                return true;
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                if (!o.equals(e.next())) continue;
                e.remove();
                return true;
lbl11:
                // 2 sources

                ** while (e.hasNext())
            }
        }
        return false;
    }

    public boolean containsAll(Collection c) {
        Iterator e = c.iterator();
        while (e.hasNext()) {
            if (this.contains(e.next())) continue;
            return false;
        }
        return true;
    }

    public boolean addAll(Collection c) {
        boolean modified = false;
        Iterator e = c.iterator();
        while (e.hasNext()) {
            if (!this.add(e.next())) continue;
            modified = true;
        }
        return modified;
    }

    public boolean removeAll(Collection c) {
        boolean modified = false;
        Iterator e = this.iterator();
        while (e.hasNext()) {
            if (!c.contains(e.next())) continue;
            e.remove();
            modified = true;
        }
        return modified;
    }

    public boolean retainAll(Collection c) {
        boolean modified = false;
        Iterator e = this.iterator();
        while (e.hasNext()) {
            if (c.contains(e.next())) continue;
            e.remove();
            modified = true;
        }
        return modified;
    }

    public void clear() {
        Iterator e = this.iterator();
        while (e.hasNext()) {
            e.next();
            e.remove();
        }
    }

    public String toString() {
        StringBuffer buf = new StringBuffer();
        Iterator e = this.iterator();
        buf.append("[");
        int maxIndex = this.size() - 1;
        int i = 0;
        while (i <= maxIndex) {
            buf.append(String.valueOf(e.next()));
            if (i < maxIndex) {
                buf.append(", ");
            }
            ++i;
        }
        buf.append("]");
        return buf.toString();
    }
}
