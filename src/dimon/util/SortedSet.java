/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Comparator;
import is.dimon.util.Set;

public interface SortedSet
extends Set {
    public Comparator comparator();

    public SortedSet subSet(Object var1, Object var2);

    public SortedSet headSet(Object var1);

    public SortedSet tailSet(Object var1);

    public Object first();

    public Object last();
}
