/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Enumeration;

public abstract class Dictionary {
    public abstract int size();

    public abstract boolean isEmpty();

    public abstract Enumeration keys();

    public abstract Enumeration elements();

    public abstract Object get(Object var1);

    public abstract Object put(Object var1, Object var2);

    public abstract Object remove(Object var1);
}
