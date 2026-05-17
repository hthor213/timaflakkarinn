/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.Scene;
import is.dimon.agt.SimplePseudo3DTerrain;
import java.awt.Polygon;
import java.util.Enumeration;
import java.util.Vector;

public class Inventory
extends SimplePseudo3DTerrain {
    private Float3DPoint getPosition(int n) {
        return new Float3DPoint(55 * (n % 5) + 220, 55 * (n / 5) + 190, 10.0f);
    }

    public void addActor(Actor actor) {
        super.addActor(actor);
    }

    public void removeActor(Actor actor) {
        super.removeActor(actor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void updatePositions() {
        Vector vector = this.getActors();
        int n = 0;
        Actor actor = null;
        Enumeration enumeration = vector.elements();
        while (enumeration.hasMoreElements()) {
            try {
                actor = (Actor)enumeration.nextElement();
                actor.setLocation(this.getPosition(n));
            }
            catch (Exception exception) {
                System.out.println("Illegal position in inventory item: " + actor.getName());
            }
            ++n;
        }
    }

    public Inventory(Scene scene, Polygon polygon, int n, int n2) {
        super(scene, polygon, n, n2);
    }
}
