/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.HashMap;
import is.dimon.util.Iterator;

class HashMap.2
extends AbstractCollection {
    public Iterator iterator() {
        return new HashMap.HashIterator(HashMap.this, HashMap.access$2000271());
    }

    public int size() {
        return HashMap.this.count;
    }

    public boolean contains(Object o) {
        return HashMap.this.containsValue(o);
    }

    public void clear() {
        HashMap.this.clear();
    }

    HashMap.2() {
    }
}
