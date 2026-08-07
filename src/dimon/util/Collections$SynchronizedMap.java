/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.Map;
import is.dimon.util.Set;

private static class Collections.SynchronizedMap
implements Map {
    private Map m;
    private Object mutex;
    private transient Set keySet;
    private transient Set entries;
    private transient Collection values;

    Collections.SynchronizedMap(Map m) {
        this.m = m;
        this.mutex = this;
    }

    Collections.SynchronizedMap(Map m, Object mutex) {
        this.m = m;
        this.mutex = mutex;
    }

    public int size() {
        Object object = this.mutex;
        synchronized (object) {
            int n = this.m.size();
            Object var3_3 = null;
            return n;
        }
    }

    public boolean isEmpty() {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.m.isEmpty();
            Object var3_3 = null;
            return bl;
        }
    }

    public boolean containsKey(Object key) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.m.containsKey(key);
            Object var4_4 = null;
            return bl;
        }
    }

    public boolean containsValue(Object value) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.m.containsValue(value);
            Object var4_4 = null;
            return bl;
        }
    }

    public Object get(Object key) {
        Object object = this.mutex;
        synchronized (object) {
            Object object2 = this.m.get(key);
            Object var4_4 = null;
            return object2;
        }
    }

    public Object put(Object key, Object value) {
        Object object = this.mutex;
        synchronized (object) {
            Object object2 = this.m.put(key, value);
            Object var5_5 = null;
            return object2;
        }
    }

    public Object remove(Object key) {
        Object object = this.mutex;
        synchronized (object) {
            Object object2 = this.m.remove(key);
            Object var4_4 = null;
            return object2;
        }
    }

    public void putAll(Map map) {
        Object object = this.mutex;
        synchronized (object) {
            this.m.putAll(map);
        }
    }

    public void clear() {
        Object object = this.mutex;
        synchronized (object) {
            this.m.clear();
        }
    }

    public Set keySet() {
        Object object = this.mutex;
        synchronized (object) {
            if (this.keySet == null) {
                this.keySet = new Collections.SynchronizedSet(this.m.keySet(), (Object)this);
            }
            Set set = this.keySet;
            Object var3_3 = null;
            return set;
        }
    }

    public Set entries() {
        Object object = this.mutex;
        synchronized (object) {
            if (this.entries == null) {
                this.entries = new Collections.SynchronizedSet(this.m.entries(), (Object)this);
            }
            Set set = this.entries;
            Object var3_3 = null;
            return set;
        }
    }

    public Collection values() {
        Object object = this.mutex;
        synchronized (object) {
            if (this.values == null) {
                this.values = new Collections.SynchronizedCollection(this.m.values(), this);
            }
            Collection collection = this.values;
            Object var3_3 = null;
            return collection;
        }
    }

    public boolean equals(Object o) {
        Object object = this.mutex;
        synchronized (object) {
            boolean bl = this.m.equals(o);
            Object var4_4 = null;
            return bl;
        }
    }

    public int hashCode() {
        Object object = this.mutex;
        synchronized (object) {
            int n = this.m.hashCode();
            Object var3_3 = null;
            return n;
        }
    }

    static /* synthetic */ Object access$0(Collections.SynchronizedMap $0) {
        return $0.mutex;
    }
}
