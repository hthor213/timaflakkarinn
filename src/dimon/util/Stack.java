/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.EmptyStackException;
import is.dimon.util.Vector;

public class Stack
extends Vector {
    private static final long serialVersionUID = 1224463164541339165L;

    public Object push(Object item) {
        this.addElement(item);
        return item;
    }

    public synchronized Object pop() {
        int len = this.size();
        Object obj = this.peek();
        this.removeElementAt(len - 1);
        return obj;
    }

    public synchronized Object peek() {
        int len = this.size();
        if (len == 0) {
            throw new EmptyStackException();
        }
        return this.elementAt(len - 1);
    }

    public boolean empty() {
        return this.size() == 0;
    }

    public synchronized int search(Object o) {
        int i = this.lastIndexOf(o);
        if (i >= 0) {
            return this.size() - i;
        }
        return -1;
    }
}
