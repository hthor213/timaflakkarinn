/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractMap;
import is.dimon.util.AbstractSet;
import is.dimon.util.Iterator;

private final class AbstractMap.1
extends AbstractSet {
    public Iterator iterator() {
        return new AbstractMap.2(AbstractMap.this);
    }

    public int size() {
        return AbstractMap.this.size();
    }

    /* synthetic */ AbstractMap.1() {
    }
}
