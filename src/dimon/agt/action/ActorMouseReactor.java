/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.util.Iterator;

public class ActorMouseReactor
extends AGTEventReactor
implements ActorMouseListener {
    public static final int CLICKED = 500;
    public static final int ENTERED = 504;
    public static final int EXITED = 505;
    private Actor actor;
    private int event = 500;
    private boolean[] clickMask = new boolean[3];

    public void kill() {
        super.kill();
        if (this.actor != null) {
            this.actor.removeActorMouseListener(this);
        }
        this.actor = null;
    }

    public void setActor(Actor actor) {
        if (this.actor != null) {
            this.actor.removeActorMouseListener(this);
        }
        this.actor = actor;
        this.actor.addActorMouseListener(this);
    }

    public Actor getActor() {
        return this.actor;
    }

    public void setEvent(int n) {
        this.event = n;
    }

    public void setClickMask(boolean bl, boolean bl2, boolean bl3) {
        this.clickMask[0] = bl;
        this.clickMask[1] = bl2;
        this.clickMask[2] = bl3;
    }

    public boolean[] getClickMask() {
        return this.clickMask;
    }

    public int getEvent() {
        return this.event;
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
                    ((Actor)iterator.next()).removeActorMouseListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("ActorMouseReactor got ClassCastException while getting actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((Actor)iterator.next()).addActorMouseListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("ActorMouseReactor got ClassCastException while getting actors from a group name");
            }
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void advanceReaction() {
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((Actor)iterator.next()).removeActorMouseListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("ActorMouseReactor got ClassCastException while getting actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.actor != null) {
                this.actor.removeActorMouseListener(this);
            }
            this.actor = null;
        }
    }

    public void actorClicked(AGTMouseEvent aGTMouseEvent) {
        if (!this.enabled || this.event != 500) {
            return;
        }
        if (!this.clickMask[aGTMouseEvent.getButton()]) {
            return;
        }
        this.seq.perform();
        this.advanceReaction();
    }

    public void actorEntered(AGTMouseEvent aGTMouseEvent) {
        if (!this.enabled || this.event != 504) {
            return;
        }
        this.seq.perform();
        this.advanceReaction();
    }

    public void actorExited(AGTMouseEvent aGTMouseEvent) {
        if (!this.enabled || this.event != 505) {
            return;
        }
        this.seq.perform();
        this.advanceReaction();
    }

    public ActorMouseReactor() {
        this.clickMask[0] = true;
        this.clickMask[1] = false;
        this.clickMask[2] = true;
    }
}
