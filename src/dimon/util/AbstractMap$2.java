/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractMap;
import is.dimon.util.Iterator;
import is.dimon.util.Map;

private final class AbstractMap.2
implements Iterator {
    private Iterator i;

    public boolean hasNext() {
        return this.i.hasNext();
    }

    public Object next() {
        return ((Map.Entry)this.i.next()).getKey();
    }

    public void remove() {
        this.i.remove();
    }

    /* synthetic */ AbstractMap.2(AbstractMap this$0) {
        this.i = this$0.entries().iterator();
    }
}
