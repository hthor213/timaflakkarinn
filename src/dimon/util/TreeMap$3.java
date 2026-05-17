/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.TreeMap;

private final class TreeMap.3
extends AbstractSet {
    public Iterator iterator() {
        return new TreeMap.Iterator(TreeMap.this, TreeMap.access$6());
    }

    public boolean contains(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object value = entry.getValue();
        TreeMap.Entry p = TreeMap.this.getEntry(entry.getKey());
        return p != null && TreeMap.valEquals(p.getValue(), value);
    }

    public boolean remove(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object value = entry.getValue();
        TreeMap.Entry p = TreeMap.this.getEntry(entry.getKey());
        if (p != null && TreeMap.valEquals(p.getValue(), value)) {
            TreeMap.this.deleteEntry(p);
            return true;
        }
        return false;
    }

    public int size() {
        return TreeMap.this.size();
    }

    public void clear() {
        TreeMap.this.clear();
    }

    /* synthetic */ TreeMap.3() {
    }
}
