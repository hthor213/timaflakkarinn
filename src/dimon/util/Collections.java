/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.AbstractSequentialList;
import is.dimon.util.Arrays;
import is.dimon.util.Collection;
import is.dimon.util.Collections;
import is.dimon.util.Comparable;
import is.dimon.util.Comparator;
import is.dimon.util.Enumeration;
import is.dimon.util.Iterator;
import is.dimon.util.List;
import is.dimon.util.ListIterator;
import is.dimon.util.Map;
import is.dimon.util.Set;
import is.dimon.util.SortedMap;
import is.dimon.util.SortedSet;
import is.dimon.util.UnsupportedOperationException;
import java.io.Serializable;

public class Collections {
    public static final Comparator REVERSE_ORDER = new ReverseComparator();

    public static void sort(List list) {
        Object[] a = list.toArray();
        Arrays.sort(a);
        ListIterator i = list.listIterator();
        int j = 0;
        while (j < a.length) {
            i.next();
            i.set(a[j]);
            ++j;
        }
    }

    public static void sort(List list, Comparator c) {
        Object[] a = list.toArray();
        Arrays.sort(a, c);
        ListIterator i = list.listIterator();
        int j = 0;
        while (j < a.length) {
            i.next();
            i.set(a[j]);
            ++j;
        }
    }

    public static int binarySearch(List list, Object key) {
        if (list instanceof AbstractSequentialList) {
            ListIterator i = list.listIterator();
            while (i.hasNext()) {
                int cmp = ((Comparable)i.next()).compareTo(key);
                if (cmp == 0) {
                    return i.previousIndex();
                }
                if (cmp <= 0) continue;
                return -i.nextIndex();
            }
            return -i.nextIndex();
        }
        int low = 0;
        int high = list.size() - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            Object midVal = list.get(mid);
            int cmp = ((Comparable)midVal).compareTo(key);
            if (cmp < 0) {
                low = mid + 1;
                continue;
            }
            if (cmp > 0) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(List list, Object key, Comparator c) {
        if (list instanceof AbstractSequentialList) {
            ListIterator i = list.listIterator();
            while (i.hasNext()) {
                int cmp = c.compare(i.next(), key);
                if (cmp == 0) {
                    return i.previousIndex();
                }
                if (cmp <= 0) continue;
                return -i.nextIndex();
            }
            return -i.nextIndex();
        }
        int low = 0;
        int high = list.size() - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            Object midVal = list.get(mid);
            int cmp = c.compare(midVal, key);
            if (cmp < 0) {
                low = mid + 1;
                continue;
            }
            if (cmp > 0) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static Object min(Collection coll) {
        Iterator i = coll.iterator();
        Comparable candidate = (Comparable)i.next();
        while (i.hasNext()) {
            Comparable next = (Comparable)i.next();
            if (next.compareTo(candidate) >= 0) continue;
            candidate = next;
        }
        return candidate;
    }

    public static Object min(Collection coll, Comparator comp) {
        Iterator i = coll.iterator();
        Object candidate = i.next();
        while (i.hasNext()) {
            Object next = i.next();
            if (comp.compare(next, candidate) >= 0) continue;
            candidate = next;
        }
        return candidate;
    }

    public static Object max(Collection coll) {
        Iterator i = coll.iterator();
        Comparable candidate = (Comparable)i.next();
        while (i.hasNext()) {
            Comparable next = (Comparable)i.next();
            if (next.compareTo(candidate) <= 0) continue;
            candidate = next;
        }
        return candidate;
    }

    public static Object max(Collection coll, Comparator comp) {
        Iterator i = coll.iterator();
        Object candidate = i.next();
        while (i.hasNext()) {
            Object next = i.next();
            if (comp.compare(next, candidate) <= 0) continue;
            candidate = next;
        }
        return candidate;
    }

    public static List subList(List list, int fromIndex, int toIndex) {
        return new SubList(list, fromIndex, toIndex);
    }

    public static Collection unmodifiableCollection(Collection c) {
        return new UnmodifiableCollection(c);
    }

    public static Set unmodifiableSet(Set s) {
        return new UnmodifiableSet(s);
    }

    public static SortedSet unmodifiableSortedSet(SortedSet s) {
        return new UnmodifiableSortedSet(s);
    }

    public static List unmodifiableList(List list) {
        return new UnmodifiableList(list);
    }

    public static Map unmodifiableMap(Map m) {
        return new UnmodifiableMap(m);
    }

    public static SortedMap unmodifiableSortedMap(SortedMap m) {
        return new UnmodifiableSortedMap(m);
    }

    public static Collection synchronizedCollection(Collection c) {
        return new SynchronizedCollection(c);
    }

    public static Set synchronizedSet(Set s) {
        return new SynchronizedSet(s);
    }

    public static SortedSet synchronizedSortedSet(SortedSet s) {
        return new SynchronizedSortedSet(s);
    }

    public static List synchronizedList(List list) {
        return new SynchronizedList(list);
    }

    public static Map synchronizedMap(Map m) {
        return new SynchronizedMap(m);
    }

    public static SortedMap synchronizedSortedMap(SortedMap m) {
        return new SynchronizedSortedMap(m);
    }

    public static List nCopies(int n, Object o) {
        if (n < 0) {
            throw new IllegalArgumentException("List length = " + n);
        }
        return new 4(n, o);
    }

    public static Enumeration enumeration(Collection c) {
        return new 5(c);
    }

    static class SubList
    extends AbstractList {
        private List backer;
        private int offset;
        private int size;

        SubList(List list, int fromIndex, int toIndex) {
            this.backer = list;
            this.offset = fromIndex;
            this.size = toIndex - fromIndex;
            if (this.size < 0) {
                throw new IllegalArgumentException("fromIndex < toIndex");
            }
            int backerSize = this.backer.size();
            if (fromIndex < 0 || fromIndex > backerSize || toIndex < 0 || toIndex > backerSize) {
                throw new IndexOutOfBoundsException();
            }
        }

        public int size() {
            return this.size;
        }

        public Iterator iterator() {
            return this.listIterator();
        }

        public Object get(int index) {
            this.rangeCheck(index);
            return this.backer.get(index + this.offset);
        }

        public Object set(int index, Object element) {
            this.rangeCheck(index);
            return this.backer.set(index + this.offset, element);
        }

        public int indexOf(Object o, int index) {
            this.rangeCheck(index);
            ListIterator i = this.backer.listIterator(index + this.offset);
            if (o == null) {
                int j = index;
                while (j < this.size) {
                    if (i.next() == null) {
                        return i.previousIndex() - this.offset;
                    }
                    ++j;
                }
            } else {
                int j = index;
                while (j < this.size) {
                    if (o.equals(i.next())) {
                        return i.previousIndex() - this.offset;
                    }
                    ++j;
                }
            }
            return -1;
        }

        public int lastIndexOf(Object o, int index) {
            this.rangeCheck(index);
            ListIterator i = this.backer.listIterator(index + this.offset + 1);
            if (o == null) {
                int j = index;
                while (j >= 0) {
                    if (i.previous() == null) {
                        return i.nextIndex() - this.offset;
                    }
                    --j;
                }
            } else {
                int j = index;
                while (j >= 0) {
                    if (o.equals(i.previous())) {
                        return i.nextIndex() - this.offset;
                    }
                    --j;
                }
            }
            return -1;
        }

        public ListIterator listIterator(int index) {
            if (index < 0 || index > this.size) {
                throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + this.size);
            }
            return new 1(index, this);
        }

        private void rangeCheck(int index) {
            if (index < 0 || index >= this.size) {
                throw new IndexOutOfBoundsException("Index: " + index + ",Size: " + this.size);
            }
        }

        static /* synthetic */ List access$0(SubList $0) {
            return $0.backer;
        }

        static /* synthetic */ int access$1(SubList $0) {
            return $0.offset;
        }

        static /* synthetic */ int access$2(SubList $0) {
            return $0.size;
        }
    }

    static class UnmodifiableCollection
    implements Collection,
    Serializable {
        private Collection c;

        UnmodifiableCollection(Collection c) {
            this.c = c;
        }

        public int size() {
            return this.c.size();
        }

        public boolean isEmpty() {
            return this.c.isEmpty();
        }

        public boolean contains(Object o) {
            return this.c.contains(o);
        }

        public Object[] toArray() {
            return this.c.toArray();
        }

        public Object[] toArray(Object[] a) {
            return this.c.toArray(a);
        }

        public Iterator iterator() {
            return new 2(this);
        }

        public boolean add(Object o) {
            throw new UnsupportedOperationException();
        }

        public boolean remove(Object o) {
            throw new UnsupportedOperationException();
        }

        public boolean containsAll(Collection coll) {
            return this.c.containsAll(coll);
        }

        public boolean addAll(Collection coll) {
            throw new UnsupportedOperationException();
        }

        public boolean removeAll(Collection coll) {
            throw new UnsupportedOperationException();
        }

        public boolean retainAll(Collection coll) {
            throw new UnsupportedOperationException();
        }

        public void clear() {
            throw new UnsupportedOperationException();
        }
    }

    static class UnmodifiableSet
    extends UnmodifiableCollection
    implements Set,
    Serializable {
        UnmodifiableSet(Set s) {
            super(s);
        }

        public boolean equals(Object o) {
            return ((UnmodifiableCollection)this).c.equals(o);
        }

        public int hashCode() {
            return ((UnmodifiableCollection)this).c.hashCode();
        }
    }

    static class UnmodifiableSortedSet
    extends UnmodifiableSet
    implements SortedSet,
    Serializable {
        private SortedSet ss;

        UnmodifiableSortedSet(SortedSet s) {
            super(s);
            this.ss = s;
        }

        public Comparator comparator() {
            return this.ss.comparator();
        }

        public SortedSet subSet(Object fromElement, Object toElement) {
            return new UnmodifiableSortedSet(this.ss.subSet(fromElement, toElement));
        }

        public SortedSet headSet(Object toElement) {
            return new UnmodifiableSortedSet(this.ss.headSet(toElement));
        }

        public SortedSet tailSet(Object fromElement) {
            return new UnmodifiableSortedSet(this.ss.tailSet(fromElement));
        }

        public Object first() {
            return this.ss.first();
        }

        public Object last() {
            return this.ss.last();
        }
    }

    static class UnmodifiableList
    extends UnmodifiableCollection
    implements List {
        private List list;

        UnmodifiableList(List list) {
            super(list);
            this.list = list;
        }

        public boolean equals(Object o) {
            return this.list.equals(o);
        }

        public int hashCode() {
            return this.list.hashCode();
        }

        public Object get(int index) {
            return this.list.get(index);
        }

        public Object set(int index, Object element) {
            throw new UnsupportedOperationException();
        }

        public void add(int index, Object element) {
            throw new UnsupportedOperationException();
        }

        public Object remove(int index) {
            throw new UnsupportedOperationException();
        }

        public int indexOf(Object o) {
            return this.list.indexOf(o);
        }

        public int indexOf(Object o, int i) {
            return this.list.indexOf(o, i);
        }

        public int lastIndexOf(Object o) {
            return this.list.lastIndexOf(o);
        }

        public int lastIndexOf(Object o, int i) {
            return this.list.lastIndexOf(o, i);
        }

        public void removeRange(int fromIndex, int toIndex) {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(int index, Collection c) {
            throw new UnsupportedOperationException();
        }

        public ListIterator listIterator() {
            return this.listIterator(0);
        }

        public ListIterator listIterator(int index) {
            return new 3(index, this);
        }

        static /* synthetic */ List access$0(UnmodifiableList $0) {
            return $0.list;
        }
    }

    private static class UnmodifiableMap
    implements Map,
    Serializable {
        private final Map m;
        private transient Set keySet;
        private transient Set entries;
        private transient Collection values;

        UnmodifiableMap(Map m) {
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

    static class UnmodifiableSortedMap
    extends UnmodifiableMap
    implements SortedMap,
    Serializable {
        private SortedMap sm;

        UnmodifiableSortedMap(SortedMap m) {
            super(m);
            this.sm = m;
        }

        public Comparator comparator() {
            return this.sm.comparator();
        }

        public SortedMap subMap(Object fromKey, Object toKey) {
            return new UnmodifiableSortedMap(this.sm.subMap(fromKey, toKey));
        }

        public SortedMap headMap(Object toKey) {
            return new UnmodifiableSortedMap(this.sm.headMap(toKey));
        }

        public SortedMap tailMap(Object fromKey) {
            return new UnmodifiableSortedMap(this.sm.tailMap(fromKey));
        }

        public Object firstKey() {
            return this.sm.firstKey();
        }

        public Object lastKey() {
            return this.sm.lastKey();
        }
    }

    static class SynchronizedCollection
    implements Collection,
    Serializable {
        private Collection c;
        private Object mutex;

        SynchronizedCollection(Collection c) {
            this.c = c;
            this.mutex = this;
        }

        SynchronizedCollection(Collection c, Object mutex) {
            this.c = c;
            this.mutex = mutex;
        }

        public int size() {
            Object object = this.mutex;
            synchronized (object) {
                int n = this.c.size();
                Object var3_3 = null;
                return n;
            }
        }

        public boolean isEmpty() {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.isEmpty();
                Object var3_3 = null;
                return bl;
            }
        }

        public boolean contains(Object o) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.contains(o);
                Object var4_4 = null;
                return bl;
            }
        }

        public Object[] toArray() {
            Object object = this.mutex;
            synchronized (object) {
                Object[] objectArray = this.c.toArray();
                Object var3_3 = null;
                return objectArray;
            }
        }

        public Object[] toArray(Object[] a) {
            Object object = this.mutex;
            synchronized (object) {
                Object[] objectArray = this.c.toArray(a);
                Object var4_4 = null;
                return objectArray;
            }
        }

        public Iterator iterator() {
            return this.c.iterator();
        }

        public boolean add(Object o) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.add(o);
                Object var4_4 = null;
                return bl;
            }
        }

        public boolean remove(Object o) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.remove(o);
                Object var4_4 = null;
                return bl;
            }
        }

        public boolean containsAll(Collection coll) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.containsAll(coll);
                Object var4_4 = null;
                return bl;
            }
        }

        public boolean addAll(Collection coll) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.addAll(coll);
                Object var4_4 = null;
                return bl;
            }
        }

        public boolean removeAll(Collection coll) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.removeAll(coll);
                Object var4_4 = null;
                return bl;
            }
        }

        public boolean retainAll(Collection coll) {
            Object object = this.mutex;
            synchronized (object) {
                boolean bl = this.c.retainAll(coll);
                Object var4_4 = null;
                return bl;
            }
        }

        public void clear() {
            Object object = this.mutex;
            synchronized (object) {
                this.c.clear();
            }
        }
    }

    static class SynchronizedSet
    extends SynchronizedCollection
    implements Set {
        SynchronizedSet(Set s) {
            super(s);
        }

        SynchronizedSet(Set s, Object mutex) {
            super(s, mutex);
        }

        public boolean equals(Object o) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                boolean bl = ((SynchronizedCollection)this).c.equals(o);
                Object var4_4 = null;
                return bl;
            }
        }

        public int hashCode() {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = ((SynchronizedCollection)this).c.hashCode();
                Object var3_3 = null;
                return n;
            }
        }
    }

    static class SynchronizedSortedSet
    extends SynchronizedSet
    implements SortedSet {
        private SortedSet ss;

        SynchronizedSortedSet(SortedSet s) {
            super(s);
            this.ss = s;
        }

        SynchronizedSortedSet(SortedSet s, Object mutex) {
            super(s, mutex);
            this.ss = s;
        }

        public Comparator comparator() {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Comparator comparator = this.ss.comparator();
                Object var3_3 = null;
                return comparator;
            }
        }

        public SortedSet subSet(Object fromElement, Object toElement) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                SynchronizedSortedSet synchronizedSortedSet = new SynchronizedSortedSet(this.ss.subSet(fromElement, toElement), ((SynchronizedCollection)this).mutex);
                Object var5_5 = null;
                return synchronizedSortedSet;
            }
        }

        public SortedSet headSet(Object toElement) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                SynchronizedSortedSet synchronizedSortedSet = new SynchronizedSortedSet(this.ss.headSet(toElement), ((SynchronizedCollection)this).mutex);
                Object var4_4 = null;
                return synchronizedSortedSet;
            }
        }

        public SortedSet tailSet(Object fromElement) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                SynchronizedSortedSet synchronizedSortedSet = new SynchronizedSortedSet(this.ss.tailSet(fromElement), ((SynchronizedCollection)this).mutex);
                Object var4_4 = null;
                return synchronizedSortedSet;
            }
        }

        public Object first() {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Object object2 = this.ss.first();
                Object var3_3 = null;
                return object2;
            }
        }

        public Object last() {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Object object2 = this.ss.last();
                Object var3_3 = null;
                return object2;
            }
        }
    }

    static class SynchronizedList
    extends SynchronizedCollection
    implements List {
        private List list;

        SynchronizedList(List list) {
            super(list);
            this.list = list;
        }

        public boolean equals(Object o) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                boolean bl = this.list.equals(o);
                Object var4_4 = null;
                return bl;
            }
        }

        public int hashCode() {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = this.list.hashCode();
                Object var3_3 = null;
                return n;
            }
        }

        public Object get(int index) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Object object2 = this.list.get(index);
                Object var4_4 = null;
                return object2;
            }
        }

        public Object set(int index, Object element) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Object object2 = this.list.set(index, element);
                Object var5_5 = null;
                return object2;
            }
        }

        public void add(int index, Object element) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                this.list.add(index, element);
            }
        }

        public Object remove(int index) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                Object object2 = this.list.remove(index);
                Object var4_4 = null;
                return object2;
            }
        }

        public int indexOf(Object o) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = this.list.indexOf(o);
                Object var4_4 = null;
                return n;
            }
        }

        public int indexOf(Object o, int i) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = this.list.indexOf(o, i);
                Object var5_5 = null;
                return n;
            }
        }

        public int lastIndexOf(Object o) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = this.list.lastIndexOf(o);
                Object var4_4 = null;
                return n;
            }
        }

        public int lastIndexOf(Object o, int i) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                int n = this.list.lastIndexOf(o, i);
                Object var5_5 = null;
                return n;
            }
        }

        public void removeRange(int fromIndex, int toIndex) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                this.list.removeRange(fromIndex, toIndex);
            }
        }

        public boolean addAll(int index, Collection c) {
            Object object = ((SynchronizedCollection)this).mutex;
            synchronized (object) {
                boolean bl = this.list.addAll(index, c);
                Object var5_5 = null;
                return bl;
            }
        }

        public ListIterator listIterator() {
            return this.list.listIterator();
        }

        public ListIterator listIterator(int index) {
            return this.list.listIterator(index);
        }
    }

    private static class SynchronizedMap
    implements Map {
        private Map m;
        private Object mutex;
        private transient Set keySet;
        private transient Set entries;
        private transient Collection values;

        SynchronizedMap(Map m) {
            this.m = m;
            this.mutex = this;
        }

        SynchronizedMap(Map m, Object mutex) {
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
                    this.keySet = new SynchronizedSet(this.m.keySet(), (Object)this);
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
                    this.entries = new SynchronizedSet(this.m.entries(), (Object)this);
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
                    this.values = new SynchronizedCollection(this.m.values(), this);
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
    }

    static class SynchronizedSortedMap
    extends SynchronizedMap
    implements SortedMap {
        private SortedMap sm;

        SynchronizedSortedMap(SortedMap m) {
            super(m);
            this.sm = m;
        }

        SynchronizedSortedMap(SortedMap m, Object mutex) {
            super(m, mutex);
            this.sm = m;
        }

        public Comparator comparator() {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                Comparator comparator = this.sm.comparator();
                Object var3_3 = null;
                return comparator;
            }
        }

        public SortedMap subMap(Object fromKey, Object toKey) {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                SynchronizedSortedMap synchronizedSortedMap = new SynchronizedSortedMap(this.sm.subMap(fromKey, toKey), ((SynchronizedMap)this).mutex);
                Object var5_5 = null;
                return synchronizedSortedMap;
            }
        }

        public SortedMap headMap(Object toKey) {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                SynchronizedSortedMap synchronizedSortedMap = new SynchronizedSortedMap(this.sm.headMap(toKey), ((SynchronizedMap)this).mutex);
                Object var4_4 = null;
                return synchronizedSortedMap;
            }
        }

        public SortedMap tailMap(Object fromKey) {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                SynchronizedSortedMap synchronizedSortedMap = new SynchronizedSortedMap(this.sm.tailMap(fromKey), ((SynchronizedMap)this).mutex);
                Object var4_4 = null;
                return synchronizedSortedMap;
            }
        }

        public Object firstKey() {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                Object object2 = this.sm.firstKey();
                Object var3_3 = null;
                return object2;
            }
        }

        public Object lastKey() {
            Object object = ((SynchronizedMap)this).mutex;
            synchronized (object) {
                Object object2 = this.sm.lastKey();
                Object var3_3 = null;
                return object2;
            }
        }
    }

    private static final class 4
    extends AbstractList {
        private final /* synthetic */ Object val$o;
        private final /* synthetic */ int val$n;

        public int size() {
            return this.val$n;
        }

        public boolean contains(Object obj) {
            return this.val$n != 0 && this.val$o.equals(obj);
        }

        public Object get(int index) {
            if (index < 0 || index > this.val$n) {
                throw new IndexOutOfBoundsException("Index: " + index + ",Size: " + this.val$n);
            }
            return this.val$o;
        }

        /* synthetic */ 4(int val$n, Object val$o) {
            this.val$n = val$n;
            this.val$o = val$o;
        }
    }

    private static class ReverseComparator
    implements Comparator,
    Serializable {
        public int compare(Object o1, Object o2) {
            Comparable c1 = (Comparable)o1;
            Comparable c2 = (Comparable)o2;
            return -c1.compareTo(c2);
        }

        ReverseComparator() {
        }
    }

    private final class 5
    implements Enumeration {
        Iterator i;

        public boolean hasMoreElements() {
            return this.i.hasNext();
        }

        public Object nextElement() {
            return this.i.next();
        }

        /* synthetic */ 5(Collection val$c) {
            this.i = val$c.iterator();
        }
    }
}
