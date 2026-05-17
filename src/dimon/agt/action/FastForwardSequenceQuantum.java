/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Killable;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.Sequence;
import is.dimon.agt.action.SuperQuantum;

public class FastForwardSequenceQuantum
implements SuperQuantum,
Killable {
    private String groupName;
    private boolean fastForwardIfIdle = false;
    private Sequence sequence;
    private boolean wait = false;

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

    public void setFastForwardIfIdle(boolean bl) {
        this.fastForwardIfIdle = bl;
    }

    public void setWait(boolean bl) {
        this.wait = bl;
    }

    public boolean getWait() {
        return this.wait;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        block12: {
            block11: {
                if (!this.wait) break block11;
                var1_1 = 0;
                var2_3 = 0;
                if (this.sequence != null) {
                    this.sequence.fastForward(this.fastForwardIfIdle, Thread.currentThread());
                    ++var2_3;
                }
                if (this.groupName == null) break block12;
                var3_6 = Groups.iterator(this.groupName);
                if (true) ** GOTO lbl25
            }
            if (this.sequence != null) {
                this.sequence.fastForward(this.fastForwardIfIdle);
            }
            if (this.groupName == null) return;
            var1_2 = Groups.iterator(this.groupName);
            if (true) ** GOTO lbl44
            do {
                try {
                    var4_8 = (Sequence)var3_6.next();
                    var4_8.fastForward(this.fastForwardIfIdle, Thread.currentThread());
                    ++var2_3;
                }
                catch (ClassCastException var4_9) {
                    System.out.println("WARNING: FastForwardSequenceQuantum got ClassCastException when trying to get Sequence from group with name: " + this.groupName + " !");
                }
lbl25:
                // 3 sources

            } while (var3_6.hasNext());
        }
        while (var1_1 < var2_3) {
            try {
                this.wait();
            }
            catch (InterruptedException var3_7) {
                ++var1_1;
            }
        }
        return;
        do {
            try {
                var2_4 = (Sequence)var1_2.next();
                var2_4.fastForward(this.fastForwardIfIdle);
            }
            catch (ClassCastException var2_5) {
                System.err.println("WARNING: FastForwardSequenceQuantum got ClassCastException when trying to get Sequence from group with name: " + this.groupName + " !");
            }
lbl44:
            // 3 sources

        } while (var1_2.hasNext());
    }

    public void tunnel() {
        this.leap();
    }

    public synchronized void finish() {
    }

    public void kill() {
        this.sequence = null;
    }
}
