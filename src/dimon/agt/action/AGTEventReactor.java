/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Killable;
import is.dimon.agt.action.Sequence;

public abstract class AGTEventReactor
implements Killable {
    private static int count = 0;
    private static long coun = 0L;
    protected boolean enabled = true;
    protected String name = new String("Reactor" + ++count);
    protected int numRepititions = 1;
    protected boolean always = true;
    protected long reactionCount = 0L;
    protected Sequence seq;
    protected String groupName;

    public void kill() {
        this.seq = null;
    }

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void enable() {
        this.enabled = true;
    }

    public void disable() {
        this.enabled = false;
    }

    public void setReaction(Sequence sequence) {
        this.seq = sequence;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public Sequence getReaction() {
        return this.seq;
    }

    public void setNumRepitions(int n) {
        if (n < 1) {
            this.always = true;
        } else {
            this.numRepititions = n;
            this.reactionCount = 0L;
            this.always = false;
        }
    }

    public void setGroupName(String string) {
        this.groupName = string;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public AGTEventReactor() {
        ++coun;
    }
}
