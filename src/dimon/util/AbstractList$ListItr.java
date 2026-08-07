/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;

private class AbstractList.ListItr
extends AbstractList.Itr
implements ListIterator {
    AbstractList.ListItr(int index) {
        super(AbstractList.this);
        AbstractList.this = AbstractList.this;
        ((AbstractList.Itr)this).cursor = index;
    }

    public boolean hasPrevious() {
        return ((AbstractList.Itr)this).cursor != 0;
    }

    public Object previous() {
        try {
            AbstractList.ListItr listItr = this;
            int n = ((AbstractList.Itr)listItr).cursor - 1;
            ((AbstractList.Itr)listItr).cursor = n;
            Object previous = AbstractList.this.get(n);
            this.checkForComodification();
            ((AbstractList.Itr)this).lastRet = ((AbstractList.Itr)this).cursor;
            return previous;
        }
        catch (IndexOutOfBoundsException indexOutOfBoundsException) {
            this.checkForComodification();
            throw new NoSuchElementException();
        }
    }

    public int nextIndex() {
        return ((AbstractList.Itr)this).cursor;
    }

    public int previousIndex() {
        return ((AbstractList.Itr)this).cursor - 1;
    }

    public void set(Object o) {
        if (((AbstractList.Itr)this).lastRet == -1) {
            throw new IllegalStateException();
        }
        try {
            AbstractList.this.set(((AbstractList.Itr)this).lastRet, o);
            int newModCount = AbstractList.this.modCount;
            if (newModCount - ((AbstractList.Itr)this).expectedModCount > 1) {
                throw new ConcurrentModificationException();
            }
            ((AbstractList.Itr)this).expectedModCount = newModCount;
        }
        catch (IndexOutOfBoundsException indexOutOfBoundsException) {
            throw new ConcurrentModificationException();
        }
    }

    public void add(Object o) {
        try {
            AbstractList.this.add(((AbstractList.Itr)this).cursor, o);
            ((AbstractList.Itr)this).lastRet = -1;
            int newModCount = AbstractList.this.modCount;
            if (newModCount - ((AbstractList.Itr)this).expectedModCount > 1) {
                throw new ConcurrentModificationException();
            }
            ((AbstractList.Itr)this).expectedModCount = newModCount;
        }
        catch (IndexOutOfBoundsException indexOutOfBoundsException) {
            throw new ConcurrentModificationException();
        }
    }
}
