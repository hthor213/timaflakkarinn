/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.Comparator;
import is.dimon.util.Iterator;
import is.dimon.util.Set;
import is.dimon.util.SortedMap;
import is.dimon.util.SortedSet;
import is.dimon.util.TreeMap;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class TreeSet
extends AbstractSet
implements SortedSet,
Cloneable,
Serializable {
    private transient SortedMap m;
    private transient Set keySet;
    private static final Object PRESENT = new Object();

    private TreeSet(SortedMap m) {
        this.m = m;
        this.keySet = m.keySet();
    }

    public TreeSet() {
        this(new TreeMap());
    }

    public TreeSet(Comparator c) {
        this(new TreeMap(c));
    }

    public TreeSet(Collection c) {
        this();
        this.addAll(c);
    }

    public TreeSet(SortedSet s) {
        this(s.comparator());
        this.addAll(s);
    }

    public Iterator iterator() {
        return this.keySet.iterator();
    }

    public int size() {
        return this.m.size();
    }

    public boolean isEmpty() {
        return this.m.isEmpty();
    }

    public boolean contains(Object o) {
        return this.m.containsKey(o);
    }

    public boolean add(Object o) {
        return this.m.put(o, PRESENT) == null;
    }

    public boolean remove(Object o) {
        return this.m.remove(o) == PRESENT;
    }

    public void clear() {
        this.m.clear();
    }

    public SortedSet subSet(Object fromElement, Object toElement) {
        return new TreeSet(this.m.subMap(fromElement, toElement));
    }

    public SortedSet headSet(Object toElement) {
        return new TreeSet(this.m.headMap(toElement));
    }

    public SortedSet tailSet(Object fromElement) {
        return new TreeSet(this.m.tailMap(fromElement));
    }

    public Comparator comparator() {
        return this.m.comparator();
    }

    public Object first() {
        return this.m.firstKey();
    }

    public Object last() {
        return this.m.lastKey();
    }

    public Object clone() {
        return new TreeSet(this);
    }

    private synchronized void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.m.size());
        Iterator i = this.m.keySet().iterator();
        while (i.hasNext()) {
            s.writeObject(i.next());
        }
    }

    private synchronized void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        this.m = new TreeMap();
        this.keySet = this.m.keySet();
        int size = s.readInt();
        int i = 0;
        while (i < size) {
            Object e = s.readObject();
            this.m.put(e, PRESENT);
            ++i;
        }
    }
}
