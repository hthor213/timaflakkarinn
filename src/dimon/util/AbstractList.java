/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.Collection;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Iterator;
import is.dimon.util.List;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.UnsupportedOperationException;

public abstract class AbstractList
extends AbstractCollection
implements List {
    protected transient int modCount;

    public boolean add(Object o) {
        this.add(this.size(), o);
        return true;
    }

    public abstract Object get(int var1);

    public Object set(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    public void add(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    public Object remove(int index) {
        throw new UnsupportedOperationException();
    }

    public int indexOf(Object o) {
        return this.indexOf(o, 0);
    }

    /*
     * Unable to fully structure code
     */
    public int indexOf(Object o, int index) {
        block2: {
            e = this.listIterator(index);
            if (o != null) ** GOTO lbl9
            while (e.hasNext()) {
                if (e.next() != null) continue;
                return e.previousIndex();
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                if (!o.equals(e.next())) continue;
                return e.previousIndex();
lbl9:
                // 2 sources

                ** while (e.hasNext())
            }
        }
        return -1;
    }

    public int lastIndexOf(Object o) {
        return this.lastIndexOf(o, this.size() - 1);
    }

    /*
     * Unable to fully structure code
     */
    public int lastIndexOf(Object o, int index) {
        block2: {
            e = this.listIterator(index + 1);
            if (o != null) ** GOTO lbl9
            while (e.hasPrevious()) {
                if (e.previous() != null) continue;
                return e.nextIndex();
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                if (!o.equals(e.previous())) continue;
                return e.nextIndex();
lbl9:
                // 2 sources

                ** while (e.hasPrevious())
            }
        }
        return -1;
    }

    public void removeRange(int fromIndex, int toIndex) {
        if (fromIndex > toIndex) {
            throw new IllegalArgumentException("fromIndex: " + fromIndex + ", toIndex: " + toIndex);
        }
        if (toIndex > this.size()) {
            throw new IndexOutOfBoundsException("Index: " + toIndex);
        }
        int i = fromIndex;
        while (i < toIndex) {
            this.remove(fromIndex);
            ++i;
        }
    }

    public boolean addAll(int index, Collection c) {
        boolean modified = false;
        Iterator e = c.iterator();
        while (e.hasNext()) {
            this.add(index++, e.next());
            modified = true;
        }
        return modified;
    }

    public Iterator iterator() {
        return new Itr();
    }

    public ListIterator listIterator() {
        return this.listIterator(0);
    }

    public ListIterator listIterator(int index) {
        if (index < 0 || index > this.size()) {
            throw new IndexOutOfBoundsException("Index: " + index);
        }
        return new ListItr(index);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof List)) {
            return false;
        }
        ListIterator e1 = this.listIterator();
        ListIterator e2 = ((List)o).listIterator();
        while (e1.hasNext() && e2.hasNext()) {
            boolean bl;
            Object o1 = e1.next();
            Object o2 = e2.next();
            if (o1 == null) {
                if (o2 == null) continue;
                bl = false;
            } else {
                bl = o1.equals(o2);
            }
            if (bl) continue;
            return false;
        }
        return !e1.hasNext() && !e2.hasNext();
    }

    public int hashCode() {
        int hashCode = 1;
        Iterator i = this.iterator();
        while (i.hasNext()) {
            Object obj = i.next();
            hashCode = 31 * hashCode + (obj == null ? 0 : obj.hashCode());
        }
        return hashCode;
    }

    private class Itr
    implements Iterator {
        private int cursor;
        private int lastRet = -1;
        private int expectedModCount;

        public boolean hasNext() {
            return this.cursor != AbstractList.this.size();
        }

        public Object next() {
            try {
                Object next = AbstractList.this.get(this.cursor);
                this.checkForComodification();
                this.lastRet = this.cursor++;
                return next;
            }
            catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                this.checkForComodification();
                throw new NoSuchElementException();
            }
        }

        public void remove() {
            if (this.lastRet == -1) {
                throw new IllegalStateException();
            }
            try {
                AbstractList.this.remove(this.lastRet);
                if (this.lastRet < this.cursor) {
                    --this.cursor;
                }
                this.lastRet = -1;
                int newModCount = AbstractList.this.modCount;
                if (newModCount - this.expectedModCount > 1) {
                    throw new ConcurrentModificationException();
                }
                this.expectedModCount = newModCount;
            }
            catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                throw new ConcurrentModificationException();
            }
        }

        final void checkForComodification() {
            if (AbstractList.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
        }

        Itr() {
            AbstractList.this = AbstractList.this;
            this.expectedModCount = AbstractList.this.modCount;
        }
    }

    private class ListItr
    extends Itr
    implements ListIterator {
        ListItr(int index) {
            AbstractList.this = AbstractList.this;
            ((Itr)this).cursor = index;
        }

        public boolean hasPrevious() {
            return ((Itr)this).cursor != 0;
        }

        public Object previous() {
            try {
                ListItr listItr = this;
                int n = ((Itr)listItr).cursor - 1;
                ((Itr)listItr).cursor = n;
                Object previous = AbstractList.this.get(n);
                this.checkForComodification();
                ((Itr)this).lastRet = ((Itr)this).cursor;
                return previous;
            }
            catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                this.checkForComodification();
                throw new NoSuchElementException();
            }
        }

        public int nextIndex() {
            return ((Itr)this).cursor;
        }

        public int previousIndex() {
            return ((Itr)this).cursor - 1;
        }

        public void set(Object o) {
            if (((Itr)this).lastRet == -1) {
                throw new IllegalStateException();
            }
            try {
                AbstractList.this.set(((Itr)this).lastRet, o);
                int newModCount = AbstractList.this.modCount;
                if (newModCount - ((Itr)this).expectedModCount > 1) {
                    throw new ConcurrentModificationException();
                }
                ((Itr)this).expectedModCount = newModCount;
            }
            catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                throw new ConcurrentModificationException();
            }
        }

        public void add(Object o) {
            try {
                AbstractList.this.add(((Itr)this).cursor, o);
                ((Itr)this).lastRet = -1;
                int newModCount = AbstractList.this.modCount;
                if (newModCount - ((Itr)this).expectedModCount > 1) {
                    throw new ConcurrentModificationException();
                }
                ((Itr)this).expectedModCount = newModCount;
            }
            catch (IndexOutOfBoundsException indexOutOfBoundsException) {
                throw new ConcurrentModificationException();
            }
        }
    }
}
