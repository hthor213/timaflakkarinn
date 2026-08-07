/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Comparator;
import is.dimon.util.Map;

public interface SortedMap
extends Map {
    public Comparator comparator();

    public SortedMap subMap(Object var1, Object var2);

    public SortedMap headMap(Object var1);

    public SortedMap tailMap(Object var1);

    public Object firstKey();

    public Object lastKey();
}
