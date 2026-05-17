/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Iterator;
import is.dimon.util.NoSuchElementException;

private class AbstractList.Itr
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

    AbstractList.Itr() {
        AbstractList.this = AbstractList.this;
        this.expectedModCount = AbstractList.this.modCount;
    }

    static /* synthetic */ int access$0(AbstractList.Itr $0) {
        return $0.cursor;
    }

    static /* synthetic */ void access$1(AbstractList.Itr $0, int $1) {
        $0.cursor = $1;
    }

    static /* synthetic */ int access$2(AbstractList.Itr $0) {
        return $0.lastRet;
    }

    static /* synthetic */ void access$3(AbstractList.Itr $0, int $1) {
        $0.lastRet = $1;
    }

    static /* synthetic */ int access$4(AbstractList.Itr $0) {
        return $0.expectedModCount;
    }

    static /* synthetic */ void access$5(AbstractList.Itr $0, int $1) {
        $0.expectedModCount = $1;
    }
}
