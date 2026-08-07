/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;

private static class Arrays.ArrayList
extends AbstractList
implements Cloneable {
    private Object[] a;

    Arrays.ArrayList(Object[] array) {
        this.a = array;
    }

    public int size() {
        return this.a.length;
    }

    public Object[] toArray() {
        return (Object[])this.a.clone();
    }

    public Object get(int index) {
        return this.a[index];
    }

    public Object set(int index, Object element) {
        Object oldValue = this.a[index];
        this.a[index] = element;
        return oldValue;
    }

    public Object clone() {
        return new Arrays.ArrayList(this.toArray());
    }
}
