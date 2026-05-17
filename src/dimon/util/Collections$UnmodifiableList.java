/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.List;
import is.dimon.util.ListIterator;
import is.dimon.util.UnsupportedOperationException;

static class Collections.UnmodifiableList
extends Collections.UnmodifiableCollection
implements List {
    private List list;

    Collections.UnmodifiableList(List list) {
        super(list);
        this.list = list;
    }

    public boolean equals(Object o) {
        return this.list.equals(o);
    }

    public int hashCode() {
        return this.list.hashCode();
    }

    public Object get(int index) {
        return this.list.get(index);
    }

    public Object set(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    public void add(int index, Object element) {
        throw new UnsupportedOperationException();
    }

    public Object remove(int index) {
        throw new UnsupportedOperationException();
    }

    public int indexOf(Object o) {
        return this.list.indexOf(o);
    }

    public int indexOf(Object o, int i) {
        return this.list.indexOf(o, i);
    }

    public int lastIndexOf(Object o) {
        return this.list.lastIndexOf(o);
    }

    public int lastIndexOf(Object o, int i) {
        return this.list.lastIndexOf(o, i);
    }

    public void removeRange(int fromIndex, int toIndex) {
        throw new UnsupportedOperationException();
    }

    public boolean addAll(int index, Collection c) {
        throw new UnsupportedOperationException();
    }

    public ListIterator listIterator() {
        return this.listIterator(0);
    }

    public ListIterator listIterator(int index) {
        return new Collections.3(index, this);
    }

    static /* synthetic */ List access$0(Collections.UnmodifiableList $0) {
        return $0.list;
    }
}
