/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Iterator;

public interface Collection {
    public int size();

    public boolean isEmpty();

    public boolean contains(Object var1);

    public Iterator iterator();

    public Object[] toArray();

    public Object[] toArray(Object[] var1);

    public boolean add(Object var1);

    public boolean remove(Object var1);

    public boolean containsAll(Collection var1);

    public boolean addAll(Collection var1);

    public boolean removeAll(Collection var1);

    public boolean retainAll(Collection var1);

    public void clear();

    public boolean equals(Object var1);

    public int hashCode();
}
