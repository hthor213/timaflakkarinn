/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Terrain;
import is.dimon.agt.action.Quantum;

public class MoveActorQuantum
implements Quantum {
    private Actor actor;
    private Terrain terrain;
    private Float3DPoint location;

    public Terrain getTerrain() {
        return this.terrain;
    }

    public void setTerrain(Terrain terrain) {
        this.terrain = terrain;
    }

    public Actor getActor() {
        return this.actor;
    }

    public void setActor(Actor actor) {
        this.actor = actor;
    }

    public Float3DPoint getLocation() {
        return this.location;
    }

    public void setLocation(Float3DPoint float3DPoint) {
        this.location = float3DPoint;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void leap() {
        if (this.actor.getTerrain() != this.terrain) {
            this.actor.setTerrain(null);
        }
        try {
            this.actor.setLocation(this.location);
        }
        catch (InvalidPositionException invalidPositionException) {
            System.out.println("WARNING MoveActorQuantum got InvalidPositionException while trying to move the actor: " + this.actor.toString() + " to the location: (" + this.location.x + ", " + this.location.y + ", " + this.location.z + ")!");
        }
        catch (NullPointerException nullPointerException) {
            try {
                this.actor.setLocation(this.actor.getLocation());
            }
            catch (InvalidPositionException invalidPositionException) {
            }
        }
        if (this.terrain != null && this.actor.getTerrain() != this.terrain) {
            this.actor.setTerrain(this.terrain);
        }
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
