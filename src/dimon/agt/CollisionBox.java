/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.Float3DPoint;

public abstract class CollisionBox {
    protected float scaleFactor = 1.0f;
    Actor myOwner;

    public Actor getOwner() {
        return this.myOwner;
    }

    public void setOwner(Actor actor) {
        this.myOwner = actor;
    }

    public abstract boolean validLocation(Float3DPoint var1);

    public abstract boolean checkCollision(Float3DPoint var1, Actor var2);

    public abstract boolean validLocation(float var1, float var2, float var3);

    public abstract boolean checkCollision(float var1, float var2, float var3, Actor var4);

    public void setScalingFactor(float f) {
        this.scaleFactor = f;
    }

    public float getScalingFactor() {
        return this.scaleFactor;
    }
}
