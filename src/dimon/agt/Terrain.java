/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.Killable;
import is.dimon.agt.Scene;
import java.awt.Point;
import java.util.Enumeration;
import java.util.Vector;

public abstract class Terrain
implements Killable {
    static int count = 0;
    static long coun = 0L;
    protected Scene myScene;
    private Vector actors;
    private Vector bannedActors;
    protected float defaultScaling;
    protected String name;

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void kill() {
        this.myScene = null;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public void setDefaultScaling(float f) {
        this.defaultScaling = f;
    }

    public float getDefaultScaling() {
        return this.defaultScaling;
    }

    public Scene getScene() {
        return this.myScene;
    }

    public void setScene(Scene scene) {
        if (this.myScene != null && this.myScene != scene) {
            this.myScene.removeTerrain(this);
            this.myScene = scene;
            if (this.myScene != null) {
                this.myScene.addTerrain(this);
            }
        }
    }

    public abstract boolean contains(Float3DPoint var1);

    public abstract Point getPhysicalCoords(Float3DPoint var1);

    public abstract int getPhysicalXCoord(Float3DPoint var1);

    public abstract int getPhysicalYCoord(Float3DPoint var1);

    public abstract float getScaling(Float3DPoint var1);

    public boolean isAllowed(Actor actor) {
        return this.bannedActors == null || !this.bannedActors.contains(actor);
    }

    public void addBannedActor(Actor actor) {
        if (this.bannedActors == null) {
            this.bannedActors = new Vector(5, 5);
        }
        this.bannedActors.addElement(actor);
    }

    public void removeBannedActor(Actor actor) {
        if (this.bannedActors != null && this.bannedActors.contains(actor)) {
            this.bannedActors.removeElement(actor);
        }
    }

    public synchronized void addActor(Actor actor) {
        if (!this.actors.contains(actor)) {
            this.actors.addElement(actor);
            if (this.myScene.getWorld().getCurrentScene() == this.myScene) {
                actor.onStage();
            }
        }
    }

    public Vector getActors() {
        return this.actors;
    }

    public synchronized void removeActor(Actor actor) {
        boolean bl = this.actors.removeElement(actor);
        if (this.myScene.getWorld().getCurrentScene() == this.myScene) {
            actor.offStage();
        }
    }

    public void onStage() {
        Enumeration enumeration = this.actors.elements();
        while (enumeration.hasMoreElements()) {
            ((Actor)enumeration.nextElement()).onStage();
        }
    }

    public void offStage() {
        Enumeration enumeration = this.actors.elements();
        while (enumeration.hasMoreElements()) {
            ((Actor)enumeration.nextElement()).offStage();
        }
    }

    public Terrain(Scene scene) {
        this.myScene = scene;
        this.actors = new Vector();
        this.myScene.addTerrain(this);
        this.defaultScaling = 1.0f;
        this.name = "Terrain" + ++count;
        ++coun;
    }
}
