/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Preparable;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class PrepareQuantum
implements SuperQuantum {
    private boolean prepare = true;
    private String groupName;
    private Preparable preparee;

    public void setPrepare(boolean bl) {
        this.prepare = bl;
    }

    public void setPreparable(Preparable preparable) {
        this.preparee = preparable;
    }

    public Preparable getPreparable() {
        return this.preparee;
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
        if (this.preparee != null) {
            if (this.prepare) {
                this.preparee.prepare();
            } else {
                this.preparee.unprepare();
            }
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    Preparable preparable = (Preparable)iterator.next();
                    if (this.prepare) {
                        preparable.prepare();
                        continue;
                    }
                    preparable.unprepare();
                }
                catch (ClassCastException classCastException) {
                    System.out.println("WARNING! PrepareQuantum got ClassCastException while trying to cast objects from group with name: " + this.groupName + " into Preparable!");
                }
            }
        }
    }

    public void tunnel() {
        if (!this.prepare) {
            this.leap();
        }
    }

    public void finish() {
    }
}
