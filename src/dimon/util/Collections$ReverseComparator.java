/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Comparable;
import is.dimon.util.Comparator;
import java.io.Serializable;

private static class Collections.ReverseComparator
implements Comparator,
Serializable {
    public int compare(Object o1, Object o2) {
        Comparable c1 = (Comparable)o1;
        Comparable c2 = (Comparable)o2;
        return -c1.compareTo(c2);
    }

    Collections.ReverseComparator() {
    }
}
