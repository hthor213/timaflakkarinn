/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.AbstractMap;
import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.Comparable;
import is.dimon.util.Comparator;
import is.dimon.util.ConcurrentModificationException;
import is.dimon.util.Map;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.Set;
import is.dimon.util.SortedMap;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class TreeMap
extends AbstractMap
implements SortedMap,
Cloneable,
Serializable {
    private Comparator comparator;
    private transient Entry root;
    private transient int size;
    private transient int modCount;
    private transient Set keySet;
    private transient Set entries;
    private transient Collection values;
    private static final int KEYS = 0;
    private static final int VALUES = 1;
    private static final int ENTRIES = 2;
    private static final boolean RED = false;
    private static final boolean BLACK = true;

    private void incrementSize() {
        ++this.modCount;
        ++this.size;
    }

    private void decrementSize() {
        ++this.modCount;
        --this.size;
    }

    public TreeMap() {
    }

    public TreeMap(Comparator c) {
        this.comparator = c;
    }

    public TreeMap(Map m) {
        this.putAll(m);
    }

    public TreeMap(SortedMap m) {
        this.comparator = m.comparator();
        this.putAll(m);
    }

    public int size() {
        return this.size;
    }

    public boolean containsKey(Object key) {
        return this.getEntry(key) != null;
    }

    public Object get(Object key) {
        Entry p = this.getEntry(key);
        return p == null ? null : p.value;
    }

    public Comparator comparator() {
        return this.comparator;
    }

    public Object firstKey() {
        return TreeMap.key(this.firstEntry());
    }

    public Object lastKey() {
        return TreeMap.key(this.lastEntry());
    }

    private Entry getEntry(Object key) {
        Entry p = this.root;
        while (p != null) {
            int cmp = this.compare(key, p.key);
            if (cmp == 0) {
                return p;
            }
            p = cmp < 0 ? p.left : p.right;
        }
        return null;
    }

    private Entry getCeilEntry(Object key) {
        Entry p = this.root;
        if (p == null) {
            return null;
        }
        while (true) {
            int cmp;
            if ((cmp = this.compare(key, p.key)) == 0) {
                return p;
            }
            if (cmp < 0) {
                if (p.left != null) {
                    p = p.left;
                    continue;
                }
                return p;
            }
            if (p.right == null) break;
            p = p.right;
        }
        Entry parent = p.parent;
        Entry ch = p;
        while (parent != null && ch == parent.right) {
            ch = parent;
            parent = parent.parent;
        }
        return parent;
    }

    private Entry getPrecedingEntry(Object key) {
        Entry p = this.root;
        if (p == null) {
            return null;
        }
        while (true) {
            int cmp;
            if ((cmp = this.compare(key, p.key)) > 0) {
                if (p.right != null) {
                    p = p.right;
                    continue;
                }
                return p;
            }
            if (p.left == null) break;
            p = p.left;
        }
        Entry parent = p.parent;
        Entry ch = p;
        while (parent != null && ch == parent.left) {
            ch = parent;
            parent = parent.parent;
        }
        return parent;
    }

    private static Object key(Entry e) {
        if (e == null) {
            throw new NoSuchElementException();
        }
        return e.key;
    }

    public Object put(Object key, Object value) {
        Entry t = this.root;
        if (t == null) {
            this.incrementSize();
            this.root = new Entry(key, value, null);
            return null;
        }
        while (true) {
            int cmp;
            if ((cmp = this.compare(key, t.key)) == 0) {
                return t.setValue(value);
            }
            if (cmp < 0) {
                if (t.left != null) {
                    t = t.left;
                    continue;
                }
                this.incrementSize();
                t.left = new Entry(key, value, t);
                this.fixAfterInsertion(t.left);
                return null;
            }
            if (t.right == null) break;
            t = t.right;
        }
        this.incrementSize();
        t.right = new Entry(key, value, t);
        this.fixAfterInsertion(t.right);
        return null;
    }

    public Object remove(Object key) {
        Entry p = this.getEntry(key);
        if (p == null) {
            return null;
        }
        Object oldValue = p.value;
        this.deleteEntry(p);
        return oldValue;
    }

    public void clear() {
        ++this.modCount;
        this.size = 0;
        this.root = null;
    }

    public Object clone() {
        return new TreeMap(this);
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

    public SortedMap subMap(Object fromKey, Object toKey) {
        return new SubMap(fromKey, toKey);
    }

    public SortedMap headMap(Object toKey) {
        return new SubMap(toKey, true);
    }

    public SortedMap tailMap(Object fromKey) {
        return new SubMap(fromKey, false);
    }

    private int compare(Object k1, Object k2) {
        return this.comparator == null ? ((Comparable)k1).compareTo(k2) : this.comparator.compare(k1, k2);
    }

    private static boolean valEquals(Object o1, Object o2) {
        return o1 == null ? o2 == null : o1.equals(o2);
    }

    private Entry firstEntry() {
        Entry p = this.root;
        if (p != null) {
            while (p.left != null) {
                p = p.left;
            }
        }
        return p;
    }

    private Entry lastEntry() {
        Entry p = this.root;
        if (p != null) {
            while (p.right != null) {
                p = p.right;
            }
        }
        return p;
    }

    private Entry successor(Entry t) {
        if (t == null) {
            return null;
        }
        if (t.right != null) {
            Entry p = t.right;
            while (p.left != null) {
                p = p.left;
            }
            return p;
        }
        Entry p = t.parent;
        Entry ch = t;
        while (p != null && ch == p.right) {
            ch = p;
            p = p.parent;
        }
        return p;
    }

    private static boolean colorOf(Entry p) {
        return p == null ? true : p.color;
    }

    private static Entry parentOf(Entry p) {
        return p == null ? null : p.parent;
    }

    private static void setColor(Entry p, boolean c) {
        if (p != null) {
            p.color = c;
        }
    }

    private static Entry leftOf(Entry p) {
        return p == null ? null : p.left;
    }

    private static Entry rightOf(Entry p) {
        return p == null ? null : p.right;
    }

    private void rotateLeft(Entry p) {
        Entry r = p.right;
        p.right = r.left;
        if (r.left != null) {
            r.left.parent = p;
        }
        r.parent = p.parent;
        if (p.parent == null) {
            this.root = r;
        } else if (p.parent.left == p) {
            p.parent.left = r;
        } else {
            p.parent.right = r;
        }
        r.left = p;
        p.parent = r;
    }

    private void rotateRight(Entry p) {
        Entry l = p.left;
        p.left = l.right;
        if (l.right != null) {
            l.right.parent = p;
        }
        l.parent = p.parent;
        if (p.parent == null) {
            this.root = l;
        } else if (p.parent.right == p) {
            p.parent.right = l;
        } else {
            p.parent.left = l;
        }
        l.right = p;
        p.parent = l;
    }

    private void fixAfterInsertion(Entry x) {
        x.color = false;
        while (x != null && x != this.root && !x.parent.color) {
            Entry y;
            if (TreeMap.parentOf(x) == TreeMap.leftOf(TreeMap.parentOf(TreeMap.parentOf(x)))) {
                y = TreeMap.rightOf(TreeMap.parentOf(TreeMap.parentOf(x)));
                if (!TreeMap.colorOf(y)) {
                    TreeMap.setColor(TreeMap.parentOf(x), true);
                    TreeMap.setColor(y, true);
                    TreeMap.setColor(TreeMap.parentOf(TreeMap.parentOf(x)), false);
                    x = TreeMap.parentOf(TreeMap.parentOf(x));
                    continue;
                }
                if (x == TreeMap.rightOf(TreeMap.parentOf(x))) {
                    x = TreeMap.parentOf(x);
                    this.rotateLeft(x);
                }
                TreeMap.setColor(TreeMap.parentOf(x), true);
                TreeMap.setColor(TreeMap.parentOf(TreeMap.parentOf(x)), false);
                if (TreeMap.parentOf(TreeMap.parentOf(x)) == null) continue;
                this.rotateRight(TreeMap.parentOf(TreeMap.parentOf(x)));
                continue;
            }
            y = TreeMap.leftOf(TreeMap.parentOf(TreeMap.parentOf(x)));
            if (!TreeMap.colorOf(y)) {
                TreeMap.setColor(TreeMap.parentOf(x), true);
                TreeMap.setColor(y, true);
                TreeMap.setColor(TreeMap.parentOf(TreeMap.parentOf(x)), false);
                x = TreeMap.parentOf(TreeMap.parentOf(x));
                continue;
            }
            if (x == TreeMap.leftOf(TreeMap.parentOf(x))) {
                x = TreeMap.parentOf(x);
                this.rotateRight(x);
            }
            TreeMap.setColor(TreeMap.parentOf(x), true);
            TreeMap.setColor(TreeMap.parentOf(TreeMap.parentOf(x)), false);
            if (TreeMap.parentOf(TreeMap.parentOf(x)) == null) continue;
            this.rotateLeft(TreeMap.parentOf(TreeMap.parentOf(x)));
        }
        this.root.color = true;
    }

    private void deleteEntry(Entry p) {
        Entry replacement;
        this.decrementSize();
        if (p.left != null && p.right != null) {
            Entry s = this.successor(p);
            this.swapPosition(s, p);
        }
        Entry entry = replacement = p.left != null ? p.left : p.right;
        if (replacement != null) {
            replacement.parent = p.parent;
            if (p.parent == null) {
                this.root = replacement;
            } else if (p == p.parent.left) {
                p.parent.left = replacement;
            } else {
                p.parent.right = replacement;
            }
            p.parent = null;
            p.right = null;
            p.left = null;
            if (p.color) {
                this.fixAfterDeletion(replacement);
            }
        } else if (p.parent == null) {
            this.root = null;
        } else {
            if (p.color) {
                this.fixAfterDeletion(p);
            }
            if (p.parent != null) {
                if (p == p.parent.left) {
                    p.parent.left = null;
                } else if (p == p.parent.right) {
                    p.parent.right = null;
                }
                p.parent = null;
            }
        }
    }

    private void fixAfterDeletion(Entry x) {
        while (x != this.root && TreeMap.colorOf(x)) {
            Entry sib;
            if (x == TreeMap.leftOf(TreeMap.parentOf(x))) {
                sib = TreeMap.rightOf(TreeMap.parentOf(x));
                if (!TreeMap.colorOf(sib)) {
                    TreeMap.setColor(sib, true);
                    TreeMap.setColor(TreeMap.parentOf(x), false);
                    this.rotateLeft(TreeMap.parentOf(x));
                    sib = TreeMap.rightOf(TreeMap.parentOf(x));
                }
                if (TreeMap.colorOf(TreeMap.leftOf(sib)) && TreeMap.colorOf(TreeMap.rightOf(sib))) {
                    TreeMap.setColor(sib, false);
                    x = TreeMap.parentOf(x);
                    continue;
                }
                if (TreeMap.colorOf(TreeMap.rightOf(sib))) {
                    TreeMap.setColor(TreeMap.leftOf(sib), true);
                    TreeMap.setColor(sib, false);
                    this.rotateRight(sib);
                    sib = TreeMap.rightOf(TreeMap.parentOf(x));
                }
                TreeMap.setColor(sib, TreeMap.colorOf(TreeMap.parentOf(x)));
                TreeMap.setColor(TreeMap.parentOf(x), true);
                TreeMap.setColor(TreeMap.rightOf(sib), true);
                this.rotateLeft(TreeMap.parentOf(x));
                x = this.root;
                continue;
            }
            sib = TreeMap.leftOf(TreeMap.parentOf(x));
            if (!TreeMap.colorOf(sib)) {
                TreeMap.setColor(sib, true);
                TreeMap.setColor(TreeMap.parentOf(x), false);
                this.rotateRight(TreeMap.parentOf(x));
                sib = TreeMap.leftOf(TreeMap.parentOf(x));
            }
            if (TreeMap.colorOf(TreeMap.rightOf(sib)) && TreeMap.colorOf(TreeMap.leftOf(sib))) {
                TreeMap.setColor(sib, false);
                x = TreeMap.parentOf(x);
                continue;
            }
            if (TreeMap.colorOf(TreeMap.leftOf(sib))) {
                TreeMap.setColor(TreeMap.rightOf(sib), true);
                TreeMap.setColor(sib, false);
                this.rotateLeft(sib);
                sib = TreeMap.leftOf(TreeMap.parentOf(x));
            }
            TreeMap.setColor(sib, TreeMap.colorOf(TreeMap.parentOf(x)));
            TreeMap.setColor(TreeMap.parentOf(x), true);
            TreeMap.setColor(TreeMap.leftOf(sib), true);
            this.rotateRight(TreeMap.parentOf(x));
            x = this.root;
        }
        TreeMap.setColor(x, true);
    }

    private void swapPosition(Entry x, Entry y) {
        boolean yWasLeftChild;
        Entry px = x.parent;
        Entry lx = x.left;
        Entry rx = x.right;
        Entry py = y.parent;
        Entry ly = y.left;
        Entry ry = y.right;
        boolean xWasLeftChild = px != null && x == px.left;
        boolean bl = yWasLeftChild = py != null && y == py.left;
        if (x == py) {
            x.parent = y;
            if (yWasLeftChild) {
                y.left = x;
                y.right = rx;
            } else {
                y.right = x;
                y.left = lx;
            }
        } else {
            x.parent = py;
            if (py != null) {
                if (yWasLeftChild) {
                    py.left = x;
                } else {
                    py.right = x;
                }
            }
            y.left = lx;
            y.right = rx;
        }
        if (y == px) {
            y.parent = x;
            if (xWasLeftChild) {
                x.left = y;
                x.right = ry;
            } else {
                x.right = y;
                x.left = ly;
            }
        } else {
            y.parent = px;
            if (px != null) {
                if (xWasLeftChild) {
                    px.left = y;
                } else {
                    px.right = y;
                }
            }
            x.left = ly;
            x.right = ry;
        }
        if (x.left != null) {
            x.left.parent = x;
        }
        if (x.right != null) {
            x.right.parent = x;
        }
        if (y.left != null) {
            y.left.parent = y;
        }
        if (y.right != null) {
            y.right.parent = y;
        }
        boolean c = x.color;
        x.color = y.color;
        y.color = c;
        if (this.root == x) {
            this.root = y;
        } else if (this.root == y) {
            this.root = x;
        }
    }

    private void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.size);
        is.dimon.util.Iterator i = this.entries().iterator();
        while (i.hasNext()) {
            Entry e = (Entry)i.next();
            s.writeObject(e.key);
            s.writeObject(e.value);
        }
    }

    private void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        int size = s.readInt();
        int i = 0;
        while (i < size) {
            Object key = s.readObject();
            Object value = s.readObject();
            this.put(key, value);
            ++i;
        }
    }

    static /* synthetic */ int access$0() {
        return 0;
    }

    static /* synthetic */ int access$1() {
        return 1;
    }

    static /* synthetic */ int access$6() {
        return 2;
    }

    static /* synthetic */ boolean access$9() {
        return true;
    }

    private final class 1
    extends AbstractSet {
        public is.dimon.util.Iterator iterator() {
            return new Iterator(TreeMap.access$0());
        }

        public int size() {
            return TreeMap.this.size();
        }

        public boolean contains(Object o) {
            return TreeMap.this.containsKey(o);
        }

        public boolean remove(Object o) {
            return TreeMap.this.remove(o) != null;
        }

        public void clear() {
            TreeMap.this.clear();
        }

        /* synthetic */ 1() {
        }
    }

    private final class 2
    extends AbstractCollection {
        public is.dimon.util.Iterator iterator() {
            return new Iterator(TreeMap.access$1());
        }

        public int size() {
            return TreeMap.this.size();
        }

        public boolean contains(Object o) {
            Entry e = TreeMap.this.firstEntry();
            while (e != null) {
                if (TreeMap.valEquals(e.getValue(), o)) {
                    return true;
                }
                e = TreeMap.this.successor(e);
            }
            return false;
        }

        public boolean remove(Object o) {
            Entry e = TreeMap.this.firstEntry();
            while (e != null) {
                if (TreeMap.valEquals(e.getValue(), o)) {
                    TreeMap.this.deleteEntry(e);
                    return true;
                }
                e = TreeMap.this.successor(e);
            }
            return false;
        }

        public void clear() {
            TreeMap.this.clear();
        }

        /* synthetic */ 2() {
        }
    }

    private final class 3
    extends AbstractSet {
        public is.dimon.util.Iterator iterator() {
            return new Iterator(TreeMap.access$6());
        }

        public boolean contains(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry)o;
            Object value = entry.getValue();
            Entry p = TreeMap.this.getEntry(entry.getKey());
            return p != null && TreeMap.valEquals(p.getValue(), value);
        }

        public boolean remove(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry)o;
            Object value = entry.getValue();
            Entry p = TreeMap.this.getEntry(entry.getKey());
            if (p != null && TreeMap.valEquals(p.getValue(), value)) {
                TreeMap.this.deleteEntry(p);
                return true;
            }
            return false;
        }

        public int size() {
            return TreeMap.this.size();
        }

        public void clear() {
            TreeMap.this.clear();
        }

        /* synthetic */ 3() {
        }
    }

    private class SubMap
    extends AbstractMap
    implements SortedMap,
    Serializable {
        private boolean fromStart = false;
        private boolean toEnd = false;
        private Object fromKey;
        private Object toKey;
        private transient Set entries = new EntriesView();

        SubMap(Object fromKey, Object toKey) {
            TreeMap.this = TreeMap.this;
            if (TreeMap.this.compare(fromKey, toKey) > 0) {
                throw new IllegalArgumentException("fromKey > toKey");
            }
            this.fromKey = fromKey;
            this.toKey = toKey;
        }

        SubMap(Object key, boolean headMap) {
            TreeMap.this = TreeMap.this;
            if (headMap) {
                this.fromStart = true;
                this.toKey = key;
            } else {
                this.toEnd = true;
                this.fromKey = key;
            }
        }

        SubMap(boolean fromStart, Object fromKey, boolean toEnd, Object toKey) {
            TreeMap.this = TreeMap.this;
            this.fromStart = fromStart;
            this.fromKey = fromKey;
            this.toEnd = toEnd;
            this.toKey = toKey;
        }

        public boolean isEmpty() {
            return this.entries.isEmpty();
        }

        public boolean containsKey(Object key) {
            return this.inRange(key) && TreeMap.this.containsKey(key);
        }

        public Object get(Object key) {
            if (!this.inRange(key)) {
                return null;
            }
            return TreeMap.this.get(key);
        }

        public Comparator comparator() {
            return TreeMap.this.comparator;
        }

        public Object firstKey() {
            return TreeMap.key(this.fromStart ? TreeMap.this.firstEntry() : TreeMap.this.getCeilEntry(this.fromKey));
        }

        public Object lastKey() {
            return TreeMap.key(this.toEnd ? TreeMap.this.lastEntry() : TreeMap.this.getPrecedingEntry(this.toKey));
        }

        public Set entries() {
            return this.entries;
        }

        public SortedMap subMap(Object fromKey, Object toKey) {
            if (!this.inRange(fromKey)) {
                throw new IllegalArgumentException("fromKey out of range");
            }
            if (!this.inRange2(toKey)) {
                throw new IllegalArgumentException("toKey out of range");
            }
            return new SubMap(fromKey, toKey);
        }

        public SortedMap headMap(Object toKey) {
            if (!this.inRange2(toKey)) {
                throw new IllegalArgumentException("toKey out of range");
            }
            return new SubMap(this.fromStart, this.fromKey, false, toKey);
        }

        public SortedMap tailMap(Object fromKey) {
            if (!this.inRange(fromKey)) {
                throw new IllegalArgumentException("fromKey out of range");
            }
            return new SubMap(false, fromKey, this.toEnd, this.toKey);
        }

        private boolean inRange(Object key) {
            return !(!this.fromStart && TreeMap.this.compare(key, this.fromKey) < 0 || !this.toEnd && TreeMap.this.compare(key, this.toKey) >= 0);
        }

        private boolean inRange2(Object key) {
            return !(!this.fromStart && TreeMap.this.compare(key, this.fromKey) < 0 || !this.toEnd && TreeMap.this.compare(key, this.toKey) > 0);
        }

        private class EntriesView
        extends AbstractSet {
            private transient int size = -1;
            private transient int sizeModCount;

            public int size() {
                if (this.size == -1 || this.sizeModCount != TreeMap.this.modCount) {
                    this.size = 0;
                    this.sizeModCount = TreeMap.this.modCount;
                    is.dimon.util.Iterator i = this.iterator();
                    while (i.hasNext()) {
                        ++this.size;
                        i.next();
                    }
                }
                return this.size;
            }

            public boolean isEmpty() {
                return !this.iterator().hasNext();
            }

            public boolean contains(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry)o;
                Object key = entry.getKey();
                if (!SubMap.this.inRange(key)) {
                    return false;
                }
                Entry node = TreeMap.this.getEntry(key);
                return node != null && TreeMap.valEquals(node.getValue(), entry.getValue());
            }

            public boolean remove(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry)o;
                Object key = entry.getKey();
                if (!SubMap.this.inRange(key)) {
                    return false;
                }
                Entry node = TreeMap.this.getEntry(key);
                if (node != null && TreeMap.valEquals(node.getValue(), entry.getValue())) {
                    TreeMap.this.deleteEntry(node);
                    return true;
                }
                return false;
            }

            public is.dimon.util.Iterator iterator() {
                TreeMap treeMap = TreeMap.this;
                treeMap.getClass();
                return treeMap.new Iterator(SubMap.this.fromStart ? TreeMap.this.firstEntry() : TreeMap.this.getCeilEntry(SubMap.this.fromKey), SubMap.this.toEnd ? null : TreeMap.this.getCeilEntry(SubMap.this.toKey));
            }

            EntriesView() {
                SubMap.this = SubMap.this;
            }
        }
    }

    private class Iterator
    implements is.dimon.util.Iterator {
        private int type;
        private int expectedModCount;
        private Entry lastReturned;
        private Entry next;
        private Entry firstExcluded;

        Iterator(int type) {
            TreeMap.this = TreeMap.this;
            this.expectedModCount = TreeMap.this.modCount;
            this.type = type;
            this.next = TreeMap.this.firstEntry();
        }

        Iterator(Entry first, Entry firstExcluded) {
            TreeMap.this = TreeMap.this;
            this.expectedModCount = TreeMap.this.modCount;
            this.type = TreeMap.access$6();
            this.next = first;
            this.firstExcluded = firstExcluded;
        }

        public boolean hasNext() {
            return this.next != this.firstExcluded;
        }

        public Object next() {
            if (this.next == this.firstExcluded) {
                throw new NoSuchElementException();
            }
            if (TreeMap.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            this.lastReturned = this.next;
            this.next = TreeMap.this.successor(this.next);
            return this.type == TreeMap.access$0() ? this.lastReturned.key : (this.type == TreeMap.access$1() ? this.lastReturned.value : this.lastReturned);
        }

        public void remove() {
            if (this.lastReturned == null) {
                throw new IllegalStateException();
            }
            if (TreeMap.this.modCount != this.expectedModCount) {
                throw new ConcurrentModificationException();
            }
            TreeMap.this.deleteEntry(this.lastReturned);
            ++this.expectedModCount;
            this.lastReturned = null;
        }
    }

    static class Entry
    implements Map.Entry {
        Object key;
        Object value;
        Entry left;
        Entry right;
        Entry parent;
        boolean color = TreeMap.access$9();

        Entry(Object key, Object value, Entry parent) {
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
}
