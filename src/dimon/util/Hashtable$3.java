/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.Hashtable;
import is.dimon.util.Iterator;

class Hashtable.3
extends AbstractCollection {
    public Iterator iterator() {
        return new Hashtable.Enumerator(Hashtable.this, Hashtable.access$2000571(), true);
    }

    public int size() {
        return Hashtable.this.count;
    }

    public boolean contains(Object o) {
        return Hashtable.this.containsValue(o);
    }

    public void clear() {
        Hashtable.this.clear();
    }

    Hashtable.3() {
    }
}
