/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.util.Enumeration;
import is.dimon.util.HashSet;
import is.dimon.util.Hashtable;
import is.dimon.util.Iterator;
import java.util.Vector;

public class Groups {
    private static Hashtable hashSets = new Hashtable();

    public static boolean add(String string, Object object) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        if (hashSet != null) {
            return hashSet.add(object);
        }
        hashSet = new HashSet();
        hashSets.put(string, hashSet);
        return hashSet.add(object);
    }

    public static boolean contains(String string, Object object) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        if (hashSet != null) {
            return hashSet.contains(object);
        }
        return false;
    }

    public static boolean remove(String string, Object object) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        return hashSet != null ? hashSet.remove(object) : false;
    }

    public static boolean clear(String string) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        if (hashSet != null) {
            hashSet.clear();
            hashSets.remove(string);
            return true;
        }
        return false;
    }

    public static void clearAll() {
        hashSets.clear();
    }

    public static int count(String string) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        return hashSet != null ? hashSet.size() : 0;
    }

    public static Iterator iterator(String string) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        return hashSet != null ? hashSet.iterator() : null;
    }

    public static boolean exists(String string) {
        HashSet hashSet = (HashSet)hashSets.get(string);
        return hashSet != null;
    }

    public static Vector getHashCodes(Object object) {
        Vector<Object> vector = new Vector<Object>(5, 10);
        Enumeration enumeration = hashSets.keys();
        while (enumeration.hasMoreElements()) {
            Object object2 = enumeration.nextElement();
            if (!Groups.getHashSet((String)object2).contains(object)) continue;
            vector.addElement(object2);
        }
        return vector;
    }

    public static HashSet getHashSet(String string) {
        return (HashSet)hashSets.get(string);
    }
}
