/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Dictionary;
import is.dimon.util.Enumeration;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.Set;
import is.dimon.util.UnsupportedOperationException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Hashtable
extends Dictionary
implements Map,
Cloneable,
Serializable {
    private transient Entry[] table;
    private transient int count;
    private int threshold;
    private float loadFactor;
    private transient int modCount = 0;
    private static final long serialVersionUID = 1421746759512286392L;
    private transient Set keySet = null;
    private transient Set entries = null;
    private transient Collection values = null;
    private static final int KEYS = 0;
    private static final int VALUES = 1;
    private static final int ENTRIES = 2;

    public Hashtable(int initialCapacity, float loadFactor) {
        if (initialCapacity < 0) {
            throw new IllegalArgumentException(String.valueOf("Illegal Capacity: ").concat(String.valueOf(initialCapacity)));
        }
        if (loadFactor > 1.0f || loadFactor <= 0.0f) {
            throw new IllegalArgumentException(String.valueOf("Illegal Load: ").concat(String.valueOf(loadFactor)));
        }
        this.loadFactor = loadFactor;
        this.table = new Entry[initialCapacity];
        this.threshold = (int)((float)initialCapacity * loadFactor);
    }

    public Hashtable(int initialCapacity) {
        this(initialCapacity, 0.75f);
    }

    public Hashtable() {
        this(101, 0.75f);
    }

    public Hashtable(Map t) {
        this(Math.max(3 * t.size(), 11), 0.75f);
        this.putAll(t);
    }

    public int size() {
        return this.count;
    }

    public boolean isEmpty() {
        return this.count == 0;
    }

    public synchronized Enumeration keys() {
        return new Enumerator(0, false);
    }

    public synchronized Enumeration elements() {
        return new Enumerator(1, false);
    }

    public synchronized boolean contains(Object value) {
        if (value == null) {
            throw new NullPointerException();
        }
        Entry[] tab = this.table;
        int i = tab.length;
        while (i-- > 0) {
            Entry e = tab[i];
            while (e != null) {
                if (e.value.equals(value)) {
                    return true;
                }
                e = e.next;
            }
        }
        return false;
    }

    public boolean containsValue(Object value) {
        return this.contains(value);
    }

    public synchronized boolean containsKey(Object key) {
        Entry[] tab = this.table;
        int hash = key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        Entry e = tab[index];
        while (e != null) {
            if (e.hash == hash && e.key.equals(key)) {
                return true;
            }
            e = e.next;
        }
        return false;
    }

    public synchronized Object get(Object key) {
        Entry[] tab = this.table;
        int hash = key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        Entry e = tab[index];
        while (e != null) {
            if (e.hash == hash && e.key.equals(key)) {
                return e.value;
            }
            e = e.next;
        }
        return null;
    }

    protected void rehash() {
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

    public synchronized Object put(Object key, Object value) {
        Entry e;
        if (value == null) {
            throw new NullPointerException();
        }
        Entry[] tab = this.table;
        int hash = key.hashCode();
        int index = (hash & Integer.MAX_VALUE) % tab.length;
        Entry e2 = tab[index];
        while (e2 != null) {
            if (e2.hash == hash && e2.key.equals(key)) {
                Object old = e2.value;
                e2.value = value;
                return old;
            }
            e2 = e2.next;
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

    public synchronized Object remove(Object key) {
        Entry[] tab = this.table;
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
        return null;
    }

    public synchronized void putAll(Map t) {
        Iterator i = t.entries().iterator();
        while (i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            this.put(e.getKey(), e.getValue());
        }
    }

    public synchronized void clear() {
        Entry[] tab = this.table;
        ++this.modCount;
        int index = tab.length;
        while (--index >= 0) {
            tab[index] = null;
        }
        this.count = 0;
    }

    public synchronized Object clone() {
        try {
            Hashtable t = (Hashtable)super.clone();
            t.table = new Entry[this.table.length];
            int i = this.table.length;
            while (i-- > 0) {
                t.table[i] = this.table[i] != null ? (Entry)this.table[i].clone() : null;
            }
            t.keySet = null;
            t.entries = null;
            t.values = null;
            t.modCount = 0;
            Hashtable hashtable = t;
            return hashtable;
        }
        catch (CloneNotSupportedException e) {
            throw new InternalError();
        }
    }

    public synchronized String toString() {
        int max = this.size() - 1;
        StringBuffer buf = new StringBuffer();
        Iterator it = this.entries().iterator();
        buf.append("{");
        for (int i = 0; i <= max; ++i) {
            Entry e = (Entry)it.next();
            buf.append(String.valueOf(String.valueOf(e.key).concat(String.valueOf("="))).concat(String.valueOf(e.value)));
            if (i >= max) continue;
            buf.append(", ");
        }
        buf.append("}");
        return buf.toString();
    }

    public Set keySet() {
        if (this.keySet == null) {
            this.keySet = new 1();
        }
        return this.keySet;
    }

    public Set entries() {
        if (this.entries == null) {
            this.entries = new 2();
        }
        return this.entries;
    }

    public Collection values() {
        if (this.values == null) {
            this.values = new 3();
        }
        return this.values;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Map)) {
            return false;
        }
        Map t = (Map)o;
        if (t.size() != this.size()) {
            return false;
        }
        Iterator i = this.entries().iterator();
        while (i.hasNext()) {
            Entry e = (Entry)i.next();
            Object key = e.getKey();
            Object value = e.getValue();
            if (!(value == null ? t.get(key) != null || !t.containsKey(key) : !value.equals(t.get(key)))) continue;
            return false;
        }
        return true;
    }

    public int hashCode() {
        int h = 0;
        Iterator i = this.entries().iterator();
        while (i.hasNext()) {
            h += i.next().hashCode();
        }
        return h;
    }

    private synchronized void writeObject(ObjectOutputStream s) throws IOException {
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

    private synchronized void readObject(ObjectInputStream s) throws ClassNotFoundException, IOException {
        s.defaultReadObject();
        int origlength = s.readInt();
        int elements = s.readInt();
        int length = (int)((float)elements * this.loadFactor) + elements / 20 + 3;
        if (length > elements && (length & 1) == 0) {
            --length;
        }
        if (origlength > 0 && length > origlength) {
            length = origlength;
        }
        this.table = new Entry[length];
        this.count = 0;
        while (elements > 0) {
            Object key = s.readObject();
            Object value = s.readObject();
            this.put(key, value);
            --elements;
        }
    }

    static /* synthetic */ int access$2000271() {
        return 2;
    }

    static /* synthetic */ int access$2000571() {
        return 1;
    }

    static /* synthetic */ int access$2000071() {
        return 0;
    }

    private class Enumerator
    implements Enumeration,
    Iterator {
        Entry[] table;
        int index;
        Entry entry;
        Entry lastReturned;
        int type;
        boolean iterator;
        private int expectedModCount;

        Enumerator(int type, boolean iterator) {
            this.table = Hashtable.this.table;
            this.index = this.table.length;
            this.entry = null;
            this.lastReturned = null;
            this.expectedModCount = Hashtable.this.modCount;
            this.type = type;
            this.iterator = iterator;
        }

        public boolean hasMoreElements() {
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

        public Object nextElement() {
            if (this.entry == null) {
                while (this.index-- > 0 && (this.entry = this.table[this.index]) == null) {
                }
            }
            if (this.entry != null) {
                Entry e = this.lastReturned = this.entry;
                this.entry = e.next;
                return this.type == Hashtable.access$2000071() ? e.key : (this.type == Hashtable.access$2000571() ? e.value : e);
            }
            throw new NoSuchElementException("Hashtable Enumerator");
        }

        public boolean hasNext() {
            return this.hasMoreElements();
        }

        public Object next() {
            if (Hashtable.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            return this.nextElement();
        }

        public void remove() {
            if (!this.iterator) {
                throw new UnsupportedOperationException();
            }
            if (this.lastReturned == null) {
                throw new IllegalStateException("Hashtable Enumerator");
            }
            if (Hashtable.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            Hashtable hashtable = Hashtable.this;
            synchronized (hashtable) {
                try {
                    Entry[] tab = Hashtable.this.table;
                    int index = (this.lastReturned.hash & Integer.MAX_VALUE) % tab.length;
                    Entry e = tab[index];
                    Entry prev = null;
                    while (e != null) {
                        if (e == this.lastReturned) {
                            ++Hashtable.this.modCount;
                            ++this.expectedModCount;
                            if (prev == null) {
                                tab[index] = e.next;
                            } else {
                                prev.next = e.next;
                            }
                            --Hashtable.this.count;
                            this.lastReturned = null;
                            Object var7_6 = null;
                            return;
                        }
                        prev = e;
                        e = e.next;
                    }
                    throw new ConcurrentModificationException();
                }
                catch (Throwable throwable) {
                    Object var7_7 = null;
                    throw throwable;
                }
            }
        }
    }

    private static class Entry
    implements Map.Entry {
        int hash;
        Object key;
        Object value;
        Entry next;

        protected Entry(int hash, Object key, Object value, Entry next) {
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
            if (value == null) {
                throw new NullPointerException();
            }
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
    extends AbstractCollection {
        public Iterator iterator() {
            return new Enumerator(Hashtable.access$2000571(), true);
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

        3() {
        }
    }

    class 2
    extends AbstractSet {
        public Iterator iterator() {
            return new Enumerator(Hashtable.access$2000271(), true);
        }

        public boolean contains(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry)o;
            Object key = entry.getKey();
            Entry[] tab = Hashtable.this.table;
            int hash = key.hashCode();
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
            Entry[] tab = Hashtable.this.table;
            int hash = key.hashCode();
            int index = (hash & Integer.MAX_VALUE) % tab.length;
            Entry e = tab[index];
            Entry prev = null;
            while (e != null) {
                if (e.hash == hash && e.equals(entry)) {
                    ++Hashtable.this.modCount;
                    if (prev != null) {
                        prev.next = e.next;
                    } else {
                        tab[index] = e.next;
                    }
                    --Hashtable.this.count;
                    e.value = null;
                    return true;
                }
                prev = e;
                e = e.next;
            }
            return false;
        }

        public int size() {
            return Hashtable.this.count;
        }

        public void clear() {
            Hashtable.this.clear();
        }

        2() {
        }
    }

    class 1
    extends AbstractSet {
        public Iterator iterator() {
            return new Enumerator(Hashtable.access$2000071(), true);
        }

        public int size() {
            return Hashtable.this.count;
        }

        public boolean contains(Object o) {
            return Hashtable.this.containsKey(o);
        }

        public boolean remove(Object o) {
            return Hashtable.this.remove(o) != null;
        }

        public void clear() {
            Hashtable.this.clear();
        }

        1() {
        }
    }
}
