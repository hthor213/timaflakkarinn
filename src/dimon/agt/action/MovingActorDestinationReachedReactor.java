/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.MovingActor;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.MovingActorDestinationReachedEvent;
import is.dimon.agt.event.MovingActorDestinationReachedListener;
import is.dimon.util.Iterator;

public class MovingActorDestinationReachedReactor
extends AGTEventReactor
implements MovingActorDestinationReachedListener {
    private MovingActor movingActor;

    public void setMovingActor(MovingActor movingActor) {
        if (this.movingActor != null) {
            this.movingActor.removeMovingActorDestinationReachedListener(this);
        }
        this.movingActor = movingActor;
        this.movingActor.addMovingActorDestinationReachedListener(this);
    }

    public void kill() {
        super.kill();
        if (this.movingActor != null) {
            this.movingActor.removeMovingActorDestinationReachedListener(this);
        }
        this.movingActor = null;
    }

    public MovingActor getMovingActor() {
        return this.movingActor;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void movingActorDestinationReached(MovingActorDestinationReachedEvent movingActorDestinationReachedEvent) {
        if (!this.enabled) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((MovingActor)iterator.next()).removeMovingActorDestinationReachedListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("MovingActorDestinationReachedReactor got ClassCastException while getting moving actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.movingActor != null) {
                this.movingActor.removeMovingActorDestinationReachedListener(this);
            }
            this.movingActor = null;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void setGroupName(String string) {
        Iterator iterator;
        if (this.groupName != null) {
            iterator = Groups.iterator(this.groupName);
            while (iterator.hasNext()) {
                try {
                    ((MovingActor)iterator.next()).removeMovingActorDestinationReachedListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("MovingActorDestinationReachedReactor got ClassCastException while getting moving actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((MovingActor)iterator.next()).addMovingActorDestinationReachedListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("MovingActorDestinationReachedReactor got ClassCastException while getting moving actors from a group name");
            }
        }
    }
}
