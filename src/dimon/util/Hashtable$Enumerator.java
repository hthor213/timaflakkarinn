/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Enumeration;
import is.dimon.util.Hashtable;
import is.dimon.util.Iterator;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.UnsupportedOperationException;

private class Hashtable.Enumerator
implements Enumeration,
Iterator {
    Hashtable.Entry[] table;
    int index;
    Hashtable.Entry entry;
    Hashtable.Entry lastReturned;
    int type;
    boolean iterator;
    private int expectedModCount;

    Hashtable.Enumerator(int type, boolean iterator) {
        this.table = Hashtable.this.table;
        this.index = this.table.length;
        this.entry = null;
        this.lastReturned = null;
        this.expectedModCount = Hashtable.this.modCount;
        this.type = type;
        this.iterator = iterator;
    }

    public boolean hasMoreElements() {
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

    public Object nextElement() {
        if (this.entry == null) {
            while (this.index-- > 0 && (this.entry = this.table[this.index]) == null) {
            }
        }
        if (this.entry != null) {
            Hashtable.Entry e = this.lastReturned = this.entry;
            this.entry = e.next;
            return this.type == Hashtable.access$2000071() ? e.key : (this.type == Hashtable.access$2000571() ? e.value : e);
        }
        throw new NoSuchElementException("Hashtable Enumerator");
    }

    public boolean hasNext() {
        return this.hasMoreElements();
    }

    public Object next() {
        if (Hashtable.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        return this.nextElement();
    }

    public void remove() {
        if (!this.iterator) {
            throw new UnsupportedOperationException();
        }
        if (this.lastReturned == null) {
            throw new IllegalStateException("Hashtable Enumerator");
        }
        if (Hashtable.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        Hashtable hashtable = Hashtable.this;
        synchronized (hashtable) {
            try {
                Hashtable.Entry[] tab = Hashtable.this.table;
                int index = (this.lastReturned.hash & Integer.MAX_VALUE) % tab.length;
                Hashtable.Entry e = tab[index];
                Hashtable.Entry prev = null;
                while (e != null) {
                    if (e == this.lastReturned) {
                        ++Hashtable.this.modCount;
                        ++this.expectedModCount;
                        if (prev == null) {
                            tab[index] = e.next;
                        } else {
                            prev.next = e.next;
                        }
                        --Hashtable.this.count;
                        this.lastReturned = null;
                        Object var7_6 = null;
                        return;
                    }
                    prev = e;
                    e = e.next;
                }
                throw new ConcurrentModificationException();
            }
            catch (Throwable throwable) {
                Object var7_7 = null;
                throw throwable;
            }
        }
    }
}
