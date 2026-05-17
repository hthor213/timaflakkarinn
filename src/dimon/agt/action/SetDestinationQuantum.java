/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.MovingActor;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.event.MovingActorDestinationReachedEvent;
import is.dimon.agt.event.MovingActorDestinationReachedListener;

public class SetDestinationQuantum
implements Quantum,
MovingActorDestinationReachedListener {
    private float speed = -1.0f;
    private MovingActor actor;
    private Float3DPoint destination;
    private boolean isFinished;
    private boolean wait;
    private Thread waitingThread;

    public MovingActor getActor() {
        return this.actor;
    }

    public void setActor(MovingActor movingActor) {
        this.actor = movingActor;
    }

    public void setSpeed(float f) {
        if (f < 0.0f) {
            return;
        }
        this.speed = f;
    }

    public Float3DPoint getDestination() {
        return this.destination;
    }

    public void setDestination(Float3DPoint float3DPoint) {
        this.destination = float3DPoint;
    }

    public boolean getWait() {
        return this.wait;
    }

    public void setWait(boolean bl) {
        this.wait = bl;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        if (this.wait) {
            this.waitingThread = Thread.currentThread();
            this.actor.addMovingActorDestinationReachedListener(this);
            this.isFinished = false;
        } else {
            this.isFinished = true;
        }
        this.actor.setDestination((int)this.destination.x, (int)this.destination.y);
        if (this.speed != -1.0f) {
            this.actor.setSpeed(this.speed);
        }
        if (this.isFinished) return;
        try {
            this.wait(240000L);
        }
        catch (InterruptedException interruptedException) {
        }
        if (this.isFinished) return;
        this.isFinished = true;
        try {
            Float3DPoint float3DPoint = this.actor.getLocation();
            this.actor.setLocation(this.destination.x, this.destination.y, float3DPoint.z);
            this.actor.removeMovingActorDestinationReachedListener(this);
            return;
        }
        catch (InvalidPositionException invalidPositionException) {
            System.out.println("SetDestinationQuantum.leap() - InvalidPositionException " + this.actor.getName());
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void tunnel() {
        try {
            Float3DPoint float3DPoint = this.actor.getLocation();
            this.actor.setLocation(this.destination.x, this.destination.y, float3DPoint.z);
            return;
        }
        catch (InvalidPositionException invalidPositionException) {
            System.err.println("SetDestinationQuantum.tunnel() - InvalidPositionException " + this.actor.getName());
        }
    }

    public void finish() {
        if (this.waitingThread != null) {
            this.waitingThread.interrupt();
        }
    }

    public void movingActorDestinationReached(MovingActorDestinationReachedEvent movingActorDestinationReachedEvent) {
        if (!this.isFinished) {
            this.isFinished = true;
            this.waitingThread.interrupt();
        }
        this.actor.removeMovingActorDestinationReachedListener(this);
    }
}
