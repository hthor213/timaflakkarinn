/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.AbstractMap;
import is.dimon.util.Iterator;

private final class AbstractMap.3
extends AbstractCollection {
    public Iterator iterator() {
        return new AbstractMap.4(AbstractMap.this);
    }

    public int size() {
        return AbstractMap.this.size();
    }

    /* synthetic */ AbstractMap.3() {
    }
}
