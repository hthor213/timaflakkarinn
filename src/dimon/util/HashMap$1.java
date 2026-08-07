/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.HashMap;
import is.dimon.util.Iterator;

class HashMap.1
extends AbstractSet {
    public Iterator iterator() {
        return new HashMap.HashIterator(HashMap.this, HashMap.access$2000071());
    }

    public int size() {
        return HashMap.this.count;
    }

    public boolean contains(Object o) {
        return HashMap.this.containsKey(o);
    }

    public boolean remove(Object o) {
        return HashMap.this.remove(o) != null;
    }

    public void clear() {
        HashMap.this.clear();
    }

    HashMap.1() {
    }
}
