/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSequentialList;
import is.dimon.util.Collection;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.List;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class LinkedList
extends AbstractSequentialList
implements List,
Cloneable,
Serializable {
    private transient Entry header;
    private transient int size;

    public LinkedList() {
        this.header.next = this.header.previous = (this.header = new Entry(null, null, null));
    }

    public LinkedList(Collection c) {
        this();
        this.addAll(c);
    }

    public Object getFirst() {
        if (this.size == 0) {
            throw new NoSuchElementException();
        }
        return this.header.next.element;
    }

    public Object getLast() {
        if (this.size == 0) {
            throw new NoSuchElementException();
        }
        return this.header.previous.element;
    }

    public Object removeFirst() {
        Object first = this.header.next.element;
        this.remove(this.header.next);
        return first;
    }

    public Object removeLast() {
        Object last = this.header.previous.element;
        this.remove(this.header.previous);
        return last;
    }

    public void addFirst(Object o) {
        this.addBefore(o, this.header.next);
    }

    public void addLast(Object o) {
        this.addBefore(o, this.header);
    }

    public int size() {
        return this.size;
    }

    public void clear() {
        ++this.modCount;
        this.header.next = this.header.previous = (this.header = new Entry(null, null, null));
        this.size = 0;
    }

    public ListIterator listIterator(int index) {
        return new ListItr(index);
    }

    private Entry addBefore(Object o, Entry e) {
        Entry newEntry;
        newEntry.previous.next = newEntry = new Entry(o, e, e.previous);
        newEntry.next.previous = newEntry;
        ++this.size;
        ++this.modCount;
        return newEntry;
    }

    private void remove(Entry e) {
        if (e == this.header) {
            throw new NoSuchElementException();
        }
        e.previous.next = e.next;
        e.next.previous = e.previous;
        --this.size;
        ++this.modCount;
    }

    public Object clone() {
        return new LinkedList(this);
    }

    private synchronized void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.size);
        ListIterator i = this.listIterator();
        while (i.hasNext()) {
            s.writeObject(i.next());
        }
    }

    private synchronized void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        int size = s.readInt();
        this.header.next = this.header.previous = (this.header = new Entry(null, null, null));
        int i = 0;
        while (i < size) {
            this.add(s.readObject());
            ++i;
        }
    }

    private class ListItr
    implements ListIterator {
        private Entry lastReturned;
        private Entry next;
        private int nextIndex;
        private boolean forward;
        private int expectedModCount;

        ListItr(int index) {
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

    private static class Entry {
        Object element;
        Entry next;
        Entry previous;

        Entry(Object element, Entry next, Entry previous) {
            this.element = element;
            this.next = next;
            this.previous = previous;
        }
    }
}
