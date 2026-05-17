/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Killable;
import is.dimon.agt.action.ConditionFlag;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.action.Sequence;
import java.util.Hashtable;

public class CheckConditionQuantum
implements Quantum,
Killable {
    private boolean wait = false;
    private ConditionFlag flag;
    private Hashtable reaction = new Hashtable();

    public void setReaction(Integer n, Sequence sequence) {
        this.reaction.put(n, sequence);
    }

    public ConditionFlag getFlag() {
        return this.flag;
    }

    public void setFlag(ConditionFlag conditionFlag) {
        this.flag = conditionFlag;
    }

    public boolean getWait() {
        return this.wait;
    }

    public void setWait(boolean bl) {
        this.wait = bl;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        if (this.reaction.get(this.flag.value) == null) return;
        if (!this.wait) {
            ((Sequence)this.reaction.get(this.flag.value)).perform();
            return;
        }
        ((Sequence)this.reaction.get(this.flag.value)).perform(Thread.currentThread());
        try {
            this.wait();
            return;
        }
        catch (InterruptedException interruptedException) {
            return;
        }
    }

    public synchronized void tunnel() {
        this.leap();
    }

    public void finish() {
    }

    public void kill() {
        this.flag = null;
        this.reaction.clear();
        this.reaction = null;
    }
}
