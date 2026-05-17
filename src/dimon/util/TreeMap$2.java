/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.Iterator;
import is.dimon.util.TreeMap;

private final class TreeMap.2
extends AbstractCollection {
    public Iterator iterator() {
        return new TreeMap.Iterator(TreeMap.this, TreeMap.access$1());
    }

    public int size() {
        return TreeMap.this.size();
    }

    public boolean contains(Object o) {
        TreeMap.Entry e = TreeMap.this.firstEntry();
        while (e != null) {
            if (TreeMap.valEquals(e.getValue(), o)) {
                return true;
            }
            e = TreeMap.this.successor(e);
        }
        return false;
    }

    public boolean remove(Object o) {
        TreeMap.Entry e = TreeMap.this.firstEntry();
        while (e != null) {
            if (TreeMap.valEquals(e.getValue(), o)) {
                TreeMap.this.deleteEntry(e);
                return true;
            }
            e = TreeMap.this.successor(e);
        }
        return false;
    }

    public void clear() {
        TreeMap.this.clear();
    }

    /* synthetic */ TreeMap.2() {
    }
}
