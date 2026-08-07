/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.action.Sequence;
import is.dimon.timaflakkarinn.ActionNotFoundException;
import is.dimon.timaflakkarinn.ActionReactor;
import is.dimon.timaflakkarinn.StateController;
import java.util.Hashtable;

public class ActionTalk
implements ActionReactor {
    StateController stateController;
    Hashtable reaction = new Hashtable();

    public void setStateController(StateController stateController) {
        this.stateController = stateController;
    }

    public void setReaction(Actor actor, Sequence sequence) {
        this.reaction.put(actor, sequence);
    }

    public Sequence getReaction(Actor actor) {
        return (Sequence)this.reaction.get(actor);
    }

    public void talk(Actor actor) throws ActionNotFoundException {
        Sequence sequence = (Sequence)this.reaction.get(actor);
        if (sequence != null) {
            sequence.perform();
            return;
        }
        throw new ActionNotFoundException();
    }
}
