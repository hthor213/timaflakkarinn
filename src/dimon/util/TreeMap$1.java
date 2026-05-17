/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Iterator;
import is.dimon.util.TreeMap;

private final class TreeMap.1
extends AbstractSet {
    public Iterator iterator() {
        return new TreeMap.Iterator(TreeMap.this, TreeMap.access$0());
    }

    public int size() {
        return TreeMap.this.size();
    }

    public boolean contains(Object o) {
        return TreeMap.this.containsKey(o);
    }

    public boolean remove(Object o) {
        return TreeMap.this.remove(o) != null;
    }

    public void clear() {
        TreeMap.this.clear();
    }

    /* synthetic */ TreeMap.1() {
    }
}
