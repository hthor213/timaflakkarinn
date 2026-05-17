/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.ConditionFlag;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class DecrementFlagQuantum
implements SuperQuantum {
    private ConditionFlag flag;
    private String groupName;

    public ConditionFlag getFlag() {
        return this.flag;
    }

    public void setFlag(ConditionFlag conditionFlag) {
        this.flag = conditionFlag;
    }

    public void setGroupName(String string) {
        this.groupName = string;
    }

    public String getGroupName() {
        return this.groupName;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void leap() {
        if (this.flag != null) {
            this.flag.value = new Integer(this.flag.value - 1);
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    ConditionFlag conditionFlag = (ConditionFlag)iterator.next();
                    conditionFlag.value = new Integer(conditionFlag.value - 1);
                }
                catch (ClassCastException classCastException) {
                    System.out.println("WARNING: DecrementFlagQuantum got ClassCastException while trying to cast objects in group with name: " + this.groupName + " to ConditionFlag!");
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
