/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.ListIterator;
import is.dimon.util.UnsupportedOperationException;

private final class Collections.3
implements ListIterator {
    ListIterator i;

    public boolean hasNext() {
        return this.i.hasNext();
    }

    public Object next() {
        return this.i.next();
    }

    public boolean hasPrevious() {
        return this.i.hasPrevious();
    }

    public Object previous() {
        return this.i.previous();
    }

    public int nextIndex() {
        return this.i.nextIndex();
    }

    public int previousIndex() {
        return this.i.previousIndex();
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    public void set(Object o) {
        throw new UnsupportedOperationException();
    }

    public void add(Object o) {
        throw new UnsupportedOperationException();
    }

    /* synthetic */ Collections.3(int val$index, Collections.UnmodifiableList this$0) {
        this.i = this$0.list.listIterator(val$index);
    }
}
