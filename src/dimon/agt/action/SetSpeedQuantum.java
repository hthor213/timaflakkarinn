/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.MovingActor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class SetSpeedQuantum
implements SuperQuantum {
    private float speed = 75.0f;
    private MovingActor actor;
    private String groupName;

    public MovingActor getActor() {
        return this.actor;
    }

    public void setActor(MovingActor movingActor) {
        this.actor = movingActor;
    }

    public void setSpeed(float f) {
        if (f < 0.0f) {
            return;
        }
        this.speed = f;
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
            this.actor.setSpeed(this.speed);
        }
        if (this.groupName != null) {
            Iterator iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    ((MovingActor)iterator.next()).setSpeed(this.speed);
                }
                catch (ClassCastException classCastException) {
                    System.out.println("WARNING: SetSpeedQuantum got ClassCastException while trying to cast object in group with name: " + this.groupName + " into MovingActor!");
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
