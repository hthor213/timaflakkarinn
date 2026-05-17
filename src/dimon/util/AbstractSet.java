/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.Set;

public abstract class AbstractSet
extends AbstractCollection
implements Set {
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Set)) {
            return false;
        }
        Collection c = (Collection)o;
        if (c.size() != this.size()) {
            return false;
        }
        return this.containsAll(c);
    }

    public int hashCode() {
        int h = 0;
        Iterator i = this.iterator();
        while (i.hasNext()) {
            Object obj = i.next();
            if (obj == null) continue;
            h += obj.hashCode();
        }
        return h;
    }
}
