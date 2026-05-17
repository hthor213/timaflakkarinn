/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.Collection;
import is.dimon.util.Enumeration;
import is.dimon.util.Iterator;
import is.dimon.util.List;
import is.dimon.util.NoSuchElementException;
import java.io.Serializable;

public class Vector
extends AbstractList
implements List,
Cloneable,
Serializable {
    protected Object[] elementData;
    protected int elementCount;
    protected int capacityIncrement;
    private static final long serialVersionUID = -2767605614048989439L;

    public Vector(int initialCapacity, int capacityIncrement) {
        if (initialCapacity < 0) {
            throw new IllegalArgumentException("Illegal Capacity: " + initialCapacity);
        }
        this.elementData = new Object[initialCapacity];
        this.capacityIncrement = capacityIncrement;
    }

    public Vector(int initialCapacity) {
        this(initialCapacity, 0);
    }

    public Vector() {
        this(10);
    }

    public Vector(Collection c) {
        this(c.size() * 110 / 100);
        Iterator i = c.iterator();
        while (i.hasNext()) {
            this.elementData[this.elementCount++] = i.next();
        }
    }

    public synchronized void copyInto(Object[] anArray) {
        System.arraycopy(this.elementData, 0, anArray, 0, this.elementCount);
    }

    public synchronized void trimToSize() {
        ++this.modCount;
        int oldCapacity = this.elementData.length;
        if (this.elementCount < oldCapacity) {
            Object[] oldData = this.elementData;
            this.elementData = new Object[this.elementCount];
            System.arraycopy(oldData, 0, this.elementData, 0, this.elementCount);
        }
    }

    public synchronized void ensureCapacity(int minCapacity) {
        this.ensureCapacityHelper(minCapacity);
    }

    private void ensureCapacityHelper(int minCapacity) {
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

    public synchronized void setSize(int newSize) {
        ++this.modCount;
        if (newSize > this.elementCount) {
            this.ensureCapacityHelper(newSize);
        } else {
            int i = newSize;
            while (i < this.elementCount) {
                this.elementData[i] = null;
                ++i;
            }
        }
        this.elementCount = newSize;
    }

    public int capacity() {
        return this.elementData.length;
    }

    public int size() {
        return this.elementCount;
    }

    public boolean isEmpty() {
        return this.elementCount == 0;
    }

    public synchronized Enumeration elements() {
        return new 1();
    }

    public boolean contains(Object elem) {
        return this.indexOf(elem, 0) >= 0;
    }

    public int indexOf(Object elem) {
        return this.indexOf(elem, 0);
    }

    public synchronized int indexOf(Object elem, int index) {
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

    public synchronized int lastIndexOf(Object elem, int index) {
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

    public synchronized Object elementAt(int index) {
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(String.valueOf(index) + " >= " + this.elementCount);
        }
        try {
            return this.elementData[index];
        }
        catch (ArrayIndexOutOfBoundsException arrayIndexOutOfBoundsException) {
            throw new ArrayIndexOutOfBoundsException(String.valueOf(index) + " < 0");
        }
    }

    public synchronized Object firstElement() {
        if (this.elementCount == 0) {
            throw new NoSuchElementException();
        }
        return this.elementData[0];
    }

    public synchronized Object lastElement() {
        if (this.elementCount == 0) {
            throw new NoSuchElementException();
        }
        return this.elementData[this.elementCount - 1];
    }

    public synchronized void setElementAt(Object obj, int index) {
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(String.valueOf(index) + " >= " + this.elementCount);
        }
        this.elementData[index] = obj;
    }

    public synchronized void removeElementAt(int index) {
        ++this.modCount;
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(String.valueOf(index) + " >= " + this.elementCount);
        }
        if (index < 0) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        int j = this.elementCount - index - 1;
        if (j > 0) {
            System.arraycopy(this.elementData, index + 1, this.elementData, index, j);
        }
        --this.elementCount;
        this.elementData[this.elementCount] = null;
    }

    public synchronized void insertElementAt(Object obj, int index) {
        ++this.modCount;
        if (index >= this.elementCount + 1) {
            throw new ArrayIndexOutOfBoundsException(String.valueOf(index) + " > " + this.elementCount);
        }
        this.ensureCapacityHelper(this.elementCount + 1);
        System.arraycopy(this.elementData, index, this.elementData, index + 1, this.elementCount - index);
        this.elementData[index] = obj;
        ++this.elementCount;
    }

    public synchronized void addElement(Object obj) {
        ++this.modCount;
        this.ensureCapacityHelper(this.elementCount + 1);
        this.elementData[this.elementCount++] = obj;
    }

    public synchronized boolean removeElement(Object obj) {
        ++this.modCount;
        int i = this.indexOf(obj);
        if (i >= 0) {
            this.removeElementAt(i);
            return true;
        }
        return false;
    }

    public synchronized void removeAllElements() {
        ++this.modCount;
        int i = 0;
        while (i < this.elementCount) {
            this.elementData[i] = null;
            ++i;
        }
        this.elementCount = 0;
    }

    public synchronized Object clone() {
        try {
            Vector v = (Vector)super.clone();
            v.elementData = new Object[this.elementCount];
            System.arraycopy(this.elementData, 0, v.elementData, 0, this.elementCount);
            v.modCount = 0;
            return v;
        }
        catch (CloneNotSupportedException cloneNotSupportedException) {
            throw new InternalError();
        }
    }

    public synchronized Object[] toArray() {
        Object[] result = new Object[this.elementCount];
        System.arraycopy(this.elementData, 0, result, 0, this.elementCount);
        return result;
    }

    public synchronized Object get(int index) {
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        return this.elementData[index];
    }

    public synchronized Object set(int index, Object element) {
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        Object oldValue = this.elementData[index];
        this.elementData[index] = element;
        return oldValue;
    }

    public synchronized void add(int index, Object element) {
        if (index > this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        this.ensureCapacityHelper(this.elementCount + 1);
        System.arraycopy(this.elementData, index, this.elementData, index + 1, this.elementCount - index);
        this.elementData[index] = element;
        ++this.elementCount;
    }

    public synchronized Object remove(int index) {
        ++this.modCount;
        if (index >= this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        Object oldValue = this.elementData[index];
        int numMoved = this.elementCount - index - 1;
        if (numMoved > 0) {
            System.arraycopy(this.elementData, index + 1, this.elementData, index, numMoved);
        }
        this.elementData[--this.elementCount] = null;
        return oldValue;
    }

    public synchronized void clear() {
        ++this.modCount;
        int i = 0;
        while (i < this.elementCount) {
            this.elementData[i] = null;
            ++i;
        }
        this.elementCount = 0;
    }

    public synchronized boolean addAll(Collection c) {
        ++this.modCount;
        int numNew = c.size();
        this.ensureCapacityHelper(this.elementCount + numNew);
        Iterator e = c.iterator();
        int i = 0;
        while (i < numNew) {
            this.elementData[this.elementCount++] = e.next();
            ++i;
        }
        return numNew != 0;
    }

    public synchronized void removeRange(int fromIndex, int toIndex) {
        ++this.modCount;
        if (fromIndex < 0 || fromIndex >= this.elementCount || toIndex > this.elementCount || toIndex < fromIndex) {
            throw new ArrayIndexOutOfBoundsException();
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

    public synchronized boolean addAll(int index, Collection c) {
        ++this.modCount;
        if (index < 0 || index > this.elementCount) {
            throw new ArrayIndexOutOfBoundsException(index);
        }
        int numNew = c.size();
        this.ensureCapacityHelper(this.elementCount + numNew);
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

    private final class 1
    implements Enumeration {
        int count;

        public boolean hasMoreElements() {
            return this.count < Vector.this.elementCount;
        }

        public Object nextElement() {
            Vector vector = Vector.this;
            synchronized (vector) {
                if (this.count < Vector.this.elementCount) {
                    Object object = Vector.this.elementData[this.count++];
                    Object var3_3 = null;
                    return object;
                }
            }
            throw new NoSuchElementException("Vector Enumeration");
        }

        /* synthetic */ 1() {
        }
    }
}
