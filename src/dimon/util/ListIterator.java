/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Iterator;

public interface ListIterator
extends Iterator {
    public boolean hasNext();

    public Object next();

    public boolean hasPrevious();

    public Object previous();

    public int nextIndex();

    public int previousIndex();

    public void remove();

    public void set(Object var1);

    public void add(Object var1);
}
