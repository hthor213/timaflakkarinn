/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.List;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class ArrayList
extends AbstractList
implements List,
Cloneable,
Serializable {
    private transient Object[] elementData;
    private int elementCount;
    private int capacityIncrement;

    public ArrayList(int initialCapacity, int capacityIncrement) {
        this.elementData = new Object[initialCapacity];
        this.capacityIncrement = capacityIncrement;
    }

    public ArrayList(int initialCapacity) {
        this(initialCapacity, 0);
    }

    public ArrayList() {
        this(10);
    }

    public ArrayList(Collection c) {
        this(c.size() * 110 / 100);
        Iterator i = c.iterator();
        while (i.hasNext()) {
            this.elementData[this.elementCount++] = i.next();
        }
    }

    public void trimToSize() {
        ++this.modCount;
        int oldCapacity = this.elementData.length;
        if (this.elementCount < oldCapacity) {
            Object[] oldData = this.elementData;
            this.elementData = new Object[this.elementCount];
            System.arraycopy(oldData, 0, this.elementData, 0, this.elementCount);
        }
    }

    public void ensureCapacity(int minCapacity) {
        ++this.modCount;
        int oldCapacity = this.elementData.length;
        if (minCapacity > oldCapacity) {
            int newCapacity;
            Object[] oldData = this.elementData;
            int n = newCapacity = this.capacityIncrement > 0 ? oldCapacity + this.capacityIncrement : oldCapacity * 2;
            if (newCapacity < minCapacity) {
                newCapacity = minCapacity;
            }
            this.elementData = new Object[newCapacity];
            System.arraycopy(oldData, 0, this.elementData, 0, this.elementCount);
        }
    }

    public int size() {
        return this.elementCount;
    }

    public boolean isEmpty() {
        return this.elementCount == 0;
    }

    public boolean contains(Object elem) {
        return this.indexOf(elem, 0) >= 0;
    }

    public int indexOf(Object elem) {
        return this.indexOf(elem, 0);
    }

    public int indexOf(Object elem, int index) {
        if (elem == null) {
            int i = index;
            while (i < this.elementCount) {
                if (this.elementData[i] == null) {
                    return i;
                }
                ++i;
            }
        } else {
            int i = index;
            while (i < this.elementCount) {
                if (elem.equals(this.elementData[i])) {
                    return i;
                }
                ++i;
            }
        }
        return -1;
    }

    public int lastIndexOf(Object elem) {
        return this.lastIndexOf(elem, this.elementCount - 1);
    }

    public int lastIndexOf(Object elem, int index) {
        if (elem == null) {
            int i = index;
            while (i >= 0) {
                if (this.elementData[i] == null) {
                    return i;
                }
                --i;
            }
        } else {
            int i = index;
            while (i >= 0) {
                if (elem.equals(this.elementData[i])) {
                    return i;
                }
                --i;
            }
        }
        return -1;
    }

    public Object clone() {
        try {
            ArrayList v = (ArrayList)super.clone();
            v.elementData = new Object[this.elementCount];
            System.arraycopy(this.elementData, 0, v.elementData, 0, this.elementCount);
            v.modCount = 0;
            return v;
        }
        catch (CloneNotSupportedException cloneNotSupportedException) {
            throw new InternalError();
        }
    }

    public Object[] toArray() {
        Object[] result = new Object[this.elementCount];
        System.arraycopy(this.elementData, 0, result, 0, this.elementCount);
        return result;
    }

    public Object get(int index) {
        this.RangeCheck(index);
        return this.elementData[index];
    }

    public Object set(int index, Object element) {
        this.RangeCheck(index);
        Object oldValue = this.elementData[index];
        this.elementData[index] = element;
        return oldValue;
    }

    public boolean add(Object o) {
        this.ensureCapacity(this.elementCount + 1);
        this.elementData[this.elementCount++] = o;
        return true;
    }

    public void add(int index, Object element) {
        this.RangeCheck(index);
        this.ensureCapacity(this.elementCount + 1);
        System.arraycopy(this.elementData, index, this.elementData, index + 1, this.elementCount - index);
        this.elementData[index] = element;
        ++this.elementCount;
    }

    public Object remove(int index) {
        this.RangeCheck(index);
        ++this.modCount;
        Object oldValue = this.elementData[index];
        int numMoved = this.elementCount - index - 1;
        if (numMoved > 0) {
            System.arraycopy(this.elementData, index + 1, this.elementData, index, numMoved);
        }
        this.elementData[--this.elementCount] = null;
        return oldValue;
    }

    public void clear() {
        ++this.modCount;
        int i = 0;
        while (i < this.elementCount) {
            this.elementData[i] = null;
            ++i;
        }
        this.elementCount = 0;
    }

    public boolean addAll(Collection c) {
        ++this.modCount;
        int numNew = c.size();
        this.ensureCapacity(this.elementCount + numNew);
        Iterator e = c.iterator();
        int i = 0;
        while (i < numNew) {
            this.elementData[this.elementCount++] = e.next();
            ++i;
        }
        return numNew != 0;
    }

    public void removeRange(int fromIndex, int toIndex) {
        ++this.modCount;
        if (fromIndex < 0 || fromIndex >= this.elementCount || toIndex > this.elementCount || toIndex < fromIndex) {
            throw new IndexOutOfBoundsException();
        }
        int numMoved = this.elementCount - toIndex;
        if (numMoved > 0) {
            System.arraycopy(this.elementData, toIndex, this.elementData, fromIndex, numMoved);
        }
        int newElementCount = this.elementCount - (toIndex - fromIndex);
        while (this.elementCount != newElementCount) {
            this.elementData[--this.elementCount] = null;
        }
    }

    public boolean addAll(int index, Collection c) {
        this.RangeCheck(index);
        int numNew = c.size();
        this.ensureCapacity(this.elementCount + numNew);
        int numMoved = this.elementCount - index;
        if (numMoved > 0) {
            System.arraycopy(this.elementData, index, this.elementData, index + numNew, numMoved);
        }
        Iterator e = c.iterator();
        int i = 0;
        while (i < numNew) {
            this.elementData[index++] = e.next();
            ++i;
        }
        this.elementCount += numNew;
        return numNew != 0;
    }

    private void RangeCheck(int index) {
        if (index >= this.elementCount || index < 0) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + this.elementCount);
        }
    }

    private synchronized void writeObject(ObjectOutputStream s) throws IOException {
        s.defaultWriteObject();
        s.writeInt(this.elementData.length);
        int i = 0;
        while (i < this.elementCount) {
            s.writeObject(this.elementData[i]);
            ++i;
        }
    }

    private synchronized void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        s.defaultReadObject();
        int arrayLength = s.readInt();
        this.elementData = new Object[arrayLength];
        int i = 0;
        while (i < this.elementCount) {
            this.elementData[i] = s.readObject();
            ++i;
        }
    }

    int capacity() {
        return this.elementData.length;
    }

    int capacityIncrement() {
        return this.capacityIncrement;
    }
}
