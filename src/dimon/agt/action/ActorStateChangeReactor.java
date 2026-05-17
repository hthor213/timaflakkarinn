/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorStateChangeEvent;
import is.dimon.agt.event.ActorStateChangeListener;
import is.dimon.util.Iterator;

public class ActorStateChangeReactor
extends AGTEventReactor
implements ActorStateChangeListener {
    private Actor actor;
    private String state;

    public void setActor(Actor actor) {
        if (this.actor != null) {
            this.actor.removeActorStateChangeListener(this);
        }
        this.actor = actor;
        this.actor.addActorStateChangeListener(this);
    }

    public void setState(String string) {
        this.state = string;
    }

    public String getState() {
        return this.state;
    }

    public Actor getActor() {
        return this.actor;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorChangesState(ActorStateChangeEvent actorStateChangeEvent) {
        if (!this.enabled) {
            return;
        }
        if (this.state != null && !actorStateChangeEvent.getState().equals(this.state)) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((Actor)iterator.next()).removeActorStateChangeListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("ActorStateChangeReactor got ClassCastException while getting actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.actor != null) {
                this.actor.removeActorStateChangeListener(this);
            }
            this.actor = null;
            this.state = null;
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
                    ((Actor)iterator.next()).removeActorStateChangeListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("ActorStateChangeReactor got ClassCastException while getting actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((Actor)iterator.next()).addActorStateChangeListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("ActorStateChangeReactor got ClassCastException while getting actors from a group name");
            }
        }
    }
}
