/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Comparator;
import is.dimon.util.SortedSet;
import java.io.Serializable;

static class Collections.UnmodifiableSortedSet
extends Collections.UnmodifiableSet
implements SortedSet,
Serializable {
    private SortedSet ss;

    Collections.UnmodifiableSortedSet(SortedSet s) {
        super(s);
        this.ss = s;
    }

    public Comparator comparator() {
        return this.ss.comparator();
    }

    public SortedSet subSet(Object fromElement, Object toElement) {
        return new Collections.UnmodifiableSortedSet(this.ss.subSet(fromElement, toElement));
    }

    public SortedSet headSet(Object toElement) {
        return new Collections.UnmodifiableSortedSet(this.ss.headSet(toElement));
    }

    public SortedSet tailSet(Object fromElement) {
        return new Collections.UnmodifiableSortedSet(this.ss.tailSet(fromElement));
    }

    public Object first() {
        return this.ss.first();
    }

    public Object last() {
        return this.ss.last();
    }
}
