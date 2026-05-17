/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Iterator;
import is.dimon.util.UnsupportedOperationException;

private final class Collections.2
implements Iterator {
    Iterator i;

    public boolean hasNext() {
        return this.i.hasNext();
    }

    public Object next() {
        return this.i.next();
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    /* synthetic */ Collections.2(Collections.UnmodifiableCollection this$0) {
        this.i = this$0.c.iterator();
    }
}
