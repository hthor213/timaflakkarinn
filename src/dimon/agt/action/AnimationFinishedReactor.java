/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.AnimatedActorFace;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorFaceEvent;
import is.dimon.agt.event.ActorFaceListener;
import is.dimon.util.Iterator;

public class AnimationFinishedReactor
extends AGTEventReactor
implements ActorFaceListener {
    private AnimatedActorFace animation;

    public void kill() {
        super.kill();
        if (this.animation != null) {
            this.animation.removeActorFaceListener(this);
        }
        this.animation = null;
    }

    public void setAnimation(AnimatedActorFace animatedActorFace) {
        if (this.animation != null) {
            this.animation.removeActorFaceListener(this);
        }
        this.animation = animatedActorFace;
        this.animation.addActorFaceListener(this);
    }

    public AnimatedActorFace getAnimation() {
        return this.animation;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorAnimationFinished(ActorFaceEvent actorFaceEvent) {
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
                        ((AnimatedActorFace)iterator.next()).removeActorFaceListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("AnimationFinishedReactor got ClassCastException while getting AnimatedActorFaces from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.animation != null) {
                this.animation.removeActorFaceListener(this);
            }
            this.animation = null;
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
                    ((AnimatedActorFace)iterator.next()).removeActorFaceListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("AnimationFinishedReactor got ClassCastException while getting animated faces from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((AnimatedActorFace)iterator.next()).addActorFaceListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("AnimationFinishedReactor got ClassCastException while getting animated faces from a group name");
            }
        }
    }
}
