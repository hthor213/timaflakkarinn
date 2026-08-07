/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.action.Sequence;
import is.dimon.timaflakkarinn.ActionDoubleReactor;
import is.dimon.timaflakkarinn.ActionNotFoundException;
import java.util.Hashtable;

public class ActionUse
implements ActionDoubleReactor {
    Hashtable reaction = new Hashtable();

    public void setReaction(Actor actor, Actor actor2, Sequence sequence) {
        Hashtable<Actor, Sequence> hashtable = (Hashtable<Actor, Sequence>)this.reaction.get(actor);
        if (hashtable == null) {
            hashtable = new Hashtable<Actor, Sequence>();
            this.reaction.put(actor, hashtable);
        }
        hashtable.put(actor2, sequence);
    }

    public void use(Actor actor, Actor actor2) throws ActionNotFoundException {
        Hashtable hashtable = (Hashtable)this.reaction.get(actor);
        Sequence sequence = null;
        if (hashtable != null) {
            sequence = (Sequence)hashtable.get(actor2);
        }
        if (sequence != null) {
            sequence.perform();
            return;
        }
        throw new ActionNotFoundException();
    }
}
