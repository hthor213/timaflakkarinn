/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.action.Sequence;
import is.dimon.agt.event.ActorCollisionEvent;
import is.dimon.agt.event.ActorCollisionListener;
import is.dimon.timaflakkarinn.ActionReactor;
import java.util.Hashtable;

public class ActionCollision
implements ActionReactor,
ActorCollisionListener {
    Hashtable reaction = new Hashtable();

    public void setReaction(Actor actor, Sequence sequence) {
        this.reaction.put(actor, sequence);
    }

    public void actorCollides(ActorCollisionEvent actorCollisionEvent) {
        if (this.reaction.get(actorCollisionEvent.getCollider()) != null) {
            ((Sequence)this.reaction.get(actorCollisionEvent.getCollider())).perform();
        }
    }
}
