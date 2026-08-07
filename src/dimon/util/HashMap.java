/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.AbstractMap;
import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.Set;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class HashMap
extends AbstractMap
implements Map,
Cloneable,
Serializable {
    private transient Entry[] table;
    private transient int count;
    private int threshold;
    private float loadFactor;
    private transient int modCount = 0;
    private transient Set keySet = null;
    private transient Set entries = null;
    private transient Collection values = null;
    private static final int KEYS = 0;
    private static final int VALUES = 1;
    private static final int ENTRIES = 2;

    public HashMap(int initialCapacity, float loadFactor) {
        if (initialCapacity < 0) {
            throw new IllegalArgumentException(String.valueOf("Illegal Initial Capacity: ").concat(String.valueOf(initialCapacity)));
        }
        if (loadFactor > 1.0f || loadFactor <= 0.0f) {
            throw new IllegalArgumentException(String.valueOf("Illegal Load factor: ").concat(String.valueOf(loadFactor)));
        }
        this.loadFactor = loadFactor;
        this.table = new Entry[initialCapacity];
        this.threshold = (int)((float)initialCapacity * loadFactor);
    }

    public HashMap(int initialCapacity) {
        this(initialCapacity, 0.75f);
    }

    public HashMap() {
        this(101, 0.75f);
    }

    public HashMap(Map t) {
        this(Math.max(3 * t.size(), 11), 0.75f);
        this.putAll(t);
    }

    public int size() {
        return this.count;
    }

    public boolean isEmpty() {
        return this.count == 0;
    }

    public boolean containsValue(Object value) {
        Entry[] tab = this.table;
        if (value == null) {
            int i = tab.length;
            while (i-- > 0) {
                Entry e = tab[i];
                while (e != null) {
                    if (e.value == null) {
                        return true;
                    }
                    e = e.next;
                }
            }
        } else {
            int i = tab.length;
            while (i-- > 0) {
                Entry e = tab[i];
                while (e != null) {
                    if (value.equals(e.value)) {
                        return true;
                    }
                    e = e.next;
                }
            }
        }
        return false;
    }

    public boolean containsKey(Object key) {
        Entry[] tab = this.table;
        if (key != null) {
            int hash = key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            while (e != null) {
                if (e.hash == hash && e.key.equals(key)) {
                    return true;
                }
                e = e.next;
            }
        } else {
            Entry e = tab[0];
            while (e != null) {
                if (e.key == null) {
                    return true;
                }
                e = e.next;
            }
        }
        return false;
    }

    public Object get(Object key) {
        Entry[] tab = this.table;
        if (key != null) {
            int hash = key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            while (e != null) {
                if (e.hash == hash && e.key.equals(key)) {
                    return e.value;
                }
                e = e.next;
            }
        } else {
            Entry e = tab[0];
            while (e != null) {
                if (e.key == null) {
                    return e.value;
                }
                e = e.next;
            }
        }
        return null;
    }

    private void rehash() {
        int oldCapacity = this.table.length;
        Entry[] oldMap = this.table;
        int newCapacity = oldCapacity * 2 + 1;
        Entry[] newMap = new Entry[newCapacity];
        ++this.modCount;
        this.threshold = (int)((float)newCapacity * this.loadFactor);
        this.table = newMap;
        int i = oldCapacity;
        while (i-- > 0) {
            Entry old = oldMap[i];
            while (old != null) {
                Entry e = old;
                old = old.next;
                int index = (e.hash & Integer.MAX_VALUE) % newCapacity;
                e.next = newMap[index];
                newMap[index] = e;
            }
        }
    }

    public Object put(Object key, Object value) {
        Entry e;
        Entry[] tab = this.table;
        int hash = 0;
        int index = 0;
        if (key != null) {
            hash = key.hashCode();
            index = (hash & Integer.MAX_VALUE) % tab.length;
            e = tab[index];
            while (e != null) {
                if (e.hash == hash && e.key.equals(key)) {
                    Object old = e.value;
                    e.value = value;
                    return old;
                }
                e = e.next;
            }
        } else {
            e = tab[0];
            while (e != null) {
                if (e.key == null) {
                    Object old = e.value;
                    e.value = value;
                    return old;
                }
                e = e.next;
            }
        }
        ++this.modCount;
        if (this.count >= this.threshold) {
            this.rehash();
            tab = this.table;
            index = (hash & Integer.MAX_VALUE) % tab.length;
        }
        tab[index] = e = new Entry(hash, key, value, tab[index]);
        ++this.count;
        return null;
    }

    public Object remove(Object key) {
        Entry[] tab = this.table;
        if (key != null) {
            int hash = key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            Entry prev = null;
            while (e != null) {
                if (e.hash == hash && e.key.equals(key)) {
                    ++this.modCount;
                    if (prev != null) {
                        prev.next = e.next;
                    } else {
                        tab[index] = e.next;
                    }
                    --this.count;
                    Object oldValue = e.value;
                    e.value = null;
                    return oldValue;
                }
                prev = e;
                e = e.next;
            }
        } else {
            Entry e = tab[0];
            Entry prev = null;
            while (e != null) {
                if (e.key == null) {
                    ++this.modCount;
                    if (prev != null) {
                        prev.next = e.next;
                    } else {
                        tab[0] = e.next;
                    }
                    --this.count;
                    Object oldValue = e.value;
                    e.value = null;
                    return oldValue;
                }
                prev = e;
                e = e.next;
            }
        }
        return null;
    }

    public void putAll(Map t) {
        Iterator i = t.entries().iterator();
        while (i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            this.put(e.getKey(), e.getValue());
        }
    }

    public void clear() {
        Entry[] tab = this.table;
        ++this.modCount;
        int index = tab.length;
        while (--index >= 0) {
            tab[index] = null;
        }
        this.count = 0;
    }

    public Object clone() {
        try {
            HashMap t = (HashMap)super.clone();
            t.table = new Entry[this.table.length];
            int i = this.table.length;
            while (i-- > 0) {
                t.table[i] = this.table[i] != null ? (Entry)this.table[i].clone() : null;
            }
            t.keySet = null;
            t.entries = null;
            t.values = null;
            t.modCount = 0;
            HashMap hashMap = t;
            return hashMap;
        }
        catch (CloneNotSupportedException e) {
            throw new InternalError();
        }
    }

    public Set keySet() {
        if (this.keySet == null) {
            this.keySet = new 1();
        }
        return this.keySet;
    }

    public Collection values() {
        if (this.values == null) {
            this.values = new 2();
        }
        return this.values;
    }

    public Set entries() {
        if (this.entries == null) {
            this.entries = new 3();
        }
        return this.entries;
    }

    private void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.table.length);
        s.writeInt(this.count);
        for (int index = this.table.length - 1; index >= 0; --index) {
            Entry entry = this.table[index];
            while (entry != null) {
                s.writeObject(entry.key);
                s.writeObject(entry.value);
                entry = entry.next;
            }
        }
    }

    private void readObject(ObjectInputStream s) throws ClassNotFoundException, IOException {
        s.defaultReadObject();
        int numBuckets = s.readInt();
        this.table = new Entry[numBuckets];
        int size = s.readInt();
        for (int i = 0; i < size; ++i) {
            Object key = s.readObject();
            Object value = s.readObject();
            this.put(key, value);
        }
    }

    int capacity() {
        return this.table.length;
    }

    float loadFactor() {
        return this.loadFactor;
    }

    static /* synthetic */ int access$2000371() {
        return 2;
    }

    static /* synthetic */ int access$2000271() {
        return 1;
    }

    static /* synthetic */ int access$2000071() {
        return 0;
    }

    private class HashIterator
    implements Iterator {
        Entry[] table;
        int index;
        Entry entry;
        Entry lastReturned;
        int type;
        private int expectedModCount;

        HashIterator(int type) {
            this.table = HashMap.this.table;
            this.index = this.table.length;
            this.entry = null;
            this.lastReturned = null;
            this.expectedModCount = HashMap.this.modCount;
            this.type = type;
        }

        public boolean hasNext() {
            if (this.entry != null) {
                return true;
            }
            while (this.index-- > 0) {
                this.entry = this.table[this.index];
                if (this.entry == null) continue;
                return true;
            }
            return false;
        }

        public Object next() {
            if (HashMap.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            if (this.entry == null) {
                while (this.index-- > 0 && (this.entry = this.table[this.index]) == null) {
                }
            }
            if (this.entry != null) {
                Entry e = this.lastReturned = this.entry;
                this.entry = e.next;
                return this.type == HashMap.access$2000071() ? e.key : (this.type == HashMap.access$2000271() ? e.value : e);
            }
            throw new NoSuchElementException();
        }

        public void remove() {
            if (this.lastReturned == null) {
                throw new IllegalStateException();
            }
            if (HashMap.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            Entry[] tab = HashMap.this.table;
            int index = (this.lastReturned.hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            Entry prev = null;
            while (e != null) {
                if (e == this.lastReturned) {
                    ++HashMap.this.modCount;
                    ++this.expectedModCount;
                    if (prev == null) {
                        tab[index] = e.next;
                    } else {
                        prev.next = e.next;
                    }
                    --HashMap.this.count;
                    this.lastReturned = null;
                    return;
                }
                prev = e;
                e = e.next;
            }
            throw new ConcurrentModificationException();
        }
    }

    private static class Entry
    implements Map.Entry {
        int hash;
        Object key;
        Object value;
        Entry next;

        Entry(int hash, Object key, Object value, Entry next) {
            this.hash = hash;
            this.key = key;
            this.value = value;
            this.next = next;
        }

        protected Object clone() {
            return new Entry(this.hash, this.key, this.value, this.next == null ? null : (Entry)this.next.clone());
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

    class 3
    extends AbstractSet {
        public Iterator iterator() {
            return new HashIterator(HashMap.access$2000371());
        }

        public boolean contains(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry)o;
            Object key = entry.getKey();
            Entry[] tab = HashMap.this.table;
            int hash = key == null ? 0 : key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            while (e != null) {
                if (e.hash == hash && e.equals(entry)) {
                    return true;
                }
                e = e.next;
            }
            return false;
        }

        public boolean remove(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry)o;
            Object key = entry.getKey();
            Entry[] tab = HashMap.this.table;
            int hash = key == null ? 0 : key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            Entry prev = null;
            while (e != null) {
                if (e.hash == hash && e.equals(entry)) {
                    ++HashMap.this.modCount;
                    if (prev != null) {
                        prev.next = e.next;
                    } else {
                        tab[index] = e.next;
                    }
                    --HashMap.this.count;
                    e.value = null;
                    return true;
                }
                prev = e;
                e = e.next;
            }
            return false;
        }

        public int size() {
            return HashMap.this.count;
        }

        public void clear() {
            HashMap.this.clear();
        }

        3() {
        }
    }

    class 2
    extends AbstractCollection {
        public Iterator iterator() {
            return new HashIterator(HashMap.access$2000271());
        }

        public int size() {
            return HashMap.this.count;
        }

        public boolean contains(Object o) {
            return HashMap.this.containsValue(o);
        }

        public void clear() {
            HashMap.this.clear();
        }

        2() {
        }
    }

    class 1
    extends AbstractSet {
        public Iterator iterator() {
            return new HashIterator(HashMap.access$2000071());
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

        1() {
        }
    }
}
