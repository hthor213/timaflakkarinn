/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.Terrain;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.ActorTerrainChangeEvent;
import is.dimon.agt.event.ActorTerrainChangeListener;
import is.dimon.util.Iterator;

public class ActorTerrainChangeReactor
extends AGTEventReactor
implements ActorTerrainChangeListener {
    private Terrain terrain;
    private Actor actor;

    public void setActor(Actor actor) {
        this.actor = actor;
    }

    public Actor getActor() {
        return this.actor;
    }

    public void setTerrain(Terrain terrain) {
        this.terrain = terrain;
    }

    public Terrain getTerrain() {
        return this.terrain;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorChangesTerrain(ActorTerrainChangeEvent actorTerrainChangeEvent) {
        if (!this.enabled) {
            return;
        }
        if (this.terrain != null && actorTerrainChangeEvent.getTerrain() != this.terrain) {
            return;
        }
        this.seq.perform();
        ++this.reactionCount;
        if (!this.always && this.reactionCount == (long)this.numRepititions) {
            if (this.groupName != null) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    try {
                        ((Actor)iterator.next()).removeActorTerrainChangeListener(this);
                    }
                    catch (ClassCastException classCastException) {
                        System.err.println("ActorTerrainChangeReactor got ClassCastException while getting actors from a group name");
                    }
                }
            }
            this.groupName = null;
            if (this.actor != null) {
                this.actor.removeActorTerrainChangeListener(this);
            }
            this.actor = null;
            this.terrain = null;
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
                    ((Actor)iterator.next()).removeActorTerrainChangeListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("ActorTerrainChangeReactor got ClassCastException while getting actors from a group name");
                }
            }
        }
        this.groupName = string;
        iterator = Groups.iterator(string);
        while (iterator.hasNext()) {
            try {
                ((Actor)iterator.next()).addActorTerrainChangeListener(this);
            }
            catch (ClassCastException classCastException) {
                System.err.println("ActorTerrainChangeReactor got ClassCastException while getting actors from a group name");
            }
        }
    }
}
