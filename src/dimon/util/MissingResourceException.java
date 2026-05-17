/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

public class MissingResourceException
extends RuntimeException {
    private String className;
    private String key;

    public MissingResourceException(String s, String className, String key) {
        super(s);
        this.className = className;
        this.key = key;
    }

    public String getClassName() {
        return this.className;
    }

    public String getKey() {
        return this.key;
    }
}
