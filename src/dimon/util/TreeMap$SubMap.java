/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractMap;
import is.dimon.util.AbstractSet;
import is.dimon.util.Comparator;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.Set;
import is.dimon.util.SortedMap;
import is.dimon.util.TreeMap;
import java.io.Serializable;

private class TreeMap.SubMap
extends AbstractMap
implements SortedMap,
Serializable {
    private boolean fromStart = false;
    private boolean toEnd = false;
    private Object fromKey;
    private Object toKey;
    private transient Set entries = new EntriesView();

    TreeMap.SubMap(Object fromKey, Object toKey) {
        TreeMap.this = TreeMap.this;
        if (TreeMap.this.compare(fromKey, toKey) > 0) {
            throw new IllegalArgumentException("fromKey > toKey");
        }
        this.fromKey = fromKey;
        this.toKey = toKey;
    }

    TreeMap.SubMap(Object key, boolean headMap) {
        TreeMap.this = TreeMap.this;
        if (headMap) {
            this.fromStart = true;
            this.toKey = key;
        } else {
            this.toEnd = true;
            this.fromKey = key;
        }
    }

    TreeMap.SubMap(boolean fromStart, Object fromKey, boolean toEnd, Object toKey) {
        TreeMap.this = TreeMap.this;
        this.fromStart = fromStart;
        this.fromKey = fromKey;
        this.toEnd = toEnd;
        this.toKey = toKey;
    }

    public boolean isEmpty() {
        return this.entries.isEmpty();
    }

    public boolean containsKey(Object key) {
        return this.inRange(key) && TreeMap.this.containsKey(key);
    }

    public Object get(Object key) {
        if (!this.inRange(key)) {
            return null;
        }
        return TreeMap.this.get(key);
    }

    public Comparator comparator() {
        return TreeMap.this.comparator;
    }

    public Object firstKey() {
        return TreeMap.key(this.fromStart ? TreeMap.this.firstEntry() : TreeMap.this.getCeilEntry(this.fromKey));
    }

    public Object lastKey() {
        return TreeMap.key(this.toEnd ? TreeMap.this.lastEntry() : TreeMap.this.getPrecedingEntry(this.toKey));
    }

    public Set entries() {
        return this.entries;
    }

    public SortedMap subMap(Object fromKey, Object toKey) {
        if (!this.inRange(fromKey)) {
            throw new IllegalArgumentException("fromKey out of range");
        }
        if (!this.inRange2(toKey)) {
            throw new IllegalArgumentException("toKey out of range");
        }
        return new TreeMap.SubMap(fromKey, toKey);
    }

    public SortedMap headMap(Object toKey) {
        if (!this.inRange2(toKey)) {
            throw new IllegalArgumentException("toKey out of range");
        }
        return new TreeMap.SubMap(this.fromStart, this.fromKey, false, toKey);
    }

    public SortedMap tailMap(Object fromKey) {
        if (!this.inRange(fromKey)) {
            throw new IllegalArgumentException("fromKey out of range");
        }
        return new TreeMap.SubMap(false, fromKey, this.toEnd, this.toKey);
    }

    private boolean inRange(Object key) {
        return !(!this.fromStart && TreeMap.this.compare(key, this.fromKey) < 0 || !this.toEnd && TreeMap.this.compare(key, this.toKey) >= 0);
    }

    private boolean inRange2(Object key) {
        return !(!this.fromStart && TreeMap.this.compare(key, this.fromKey) < 0 || !this.toEnd && TreeMap.this.compare(key, this.toKey) > 0);
    }

    private class EntriesView
    extends AbstractSet {
        private transient int size = -1;
        private transient int sizeModCount;

        public int size() {
            if (this.size == -1 || this.sizeModCount != TreeMap.this.modCount) {
                this.size = 0;
                this.sizeModCount = TreeMap.this.modCount;
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
            TreeMap.Entry node = TreeMap.this.getEntry(key);
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
            TreeMap.Entry node = TreeMap.this.getEntry(key);
            if (node != null && TreeMap.valEquals(node.getValue(), entry.getValue())) {
                TreeMap.this.deleteEntry(node);
                return true;
            }
            return false;
        }

        public Iterator iterator() {
            TreeMap treeMap = TreeMap.this;
            treeMap.getClass();
            return new TreeMap.Iterator(treeMap, SubMap.this.fromStart ? TreeMap.this.firstEntry() : TreeMap.this.getCeilEntry(SubMap.this.fromKey), SubMap.this.toEnd ? null : TreeMap.this.getCeilEntry(SubMap.this.toKey));
        }

        EntriesView() {
            SubMap.this = SubMap.this;
        }
    }
}
