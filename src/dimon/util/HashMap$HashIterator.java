/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.HashMap;
import is.dimon.util.Iterator;
import is.dimon.util.NoSuchElementException;

private class HashMap.HashIterator
implements Iterator {
    HashMap.Entry[] table;
    int index;
    HashMap.Entry entry;
    HashMap.Entry lastReturned;
    int type;
    private int expectedModCount;

    HashMap.HashIterator(int type) {
        this.table = HashMap.this.table;
        this.index = this.table.length;
        this.entry = null;
        this.lastReturned = null;
        this.expectedModCount = HashMap.this.modCount;
        this.type = type;
    }

    public boolean hasNext() {
        if (this.entry != null) {
            return true;
        }
        while (this.index-- > 0) {
            this.entry = this.table[this.index];
            if (this.entry == null) continue;
            return true;
        }
        return false;
    }

    public Object next() {
        if (HashMap.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        if (this.entry == null) {
            while (this.index-- > 0 && (this.entry = this.table[this.index]) == null) {
            }
        }
        if (this.entry != null) {
            HashMap.Entry e = this.lastReturned = this.entry;
            this.entry = e.next;
            return this.type == HashMap.access$2000071() ? e.key : (this.type == HashMap.access$2000271() ? e.value : e);
        }
        throw new NoSuchElementException();
    }

    public void remove() {
        if (this.lastReturned == null) {
            throw new IllegalStateException();
        }
        if (HashMap.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        HashMap.Entry[] tab = HashMap.this.table;
        int index = (this.lastReturned.hash & Integer.MAX_VALUE) % tab.length;
        HashMap.Entry e = tab[index];
        HashMap.Entry prev = null;
        while (e != null) {
            if (e == this.lastReturned) {
                ++HashMap.this.modCount;
                ++this.expectedModCount;
                if (prev == null) {
                    tab[index] = e.next;
                } else {
                    prev.next = e.next;
                }
                --HashMap.this.count;
                this.lastReturned = null;
                return;
            }
            prev = e;
            e = e.next;
        }
        throw new ConcurrentModificationException();
    }
}
