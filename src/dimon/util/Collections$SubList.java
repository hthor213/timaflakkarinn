/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.Collections;
import is.dimon.util.Iterator;
import is.dimon.util.List;
import is.dimon.util.ListIterator;

static class Collections.SubList
extends AbstractList {
    private List backer;
    private int offset;
    private int size;

    Collections.SubList(List list, int fromIndex, int toIndex) {
        this.backer = list;
        this.offset = fromIndex;
        this.size = toIndex - fromIndex;
        if (this.size < 0) {
            throw new IllegalArgumentException("fromIndex < toIndex");
        }
        int backerSize = this.backer.size();
        if (fromIndex < 0 || fromIndex > backerSize || toIndex < 0 || toIndex > backerSize) {
            throw new IndexOutOfBoundsException();
        }
    }

    public int size() {
        return this.size;
    }

    public Iterator iterator() {
        return this.listIterator();
    }

    public Object get(int index) {
        this.rangeCheck(index);
        return this.backer.get(index + this.offset);
    }

    public Object set(int index, Object element) {
        this.rangeCheck(index);
        return this.backer.set(index + this.offset, element);
    }

    public int indexOf(Object o, int index) {
        this.rangeCheck(index);
        ListIterator i = this.backer.listIterator(index + this.offset);
        if (o == null) {
            int j = index;
            while (j < this.size) {
                if (i.next() == null) {
                    return i.previousIndex() - this.offset;
                }
                ++j;
            }
        } else {
            int j = index;
            while (j < this.size) {
                if (o.equals(i.next())) {
                    return i.previousIndex() - this.offset;
                }
                ++j;
            }
        }
        return -1;
    }

    public int lastIndexOf(Object o, int index) {
        this.rangeCheck(index);
        ListIterator i = this.backer.listIterator(index + this.offset + 1);
        if (o == null) {
            int j = index;
            while (j >= 0) {
                if (i.previous() == null) {
                    return i.nextIndex() - this.offset;
                }
                --j;
            }
        } else {
            int j = index;
            while (j >= 0) {
                if (o.equals(i.previous())) {
                    return i.nextIndex() - this.offset;
                }
                --j;
            }
        }
        return -1;
    }

    public ListIterator listIterator(int index) {
        if (index < 0 || index > this.size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + this.size);
        }
        return new Collections.1(index, this);
    }

    private void rangeCheck(int index) {
        if (index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException("Index: " + index + ",Size: " + this.size);
        }
    }

    static /* synthetic */ List access$0(Collections.SubList $0) {
        return $0.backer;
    }

    static /* synthetic */ int access$1(Collections.SubList $0) {
        return $0.offset;
    }

    static /* synthetic */ int access$2(Collections.SubList $0) {
        return $0.size;
    }
}
