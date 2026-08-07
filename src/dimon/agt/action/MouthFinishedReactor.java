/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.ActorMouth;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorMouthEvent;
import is.dimon.agt.event.ActorMouthListener;
import is.dimon.util.Iterator;

public class MouthFinishedReactor
extends AGTEventReactor
implements ActorMouthListener {
    private ActorMouth mouth;

    public void kill() {
        super.kill();
        if (this.mouth != null) {
            this.mouth.removeActorMouthListener(this);
        }
        this.mouth = null;
    }

    public void setMouth(ActorMouth actorMouth) {
        if (this.mouth != null) {
            this.mouth.removeActorMouthListener(this);
        }
        this.mouth = actorMouth;
        this.mouth.addActorMouthListener(this);
    }

    public ActorMouth getMouth() {
        return this.mouth;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorMouthFinished(ActorMouthEvent actorMouthEvent) {
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
                        ((ActorMouth)iterator.next()).removeActorMouthListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("MouthFinishedReactor got ClassCastException while getting ActorMouths from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.mouth != null) {
                this.mouth.removeActorMouthListener(this);
            }
            this.mouth = null;
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
                    ((ActorMouth)iterator.next()).removeActorMouthListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("MouthFinishedReactor got ClassCastException while getting ActorMouths from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((ActorMouth)iterator.next()).addActorMouthListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("MouthFinishedReactor got ClassCastException while getting ActorMouths from a group name");
            }
        }
    }
}
