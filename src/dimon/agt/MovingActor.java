/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.ActorVelocity;
import is.dimon.agt.FaceSwitcher;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Pulsable;
import is.dimon.agt.Pulser;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import is.dimon.agt.event.MovingActorDestinationReachedEvent;
import is.dimon.agt.event.MovingActorDestinationReachedListener;

public class MovingActor
extends Actor
implements ActorVelocity,
Pulsable,
FreezeListener {
    public static final int STOP_WHEN_OFFSTAGE = 0;
    public static final int FREEZE_WHEN_OFFSTAGE = 1;
    public static final int MOVE_WHEN_OFFSTAGE = 2;
    public static final float DEFAULT_SPEED = 75.0f;
    protected float speedScalingFactor = 1.0f;
    protected float speed = 75.0f;
    protected Pulser pulser;
    protected double course = 10.0;
    protected int interval = 75;
    protected int offStageBehavior = 0;
    protected Float3DPoint destination = new Float3DPoint();
    private boolean control = false;
    private boolean yFailed = false;
    private int xFailed = 0;
    private Float3DPoint tempDest;
    protected FaceSwitcher faceSwitcher;
    transient MovingActorDestinationReachedListener movingActorDestinationReachedListener;
    private boolean frozen = false;

    public float getSpeed() {
        return this.speed;
    }

    public void setFaceSwitcher(FaceSwitcher faceSwitcher) {
        this.faceSwitcher = faceSwitcher;
    }

    public FaceSwitcher getFaceSwitcher() {
        return this.faceSwitcher;
    }

    public float getSpeedScalingFactor() {
        return this.speedScalingFactor;
    }

    public void setSpeedScalingFactor(float f) {
        this.speedScalingFactor = f;
    }

    public void setSpeed(float f) {
        this.speed = f;
    }

    public void setOffStageBehavior(int n) {
        this.offStageBehavior = n;
    }

    public int getInterval() {
        return this.interval;
    }

    public long getPulseInterval() {
        return this.getInterval();
    }

    public void setInterval(int n) {
        this.interval = n;
    }

    public void setDestination(int n, int n2) {
        if (!this.onStage && this.offStageBehavior == 0) {
            return;
        }
        Object object = this.actorLock;
        synchronized (object) {
            this.control = false;
            this.xFailed = 0;
            this.yFailed = false;
            this.destination.setLocation(n, n2, 0.0f);
            this.course = Math.atan2(this.getLocation().y - this.destination.y, this.destination.x - this.getLocation().x);
        }
        this.pulser.pulse(this);
    }

    private void setDestination(float f, float f2) {
        Object object = this.actorLock;
        synchronized (object) {
            this.destination.setLocation(f, f2, 0.0f);
            this.course = Math.atan2(this.getLocation().y - this.destination.y, this.destination.x - this.getLocation().x);
        }
    }

    public double getCourse() {
        return this.course;
    }

    public void stopActor() {
        this.course = 10.0;
        this.pulser.stopPulsing(this);
        if (this.faceSwitcher != null) {
            this.faceSwitcher.switchFace(this);
        }
    }

    public void offStage() {
        super.offStage();
        switch (this.offStageBehavior) {
            case 0: {
                this.stopActor();
                break;
            }
            case 1: {
                break;
            }
            case 2: {
                break;
            }
        }
    }

    public void onStage() {
        super.onStage();
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void updateLocation() {
        if (this.course == 10.0) {
            return;
        }
        if (!this.onStage) {
            if (this.offStageBehavior == 0) return;
            if (this.offStageBehavior == 1) {
                return;
            }
        }
        float f = (float)Math.cos(this.course) * this.speed * (float)this.interval * this.speedScalingFactor / 1000.0f;
        float f2 = (float)Math.sin(this.course) * this.speed * (float)this.interval * this.speedScalingFactor / 1000.0f;
        Object object = this.actorLock;
        synchronized (object) {
            try {
                this.setLocation(this.getLocation().x + f, this.getLocation().y - f2, this.getLocation().z);
                return;
            }
            catch (InvalidPositionException invalidPositionException) {
                if (!this.control) {
                    this.control = true;
                    this.tempDest = new Float3DPoint(this.destination.x, this.destination.y, 0.0f);
                } else {
                    if (this.xFailed == 0) {
                        this.xFailed = 1;
                    } else if (!this.yFailed) {
                        this.yFailed = true;
                    } else if (this.xFailed == 1) {
                        this.xFailed = 2;
                    }
                    if (this.xFailed == 2) {
                        this.stopActor();
                        this.processMovingActorDestinationReachedEvent(new MovingActorDestinationReachedEvent(this, 1));
                        this.control = false;
                        this.xFailed = 0;
                        this.yFailed = false;
                    }
                }
                if (!this.control) return;
                if (this.xFailed == 0) {
                    this.setDestination(this.tempDest.x, this.getLocation().y);
                    this.updateLocation();
                } else if (!this.yFailed) {
                    this.setDestination(this.getLocation().x, this.tempDest.y);
                    this.updateLocation();
                } else {
                    if (this.xFailed != 1) return;
                    this.setDestination(this.tempDest.x, this.getLocation().y);
                    this.updateLocation();
                }
                return;
            }
        }
    }

    /*
     * Enabled force condition propagation
     * Lifted jumps to return sites
     */
    public boolean destinationReached() {
        if (this.course == 10.0) return false;
        Object object = this.actorLock;
        synchronized (object) {
            if (!(Math.abs(this.destination.x - this.getLocation().x) < this.speed * this.speedScalingFactor * (float)this.interval / 1000.0f)) return false;
            if (!(Math.abs(this.destination.y - this.getLocation().y) < this.speed * this.speedScalingFactor * (float)this.interval / 1000.0f)) return false;
            if (!this.control) {
                this.stopActor();
                this.processMovingActorDestinationReachedEvent(new MovingActorDestinationReachedEvent(this, 1));
                return true;
            }
            if (Math.abs(this.tempDest.x - this.getLocation().x) < this.speed * this.speedScalingFactor * (float)this.interval / 1000.0f && Math.abs(this.tempDest.y - this.getLocation().y) < this.speed * this.speedScalingFactor * (float)this.interval / 1000.0f) {
                this.control = false;
                this.xFailed = 0;
                this.yFailed = false;
                this.stopActor();
                this.processMovingActorDestinationReachedEvent(new MovingActorDestinationReachedEvent(this, 1));
                return true;
            }
            if (this.xFailed == 0) {
                this.xFailed = 2;
                this.setDestination(this.getLocation().x, this.tempDest.y);
                return false;
            }
            if (this.yFailed) return false;
            this.yFailed = true;
            this.setDestination(this.tempDest.x, this.getLocation().y);
            return false;
        }
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
        if (this.course != 10.0) {
            if (!this.destinationReached()) {
                this.updateLocation();
            }
            if (this.faceSwitcher != null) {
                this.faceSwitcher.switchFace(this);
            }
        }
    }

    public void kill() {
        super.kill();
        this.pulser.stopPulsing(this);
        this.pulser = null;
        this.faceSwitcher = null;
    }

    public synchronized void addMovingActorDestinationReachedListener(MovingActorDestinationReachedListener movingActorDestinationReachedListener) {
        this.movingActorDestinationReachedListener = AGTEventMulticaster.add(this.movingActorDestinationReachedListener, movingActorDestinationReachedListener);
    }

    public synchronized void removeMovingActorDestinationReachedListener(MovingActorDestinationReachedListener movingActorDestinationReachedListener) {
        this.movingActorDestinationReachedListener = AGTEventMulticaster.remove(this.movingActorDestinationReachedListener, movingActorDestinationReachedListener);
    }

    protected void processMovingActorDestinationReachedEvent(MovingActorDestinationReachedEvent movingActorDestinationReachedEvent) {
        if (this.movingActorDestinationReachedListener != null) {
            this.movingActorDestinationReachedListener.movingActorDestinationReached(movingActorDestinationReachedEvent);
        }
    }

    public MovingActor(Pulser pulser) {
        this.pulser = pulser;
    }
}
