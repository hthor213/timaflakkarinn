/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Comparator;
import is.dimon.util.SortedMap;
import java.io.Serializable;

static class Collections.UnmodifiableSortedMap
extends Collections.UnmodifiableMap
implements SortedMap,
Serializable {
    private SortedMap sm;

    Collections.UnmodifiableSortedMap(SortedMap m) {
        super(m);
        this.sm = m;
    }

    public Comparator comparator() {
        return this.sm.comparator();
    }

    public SortedMap subMap(Object fromKey, Object toKey) {
        return new Collections.UnmodifiableSortedMap(this.sm.subMap(fromKey, toKey));
    }

    public SortedMap headMap(Object toKey) {
        return new Collections.UnmodifiableSortedMap(this.sm.headMap(toKey));
    }

    public SortedMap tailMap(Object fromKey) {
        return new Collections.UnmodifiableSortedMap(this.sm.tailMap(fromKey));
    }

    public Object firstKey() {
        return this.sm.firstKey();
    }

    public Object lastKey() {
        return this.sm.lastKey();
    }
}
