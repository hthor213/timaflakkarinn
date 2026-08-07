/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractCollection;
import is.dimon.util.AbstractMap;
import is.dimon.util.AbstractSet;
import is.dimon.util.Collection;
import is.dimon.util.Iterator;
import is.dimon.util.Map;
import is.dimon.util.Set;
import is.dimon.util.UnsupportedOperationException;

public abstract class AbstractMap
implements Map {
    private transient Set keySet;
    private transient Collection values;

    public int size() {
        return this.entries().size();
    }

    public boolean isEmpty() {
        return this.size() == 0;
    }

    /*
     * Unable to fully structure code
     */
    public boolean containsValue(Object value) {
        block2: {
            i = this.entries().iterator();
            if (value != null) ** GOTO lbl11
            while (i.hasNext()) {
                e = (Map.Entry)i.next();
                if (e.getValue() != null) continue;
                return true;
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                e = (Map.Entry)i.next();
                if (!value.equals(e.getValue())) continue;
                return true;
lbl11:
                // 2 sources

                ** while (i.hasNext())
            }
        }
        return false;
    }

    /*
     * Unable to fully structure code
     */
    public boolean containsKey(Object key) {
        block2: {
            i = this.entries().iterator();
            if (key != null) ** GOTO lbl11
            while (i.hasNext()) {
                e = (Map.Entry)i.next();
                if (e.getKey() != null) continue;
                return true;
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                e = (Map.Entry)i.next();
                if (!key.equals(e.getKey())) continue;
                return true;
lbl11:
                // 2 sources

                ** while (i.hasNext())
            }
        }
        return false;
    }

    /*
     * Unable to fully structure code
     */
    public Object get(Object key) {
        block2: {
            i = this.entries().iterator();
            if (key != null) ** GOTO lbl11
            while (i.hasNext()) {
                e = (Map.Entry)i.next();
                if (e.getKey() != null) continue;
                return e.getValue();
            }
            break block2;
lbl-1000:
            // 1 sources

            {
                e = (Map.Entry)i.next();
                if (!key.equals(e.getKey())) continue;
                return e.getValue();
lbl11:
                // 2 sources

                ** while (i.hasNext())
            }
        }
        return null;
    }

    public Object put(Object key, Object value) {
        throw new UnsupportedOperationException();
    }

    /*
     * Unable to fully structure code
     */
    public Object remove(Object key) {
        block3: {
            i = this.entries().iterator();
            correctEntry = null;
            if (key != null) ** GOTO lbl13
            while (correctEntry == null && i.hasNext()) {
                e = (Map.Entry)i.next();
                if (e.getKey() != null) continue;
                correctEntry = e;
            }
            break block3;
lbl-1000:
            // 1 sources

            {
                e = (Map.Entry)i.next();
                if (!key.equals(e.getKey())) continue;
                correctEntry = e;
lbl13:
                // 3 sources

                ** while (correctEntry == null && i.hasNext())
            }
        }
        oldValue = null;
        if (correctEntry != null) {
            oldValue = correctEntry.getValue();
            i.remove();
        }
        return oldValue;
    }

    public void putAll(Map t) {
        Iterator i = t.entries().iterator();
        while (i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            this.put(e.getKey(), e.getValue());
        }
    }

    public void clear() {
        this.entries().clear();
    }

    public Set keySet() {
        if (this.keySet == null) {
            this.keySet = new 1();
        }
        return this.keySet;
    }

    public Collection values() {
        if (this.values == null) {
            this.values = new 3();
        }
        return this.values;
    }

    public abstract Set entries();

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Map)) {
            return false;
        }
        Map t = (Map)o;
        if (t.size() != this.size()) {
            return false;
        }
        Iterator i = this.entries().iterator();
        while (i.hasNext()) {
            Map.Entry e = (Map.Entry)i.next();
            Object key = e.getKey();
            Object value = e.getValue();
            if (!(value == null ? t.get(key) != null || !t.containsKey(key) : !value.equals(t.get(key)))) continue;
            return false;
        }
        return true;
    }

    public int hashCode() {
        int h = 0;
        Iterator i = this.entries().iterator();
        while (i.hasNext()) {
            h += i.next().hashCode();
        }
        return h;
    }

    public String toString() {
        int max = this.size() - 1;
        StringBuffer buf = new StringBuffer();
        Iterator i = this.entries().iterator();
        buf.append("{");
        int j = 0;
        while (j <= max) {
            Map.Entry e = (Map.Entry)i.next();
            buf.append(String.valueOf(e.getKey()) + "=" + e.getValue());
            if (j < max) {
                buf.append(", ");
            }
            ++j;
        }
        buf.append("}");
        return buf.toString();
    }

    private final class 1
    extends AbstractSet {
        public Iterator iterator() {
            return new 2(AbstractMap.this);
        }

        public int size() {
            return AbstractMap.this.size();
        }

        /* synthetic */ 1() {
        }
    }

    private final class 3
    extends AbstractCollection {
        public Iterator iterator() {
            return new 4(AbstractMap.this);
        }

        public int size() {
            return AbstractMap.this.size();
        }

        /* synthetic */ 3() {
        }
    }
}
