/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Pulsable;

public interface ActorVelocity
extends Pulsable {
    public int getInterval();

    public void setInterval(int var1);

    public boolean destinationReached();

    public void setDestination(int var1, int var2);

    public float getSpeed();

    public void setSpeed(float var1);
}
