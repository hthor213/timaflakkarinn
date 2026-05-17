/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Enumeration;
import is.dimon.util.NoSuchElementException;
import is.dimon.util.Vector;

private final class Vector.1
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

    /* synthetic */ Vector.1() {
    }
}
