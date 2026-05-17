/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Enumeration;
import is.dimon.util.Iterator;

private final class Collections.5
implements Enumeration {
    Iterator i;

    public boolean hasMoreElements() {
        return this.i.hasNext();
    }

    public Object nextElement() {
        return this.i.next();
    }

    /* synthetic */ Collections.5(Collection val$c) {
        this.i = val$c.iterator();
    }
}
