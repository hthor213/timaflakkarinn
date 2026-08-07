/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Set;

static class Collections.SynchronizedSet
extends Collections.SynchronizedCollection
implements Set {
    Collections.SynchronizedSet(Set s) {
        super(s);
    }

    Collections.SynchronizedSet(Set s, Object mutex) {
        super(s, mutex);
    }

    public boolean equals(Object o) {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            boolean bl = ((Collections.SynchronizedCollection)this).c.equals(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public int hashCode() {
        Object object = ((Collections.SynchronizedCollection)this).mutex;
        synchronized (object) {
            int n = ((Collections.SynchronizedCollection)this).c.hashCode();
            Object var3_3 = null;
            return n;
        }
    }
}
