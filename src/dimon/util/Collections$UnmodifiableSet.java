/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collections;
import is.dimon.util.Set;
import java.io.Serializable;

static class Collections.UnmodifiableSet
extends Collections.UnmodifiableCollection
implements Set,
Serializable {
    Collections.UnmodifiableSet(Set s) {
        super(s);
    }

    public boolean equals(Object o) {
        return ((Collections.UnmodifiableCollection)this).c.equals(o);
    }

    public int hashCode() {
        return ((Collections.UnmodifiableCollection)this).c.hashCode();
    }
}
