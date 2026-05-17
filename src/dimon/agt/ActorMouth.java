/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Preparable;
import is.dimon.agt.event.ActorMouthListener;

public interface ActorMouth
extends Preparable {
    public void start();

    public void stop();

    public void setVolume(float var1);

    public float getVolume();

    public boolean isFinished();

    public void addActorMouthListener(ActorMouthListener var1);

    public void removeActorMouthListener(ActorMouthListener var1);
}
