/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.Groups;
import is.dimon.agt.action.Sequence;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class FreezeSequenceQuantum
implements SuperQuantum {
    private String groupName;
    private boolean freeze = true;
    private Sequence sequence;

    public void setSequence(Sequence sequence) {
        this.sequence = sequence;
    }

    public Sequence getSequence() {
        return this.sequence;
    }

    public void setGroupName(String string) {
        this.groupName = string;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setFreeze(boolean bl) {
        this.freeze = bl;
    }

    public boolean getFreeze() {
        return this.freeze;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        if (this.sequence == null || this.freeze) {
            // empty if block
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    Sequence sequence = (Sequence)iterator.next();
                    if (this.freeze) continue;
                }
                catch (ClassCastException classCastException) {
                    System.err.println("WARNING: FreezeSequenceQuantum got ClassCastException when trying to get Sequence from group with name: " + this.groupName + " !");
                }
            }
        }
    }

    public void tunnel() {
        this.leap();
    }

    public synchronized void finish() {
    }
}
