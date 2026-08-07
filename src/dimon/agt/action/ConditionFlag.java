/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

public class ConditionFlag {
    private static int count = 0;
    private static long coun = 0L;
    public Integer value;
    private String name = "Flag" + ++count;

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public ConditionFlag() {
        ++coun;
    }
}
