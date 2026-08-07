/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.Collection;
import is.dimon.util.Set;

public interface Map {
    public int size();

    public boolean isEmpty();

    public boolean containsKey(Object var1);

    public boolean containsValue(Object var1);

    public Object get(Object var1);

    public Object put(Object var1, Object var2);

    public Object remove(Object var1);

    public void putAll(Map var1);

    public void clear();

    public Set keySet();

    public Collection values();

    public Set entries();

    public boolean equals(Object var1);

    public int hashCode();

    public static interface Entry {
        public Object getKey();

        public Object getValue();

        public Object setValue(Object var1);

        public boolean equals(Object var1);

        public int hashCode();
    }
}
