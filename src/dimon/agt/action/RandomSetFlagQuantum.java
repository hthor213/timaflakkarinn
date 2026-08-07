/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.ConditionFlag;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class RandomSetFlagQuantum
implements SuperQuantum {
    private int low = 0;
    private int high = 0;
    private ConditionFlag flag;
    private String groupName;

    public ConditionFlag getFlag() {
        return this.flag;
    }

    public void setGroupName(String string) {
        this.groupName = string;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setFlag(ConditionFlag conditionFlag) {
        this.flag = conditionFlag;
    }

    public void setLowHigh(int n, int n2) {
        this.low = n;
        this.high = n2;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void leap() {
        double d;
        if (this.flag != null) {
            d = Math.random() * (double)(this.high - this.low + 1) + (double)this.low;
            this.flag.value = new Integer((int)d);
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                d = Math.random() * (double)(this.high - this.low + 1) + (double)this.low;
                try {
                    ((ConditionFlag)iterator.next()).value = new Integer((int)d);
                }
                catch (ClassCastException classCastException) {
                    System.out.println("WARNING: RandomSetFlagQuantum got ClassCastException while trying to cast objects in group with name: " + this.groupName + " to ConditionFlag!");
                }
            }
        }
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
