/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;

private static final class Collections.4
extends AbstractList {
    private final /* synthetic */ Object val$o;
    private final /* synthetic */ int val$n;

    public int size() {
        return this.val$n;
    }

    public boolean contains(Object obj) {
        return this.val$n != 0 && this.val$o.equals(obj);
    }

    public Object get(int index) {
        if (index < 0 || index > this.val$n) {
            throw new IndexOutOfBoundsException("Index: " + index + ",Size: " + this.val$n);
        }
        return this.val$o;
    }

    /* synthetic */ Collections.4(int val$n, Object val$o) {
        this.val$n = val$n;
        this.val$o = val$o;
    }
}
