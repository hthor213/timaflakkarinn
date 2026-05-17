/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Map;

private static class HashMap.Entry
implements Map.Entry {
    int hash;
    Object key;
    Object value;
    HashMap.Entry next;

    HashMap.Entry(int hash, Object key, Object value, HashMap.Entry next) {
        this.hash = hash;
        this.key = key;
        this.value = value;
        this.next = next;
    }

    protected Object clone() {
        return new HashMap.Entry(this.hash, this.key, this.value, this.next == null ? null : (HashMap.Entry)this.next.clone());
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

    /*
     * Enabled force condition propagation
     * Lifted jumps to return sites
     */
    public boolean equals(Object o) {
        boolean bl;
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry e = (Map.Entry)o;
        if (this.key == null) {
            if (e.getKey() != null) return false;
            bl = true;
        } else {
            bl = this.key.equals(e.getKey());
        }
        if (!bl) return false;
        if (this.value == null) {
            if (e.getValue() != null) return false;
            return true;
        }
        boolean bl2 = this.value.equals(e.getValue());
        if (!bl2) return false;
        return true;
    }

    public int hashCode() {
        return this.hash ^ (this.value == null ? 0 : this.value.hashCode());
    }

    public String toString() {
        return String.valueOf(String.valueOf(this.key.toString()).concat(String.valueOf("="))).concat(String.valueOf(this.value.toString()));
    }
}
