/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.LinkedList;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;

private class LinkedList.ListItr
implements ListIterator {
    private LinkedList.Entry lastReturned;
    private LinkedList.Entry next;
    private int nextIndex;
    private boolean forward;
    private int expectedModCount;

    LinkedList.ListItr(int index) {
        LinkedList.this = LinkedList.this;
        this.lastReturned = LinkedList.this.header;
        this.expectedModCount = LinkedList.this.modCount;
        if (index < 0 || index > LinkedList.this.size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + LinkedList.this.size);
        }
        if (index < LinkedList.this.size / 2) {
            this.next = ((LinkedList)LinkedList.this).header.next;
            this.nextIndex = 0;
            while (this.nextIndex < index) {
                this.next = this.next.next;
                ++this.nextIndex;
            }
        } else {
            this.next = LinkedList.this.header;
            this.nextIndex = LinkedList.this.size;
            while (this.nextIndex > index) {
                this.next = this.next.previous;
                --this.nextIndex;
            }
        }
    }

    public boolean hasNext() {
        return this.nextIndex != LinkedList.this.size;
    }

    public Object next() {
        this.checkForComodification();
        if (this.nextIndex == LinkedList.this.size) {
            throw new NoSuchElementException();
        }
        this.lastReturned = this.next;
        this.next = this.next.next;
        ++this.nextIndex;
        this.forward = true;
        return this.lastReturned.element;
    }

    public boolean hasPrevious() {
        return this.nextIndex != 0;
    }

    public Object previous() {
        if (this.nextIndex == 0) {
            throw new NoSuchElementException();
        }
        this.lastReturned = this.next = this.next.previous;
        --this.nextIndex;
        this.checkForComodification();
        this.forward = false;
        return this.lastReturned.element;
    }

    public int nextIndex() {
        return this.nextIndex;
    }

    public int previousIndex() {
        return this.nextIndex - 1;
    }

    public void remove() {
        LinkedList.this.remove(this.lastReturned);
        this.lastReturned = LinkedList.this.header;
        if (this.forward) {
            --this.nextIndex;
        }
        ++this.expectedModCount;
    }

    public void set(Object o) {
        if (this.lastReturned == LinkedList.this.header) {
            throw new IllegalStateException();
        }
        this.checkForComodification();
        this.lastReturned.element = o;
    }

    public void add(Object o) {
        this.checkForComodification();
        this.lastReturned = LinkedList.this.header;
        this.next = LinkedList.this.addBefore(o, this.next);
        ++this.expectedModCount;
    }

    final void checkForComodification() {
        if (LinkedList.this.modCount != this.expectedModCount) {
            throw new ConcurrentModificationException();
        }
    }
}
