/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Scene;
import is.dimon.agt.SimplePseudo3DTerrain;
import java.awt.Polygon;
import java.util.Enumeration;
import java.util.Vector;

public class SentenceContainer
extends SimplePseudo3DTerrain {
    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void hideAll() {
        int n = 0;
        Enumeration enumeration = this.getActors().elements();
        while (enumeration.hasMoreElements()) {
            try {
                ((Actor)enumeration.nextElement()).setLocation(0.0f, -3000.0f, 0.0f);
            }
            catch (InvalidPositionException invalidPositionException) {
                System.out.println("SentenceContainer got exception : " + invalidPositionException.toString());
            }
            ++n;
        }
    }

    public void showAll() {
        this.updatePositions();
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void updatePositions() {
        Vector vector = this.getActors();
        int n = 0;
        Enumeration enumeration = vector.elements();
        while (enumeration.hasMoreElements()) {
            try {
                ((Actor)enumeration.nextElement()).setLocation(this.getPosition(n));
            }
            catch (Exception exception) {
                System.out.println("SentenceContainer got exception : " + exception.toString());
            }
            ++n;
        }
    }

    private Float3DPoint getPosition(int n) {
        return new Float3DPoint(50.0f, 370 + n * 30 + 800, 800.0f);
    }

    public SentenceContainer(Scene scene, Polygon polygon, int n, int n2) {
        super(scene, polygon, n, n2);
    }
}
