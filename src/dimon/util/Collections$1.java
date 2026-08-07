/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.ListIterator;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.UnsupportedOperationException;

private final class Collections.1
implements ListIterator {
    private final /* synthetic */ Collections.SubList this$0;
    private ListIterator i;

    public boolean hasNext() {
        return this.nextIndex() < this.this$0.size;
    }

    public Object next() {
        if (this.hasNext()) {
            return this.i.next();
        }
        throw new NoSuchElementException();
    }

    public boolean hasPrevious() {
        return this.previousIndex() >= 0;
    }

    public Object previous() {
        if (this.hasPrevious()) {
            return this.i.previous();
        }
        throw new NoSuchElementException();
    }

    public int nextIndex() {
        return this.i.nextIndex() - this.this$0.offset;
    }

    public int previousIndex() {
        return this.i.previousIndex() - this.this$0.offset;
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    public void set(Object o) {
        this.i.set(o);
    }

    public void add(Object o) {
        throw new UnsupportedOperationException();
    }

    /* synthetic */ Collections.1(int val$index, Collections.SubList this$0) {
        this.this$0 = this$0;
        this.i = this$0.backer.listIterator(val$index + this$0.offset);
    }
}
