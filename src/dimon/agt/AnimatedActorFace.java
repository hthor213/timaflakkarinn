/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.event.ActorFaceListener;

public interface AnimatedActorFace {
    public int getCurrentFrame();

    public void setCurrentFrame(int var1);

    public int getAnimationSpeed();

    public void setAnimationSpeed(int var1);

    public int getFrameCount();

    public int getRepeatCount();

    public void setRepeatCount(int var1);

    public int getCurrentRepetition();

    public void reset();

    public void addActorFaceListener(ActorFaceListener var1);

    public void removeActorFaceListener(ActorFaceListener var1);
}
