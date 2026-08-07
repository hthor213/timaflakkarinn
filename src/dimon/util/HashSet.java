/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.HashMap;
import is.dimon.util.Iterator;
import is.dimon.util.Set;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class HashSet
extends AbstractSet
implements Set,
Cloneable,
Serializable {
    private transient HashMap map;
    private static final Object PRESENT = new Object();

    public HashSet() {
        this.map = new HashMap();
    }

    public HashSet(Collection c) {
        this.map = new HashMap(Math.max(3 * c.size(), 11));
        this.addAll(c);
    }

    public HashSet(int initialCapacity, float loadFactor) {
        this.map = new HashMap(initialCapacity, loadFactor);
    }

    public HashSet(int initialCapacity) {
        this.map = new HashMap(initialCapacity);
    }

    public Iterator iterator() {
        return this.map.keySet().iterator();
    }

    public int size() {
        return this.map.size();
    }

    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    public boolean contains(Object o) {
        return this.map.containsKey(o);
    }

    public boolean add(Object o) {
        return this.map.put(o, PRESENT) == null;
    }

    public boolean remove(Object o) {
        return this.map.remove(o) == PRESENT;
    }

    public void clear() {
        this.map.clear();
    }

    public Object clone() {
        try {
            HashSet newSet = (HashSet)super.clone();
            newSet.map = (HashMap)this.map.clone();
            return newSet;
        }
        catch (CloneNotSupportedException cloneNotSupportedException) {
            throw new InternalError();
        }
    }

    private synchronized void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.map.capacity());
        s.writeFloat(this.map.loadFactor());
        s.writeInt(this.map.size());
        Iterator i = this.map.keySet().iterator();
        while (i.hasNext()) {
            s.writeObject(i.next());
        }
    }

    private synchronized void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        int capacity = s.readInt();
        float loadFactor = s.readFloat();
        this.map = new HashMap(capacity, loadFactor);
        int size = s.readInt();
        int i = 0;
        while (i < size) {
            Object e = s.readObject();
            this.map.put(e, PRESENT);
            ++i;
        }
    }
}
