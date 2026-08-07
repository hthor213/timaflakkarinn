/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Map;
import is.dimon.util.TreeMap;

static class TreeMap.Entry
implements Map.Entry {
    Object key;
    Object value;
    TreeMap.Entry left;
    TreeMap.Entry right;
    TreeMap.Entry parent;
    boolean color = TreeMap.access$9();

    TreeMap.Entry(Object key, Object value, TreeMap.Entry parent) {
        this.key = key;
        this.value = value;
        this.parent = parent;
    }

    public Object getKey() {
        return this.key;
    }

    public Object getValue() {
        return this.value;
    }

    public Object setValue(Object value) {
        Object oldValue = this.value;
        this.value = value;
        return oldValue;
    }

    public boolean equals(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry e = (Map.Entry)o;
        return TreeMap.valEquals(this.key, e.getKey()) && TreeMap.valEquals(this.value, e.getValue());
    }

    public int hashCode() {
        int keyHash = this.key == null ? 0 : this.key.hashCode();
        int valueHash = this.value == null ? 0 : this.value.hashCode();
        return keyHash ^ valueHash;
    }

    public String toString() {
        return String.valueOf(this.key) + "=" + this.value;
    }
}
