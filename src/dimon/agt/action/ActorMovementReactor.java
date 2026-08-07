/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorMovementEvent;
import is.dimon.agt.event.ActorMovementListener;
import is.dimon.util.Iterator;

public class ActorMovementReactor
extends AGTEventReactor
implements ActorMovementListener {
    private boolean condition = false;
    private float xMax;
    private float xMin;
    private float yMax;
    private float yMin;
    private float zMin;
    private float zMax;
    private Actor actor;

    public void setActor(Actor actor) {
        if (this.actor != null) {
            this.actor.removeActorMovementListener(this);
        }
        this.actor = actor;
        this.actor.addActorMovementListener(this);
    }

    public void kill() {
        super.kill();
        if (this.actor != null) {
            this.actor.removeActorMovementListener(this);
        }
        this.actor = null;
    }

    public void setCondition(float f, float f2, float f3, float f4, float f5, float f6) {
        this.condition = true;
        this.xMin = f;
        this.yMin = f3;
        this.zMin = f5;
        this.xMax = f2;
        this.yMax = f4;
        this.zMax = f6;
    }

    public void removeCondition() {
        this.condition = false;
    }

    public Actor getActor() {
        return this.actor;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorMoves(ActorMovementEvent actorMovementEvent) {
        if (!this.enabled) {
            return;
        }
        if (this.condition && (actorMovementEvent.getLocation().x > this.xMax || actorMovementEvent.getLocation().x < this.xMin || actorMovementEvent.getLocation().y > this.yMax || actorMovementEvent.getLocation().y < this.yMin || actorMovementEvent.getLocation().z > this.zMax || actorMovementEvent.getLocation().z < this.zMin)) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((Actor)iterator.next()).removeActorMovementListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("ActorMovementReactor got ClassCastException while getting actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.actor != null) {
                this.actor.removeActorMovementListener(this);
            }
            this.actor = null;
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
                    ((Actor)iterator.next()).removeActorMovementListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("ActorMovementReactor got ClassCastException while getting actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((Actor)iterator.next()).addActorMovementListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("ActorMovementReactor got ClassCastException while getting actors from a group name");
            }
        }
    }
}
