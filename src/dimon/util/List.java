/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.ListIterator;

public interface List
extends Collection {
    public int size();

    public boolean isEmpty();

    public boolean contains(Object var1);

    public Iterator iterator();

    public Object[] toArray();

    public boolean add(Object var1);

    public boolean remove(Object var1);

    public boolean containsAll(Collection var1);

    public boolean addAll(Collection var1);

    public boolean removeAll(Collection var1);

    public boolean retainAll(Collection var1);

    public void clear();

    public boolean equals(Object var1);

    public int hashCode();

    public Object get(int var1);

    public Object set(int var1, Object var2);

    public void add(int var1, Object var2);

    public Object remove(int var1);

    public int indexOf(Object var1);

    public int indexOf(Object var1, int var2);

    public int lastIndexOf(Object var1);

    public int lastIndexOf(Object var1, int var2);

    public void removeRange(int var1, int var2);

    public boolean addAll(int var1, Collection var2);

    public ListIterator listIterator();

    public ListIterator listIterator(int var1);
}
