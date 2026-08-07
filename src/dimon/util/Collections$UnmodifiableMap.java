/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.Map;
import is.dimon.util.Set;
import is.dimon.util.UnsupportedOperationException;
import java.io.Serializable;

private static class Collections.UnmodifiableMap
implements Map,
Serializable {
    private final Map m;
    private transient Set keySet;
    private transient Set entries;
    private transient Collection values;

    Collections.UnmodifiableMap(Map m) {
        this.m = m;
    }

    public int size() {
        return this.m.size();
    }

    public boolean isEmpty() {
        return this.m.isEmpty();
    }

    public boolean containsKey(Object key) {
        return this.m.containsKey(key);
    }

    public boolean containsValue(Object val) {
        return this.m.containsValue(val);
    }

    public Object get(Object key) {
        return this.m.get(key);
    }

    public Object put(Object key, Object value) {
        throw new UnsupportedOperationException();
    }

    public Object remove(Object key) {
        throw new UnsupportedOperationException();
    }

    public void putAll(Map t) {
        throw new UnsupportedOperationException();
    }

    public void clear() {
        throw new UnsupportedOperationException();
    }

    public Set keySet() {
        if (this.keySet == null) {
            this.keySet = Collections.unmodifiableSet(this.m.keySet());
        }
        return this.keySet;
    }

    public Set entries() {
        if (this.entries == null) {
            this.entries = Collections.unmodifiableSet(this.m.entries());
        }
        return this.entries;
    }

    public Collection values() {
        if (this.values == null) {
            this.values = Collections.unmodifiableCollection(this.m.values());
        }
        return this.values;
    }

    public boolean equals(Object o) {
        return this.m.equals(o);
    }

    public int hashCode() {
        return this.m.hashCode();
    }
}
