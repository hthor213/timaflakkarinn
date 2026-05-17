/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.AnimatedActorFace;
import is.dimon.agt.Pulsable;
import is.dimon.agt.Pulser;
import is.dimon.agt.Scene;
import is.dimon.agt.StaticActorFace;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.ActorFaceEvent;
import is.dimon.agt.event.ActorFaceListener;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import is.dimon.agt.event.StageEvent;
import is.dimon.nemesis.draw.BitBuffer;
import java.awt.Rectangle;

public class CelledAnimated2DActorFace
extends StaticActorFace
implements AnimatedActorFace,
Pulsable,
FreezeListener {
    public static final int DEFAULT_SPEED = 75;
    protected int numCells;
    protected float cellWidth;
    protected int currentFrame = 0;
    protected int speed = 75;
    protected int repsLeft = -1;
    protected int repeats = -1;
    transient ActorFaceListener actorFaceListener;
    protected boolean random = false;
    protected Pulser pulser;
    private boolean dontAdvance = false;
    private boolean frozen = false;

    public void offStage(StageEvent stageEvent) {
        super.offStage(stageEvent);
        this.pulser.stopPulsing(this);
    }

    public void onStage(StageEvent stageEvent) {
        super.onStage(stageEvent);
        this.pulser.pulse(this);
        this.reset();
    }

    public long getPulseInterval() {
        return this.getAnimationSpeed();
    }

    public void detach() {
        super.detach();
        this.pulser.stopPulsing(this);
    }

    public void attach() {
        super.attach();
        if (this.parent != null && this.onStage) {
            this.pulser.pulse(this);
        }
        this.reset();
    }

    public int getCurrentFrame() {
        return this.currentFrame;
    }

    public void setCurrentFrame(int n) {
        this.currentFrame = n;
    }

    public int getAnimationSpeed() {
        return this.speed;
    }

    public void setAnimationSpeed(int n) {
        this.speed = n;
        if (this.parent != null && this.onStage) {
            this.pulser.stopPulsing(this);
            this.pulser.pulse(this);
        }
    }

    public int getFrameCount() {
        return this.numCells;
    }

    public void setFrameCount(int n) {
        this.numCells = n;
    }

    public void setImageSize(int n, int n2) {
        this.frameWidth = n;
        this.frameHeight = n2 / this.numCells;
        this.setScalingFactor(this.scaling);
    }

    public void setTransparent(boolean bl) {
    }

    public void setTransparentSize(int n, int n2) {
    }

    protected void fillScalingBuffer() {
        if (this.myScaledImageBuffer == null) {
            this.myScaledImageBuffer = new BitBuffer((int)((float)this.frameWidth * 1.8f), (int)((float)this.frameHeight * 1.8f), 16);
        }
        Rectangle rectangle = new Rectangle(0, this.currentFrame * this.frameHeight, this.frameWidth, this.frameHeight);
        Rectangle rectangle2 = new Rectangle(0, 0, this.bounds.width, this.bounds.height);
        this.myScaledImageBuffer.fill(BitBuffer.getDefaultTransparentColor());
        this.myScaledImageBuffer.blitScaled(this.myImageBuffer, rectangle, rectangle2);
    }

    public void paint(Rectangle rectangle, BitBuffer bitBuffer) {
        if (!this.prepared) {
            this.prepare();
        }
        if (rectangle.isEmpty()) {
            return;
        }
        this.poin = rectangle.getLocation();
        if (this.scaling != 1.0f) {
            rectangle.translate(-this.bounds.x, -this.bounds.y);
            bitBuffer.blit(this.myScaledImageBuffer, rectangle, this.poin);
        } else {
            rectangle.translate(-this.bounds.x, -this.bounds.y + this.currentFrame * this.frameHeight);
            bitBuffer.blit(this.myImageBuffer, rectangle, this.poin);
        }
    }

    public void paint(int n, int n2, int n3, int n4, BitBuffer bitBuffer) {
        this.paint(new Rectangle(n, n2, n3, n4), bitBuffer);
    }

    private void advanceFrame() {
        if (this.repsLeft == 1 && this.currentFrame == this.getFrameCount() - 1) {
            this.repsLeft = 0;
        }
        if (this.repsLeft == 0) {
            this.processActorFaceEvent(new ActorFaceEvent(this, 0));
            this.pulser.stopPulsing(this);
            return;
        }
        if (!this.random) {
            if (!this.dontAdvance) {
                ++this.currentFrame;
            } else {
                this.dontAdvance = false;
            }
            if (this.currentFrame >= this.getFrameCount()) {
                this.currentFrame = 0;
                if (this.repsLeft != -1) {
                    --this.repsLeft;
                }
            }
        } else {
            this.currentFrame = (int)(Math.random() * (double)this.getFrameCount());
        }
        Scene scene = this.parent;
        if (scene != null) {
            if (this.scaling != 1.0f) {
                this.fillScalingBuffer();
            }
            scene.invalidateRectangle(this.bounds);
        }
    }

    public int getRepeatCount() {
        return this.repeats;
    }

    public void setRepeatCount(int n) {
        this.repeats = n;
    }

    public int getCurrentRepetition() {
        return this.repsLeft;
    }

    public void freeze(FreezeEvent freezeEvent) {
        this.frozen = true;
    }

    public void thaw(FreezeEvent freezeEvent) {
        this.frozen = false;
    }

    public void pulse(long l) {
        if (this.frozen) {
            return;
        }
        this.advanceFrame();
    }

    public void setRandom(boolean bl) {
        this.random = bl;
    }

    public boolean getRandom() {
        return this.random;
    }

    public void reset() {
        this.currentFrame = 0;
        this.dontAdvance = true;
        this.repsLeft = this.repeats;
    }

    public synchronized void addActorFaceListener(ActorFaceListener actorFaceListener) {
        this.actorFaceListener = AGTEventMulticaster.add(this.actorFaceListener, actorFaceListener);
    }

    public synchronized void removeActorFaceListener(ActorFaceListener actorFaceListener) {
        this.actorFaceListener = AGTEventMulticaster.remove(this.actorFaceListener, actorFaceListener);
    }

    protected void processActorFaceEvent(ActorFaceEvent actorFaceEvent) {
        if (this.actorFaceListener != null) {
            this.actorFaceListener.actorAnimationFinished(actorFaceEvent);
        }
    }

    public void kill() {
        super.kill();
        this.actorFaceListener = null;
        this.pulser.stopPulsing(this);
        this.pulser = null;
        this.myImageBuffer = null;
    }

    public CelledAnimated2DActorFace(Pulser pulser) {
        this.pulser = pulser;
    }

    public CelledAnimated2DActorFace(Pulser pulser, int n) {
        this(pulser);
        this.numCells = n;
    }
}
