/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.action.Sequence;
import is.dimon.timaflakkarinn.ActionNotFoundException;
import is.dimon.timaflakkarinn.ActionReactor;
import java.util.Hashtable;

public class ActionTake
implements ActionReactor {
    Hashtable reaction = new Hashtable();

    public void setReaction(Actor actor, Sequence sequence) {
        this.reaction.put(actor, sequence);
    }

    public void take(Actor actor) throws ActionNotFoundException {
        Sequence sequence = (Sequence)this.reaction.get(actor);
        if (sequence != null) {
            sequence.perform();
            return;
        }
        throw new ActionNotFoundException();
    }
}
