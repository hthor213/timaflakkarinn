/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.MovingActor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class StopActorQuantum
implements SuperQuantum {
    private MovingActor actor;
    private String groupName;

    public MovingActor getActor() {
        return this.actor;
    }

    public void setActor(MovingActor movingActor) {
        this.actor = movingActor;
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
        if (this.actor != null) {
            this.actor.stopActor();
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    ((MovingActor)iterator.next()).stopActor();
                }
                catch (ClassCastException classCastException) {
                    System.out.println("WARNING: StopActorQuantum got ClassCastException while trying to cast objects in group with name: " + this.groupName + " to MovingActor");
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
