/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.HashMap;
import is.dimon.util.Iterator;
import is.dimon.util.Map;

class HashMap.3
extends AbstractSet {
    public Iterator iterator() {
        return new HashMap.HashIterator(HashMap.this, HashMap.access$2000371());
    }

    public boolean contains(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object key = entry.getKey();
        HashMap.Entry[] tab = HashMap.this.table;
        int hash = key == null ? 0 : key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        HashMap.Entry e = tab[index];
        while (e != null) {
            if (e.hash == hash && e.equals(entry)) {
                return true;
            }
            e = e.next;
        }
        return false;
    }

    public boolean remove(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object key = entry.getKey();
        HashMap.Entry[] tab = HashMap.this.table;
        int hash = key == null ? 0 : key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        HashMap.Entry e = tab[index];
        HashMap.Entry prev = null;
        while (e != null) {
            if (e.hash == hash && e.equals(entry)) {
                ++HashMap.this.modCount;
                if (prev != null) {
                    prev.next = e.next;
                } else {
                    tab[index] = e.next;
                }
                --HashMap.this.count;
                e.value = null;
                return true;
            }
            prev = e;
            e = e.next;
        }
        return false;
    }

    public int size() {
        return HashMap.this.count;
    }

    public void clear() {
        HashMap.this.clear();
    }

    HashMap.3() {
    }
}
