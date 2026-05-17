/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Hashtable;
import is.dimon.util.Iterator;
import is.dimon.util.Map;

class Hashtable.2
extends AbstractSet {
    public Iterator iterator() {
        return new Hashtable.Enumerator(Hashtable.this, Hashtable.access$2000271(), true);
    }

    public boolean contains(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry)o;
        Object key = entry.getKey();
        Hashtable.Entry[] tab = Hashtable.this.table;
        int hash = key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        Hashtable.Entry e = tab[index];
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
        Hashtable.Entry[] tab = Hashtable.this.table;
        int hash = key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        Hashtable.Entry e = tab[index];
        Hashtable.Entry prev = null;
        while (e != null) {
            if (e.hash == hash && e.equals(entry)) {
                ++Hashtable.this.modCount;
                if (prev != null) {
                    prev.next = e.next;
                } else {
                    tab[index] = e.next;
                }
                --Hashtable.this.count;
                e.value = null;
                return true;
            }
            prev = e;
            e = e.next;
        }
        return false;
    }

    public int size() {
        return Hashtable.this.count;
    }

    public void clear() {
        Hashtable.this.clear();
    }

    Hashtable.2() {
    }
}
