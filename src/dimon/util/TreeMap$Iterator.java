/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Iterator;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.TreeMap;

private class TreeMap.Iterator
implements Iterator {
    private int type;
    private int expectedModCount;
    private TreeMap.Entry lastReturned;
    private TreeMap.Entry next;
    private TreeMap.Entry firstExcluded;

    TreeMap.Iterator(int type) {
        TreeMap.this = TreeMap.this;
        this.expectedModCount = TreeMap.this.modCount;
        this.type = type;
        this.next = TreeMap.this.firstEntry();
    }

    TreeMap.Iterator(TreeMap.Entry first, TreeMap.Entry firstExcluded) {
        TreeMap.this = TreeMap.this;
        this.expectedModCount = TreeMap.this.modCount;
        this.type = TreeMap.access$6();
        this.next = first;
        this.firstExcluded = firstExcluded;
    }

    public boolean hasNext() {
        return this.next != this.firstExcluded;
    }

    public Object next() {
        if (this.next == this.firstExcluded) {
            throw new NoSuchElementException();
        }
        if (TreeMap.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        this.lastReturned = this.next;
        this.next = TreeMap.this.successor(this.next);
        return this.type == TreeMap.access$0() ? this.lastReturned.key : (this.type == TreeMap.access$1() ? this.lastReturned.value : this.lastReturned);
    }

    public void remove() {
        if (this.lastReturned == null) {
            throw new IllegalStateException();
        }
        if (TreeMap.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
        TreeMap.this.deleteEntry(this.lastReturned);
        ++this.expectedModCount;
        this.lastReturned = null;
    }
}
