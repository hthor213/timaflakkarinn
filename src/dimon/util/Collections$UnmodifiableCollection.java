/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.Iterator;
import is.dimon.util.UnsupportedOperationException;
import java.io.Serializable;

static class Collections.UnmodifiableCollection
implements Collection,
Serializable {
    private Collection c;

    Collections.UnmodifiableCollection(Collection c) {
        this.c = c;
    }

    public int size() {
        return this.c.size();
    }

    public boolean isEmpty() {
        return this.c.isEmpty();
    }

    public boolean contains(Object o) {
        return this.c.contains(o);
    }

    public Object[] toArray() {
        return this.c.toArray();
    }

    public Object[] toArray(Object[] a) {
        return this.c.toArray(a);
    }

    public Iterator iterator() {
        return new Collections.2(this);
    }

    public boolean add(Object o) {
        throw new UnsupportedOperationException();
    }

    public boolean remove(Object o) {
        throw new UnsupportedOperationException();
    }

    public boolean containsAll(Collection coll) {
        return this.c.containsAll(coll);
    }

    public boolean addAll(Collection coll) {
        throw new UnsupportedOperationException();
    }

    public boolean removeAll(Collection coll) {
        throw new UnsupportedOperationException();
    }

    public boolean retainAll(Collection coll) {
        throw new UnsupportedOperationException();
    }

    public void clear() {
        throw new UnsupportedOperationException();
    }

    static /* synthetic */ Collection access$0(Collections.UnmodifiableCollection $0) {
        return $0.c;
    }
}
