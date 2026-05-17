/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorCollisionEvent;
import is.dimon.agt.event.ActorCollisionListener;
import is.dimon.util.Iterator;

public class ActorCollisionReactor
extends AGTEventReactor
implements ActorCollisionListener {
    private Actor actor;
    private Actor collider;

    public void setCollider(Actor actor) {
        this.collider = actor;
    }

    public Actor getCollider() {
        return this.collider;
    }

    public void setActor(Actor actor) {
        if (this.actor != null) {
            this.actor.removeActorCollisionListener(this);
        }
        this.actor = actor;
        this.actor.addActorCollisionListener(this);
    }

    public Actor getActor() {
        return this.actor;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorCollides(ActorCollisionEvent actorCollisionEvent) {
        if (actorCollisionEvent.getCollider() != this.collider || !this.enabled) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((Actor)iterator.next()).removeActorCollisionListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("ActorCollisionReactor got ClassCastException while getting actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.actor != null) {
                this.actor.removeActorCollisionListener(this);
            }
            this.actor = null;
            this.collider = null;
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
                    ((Actor)iterator.next()).removeActorCollisionListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("ActorCollisionReactor got ClassCastException while getting actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((Actor)iterator.next()).addActorCollisionListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("ActorCollisionReactor got ClassCastException while getting actors from a group name");
            }
        }
    }
}
