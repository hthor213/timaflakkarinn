/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.TreeMap;

private class TreeMap.SubMap.EntriesView
extends AbstractSet {
    private transient int size = -1;
    private transient int sizeModCount;

    public int size() {
        if (this.size == -1 || this.sizeModCount != SubMap.this.this$0.modCount) {
            this.size = 0;
            this.sizeModCount = SubMap.this.this$0.modCount;
            Iterator i = this.iterator();
            while (i.hasNext()) {
                ++this.size;
                i.next();
            }
        }
        return this.size;
    }

    public boolean isEmpty() {
        return !this.iterator().hasNext();
    }

    public boolean contains(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object key = entry.getKey();
        if (!SubMap.this.inRange(key)) {
            return false;
        }
        TreeMap.Entry node = SubMap.this.this$0.getEntry(key);
        return node != null && TreeMap.valEquals(node.getValue(), entry.getValue());
    }

    public boolean remove(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object key = entry.getKey();
        if (!SubMap.this.inRange(key)) {
            return false;
        }
        TreeMap.Entry node = SubMap.this.this$0.getEntry(key);
        if (node != null && TreeMap.valEquals(node.getValue(), entry.getValue())) {
            SubMap.this.this$0.deleteEntry(node);
            return true;
        }
        return false;
    }

    public Iterator iterator() {
        TreeMap treeMap = SubMap.this.this$0;
        treeMap.getClass();
        return new TreeMap.Iterator(treeMap, SubMap.this.fromStart ? SubMap.this.this$0.firstEntry() : SubMap.this.this$0.getCeilEntry(SubMap.this.fromKey), SubMap.this.toEnd ? null : SubMap.this.this$0.getCeilEntry(SubMap.this.toKey));
    }

    TreeMap.SubMap.EntriesView() {
        SubMap.this = SubMap.this;
    }
}
