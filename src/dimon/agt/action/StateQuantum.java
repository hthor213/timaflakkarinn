/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.Actor;
import is.dimon.agt.AnimatedActorFace;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.event.ActorFaceEvent;
import is.dimon.agt.event.ActorFaceListener;
import is.dimon.agt.event.ActorMouthEvent;
import is.dimon.agt.event.ActorMouthListener;

public class StateQuantum
implements Quantum,
ActorFaceListener,
ActorMouthListener {
    private boolean wait = false;
    private boolean isFinished;
    private Actor actor;
    private String state;

    public String getState() {
        return this.state;
    }

    public void setState(String string) {
        this.state = string;
    }

    public boolean getWait() {
        return this.wait;
    }

    public void setWait(boolean bl) {
        this.wait = bl;
    }

    public Actor getActor() {
        return this.actor;
    }

    public void setActor(Actor actor) {
        this.actor = actor;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        if (this.wait) {
            if (this.actor.getMouth(this.state) == null) {
                this.isFinished = false;
                try {
                    ((AnimatedActorFace)((Object)this.actor.getFace(this.state))).addActorFaceListener(this);
                }
                catch (ClassCastException classCastException) {
                    System.err.println("WARNING: StateQuantum to wait for a state with mouth=null and no animatedActorFace!!");
                    System.err.println("The grilled state is: " + this.state);
                    System.err.println("The actor is: " + this.actor.getName());
                    this.isFinished = true;
                }
                catch (NullPointerException nullPointerException) {
                    System.err.println("WARNING: StateQuantum to wait for a state with face=null and mouth=null!!");
                    System.err.println("The grilled state is: " + this.state);
                    System.err.println("The actor is: " + this.actor.getName());
                    this.isFinished = true;
                }
            } else {
                this.isFinished = false;
                this.actor.getMouth(this.state).addActorMouthListener(this);
            }
        } else {
            this.isFinished = true;
        }
        this.actor.setState(this.state);
        if (this.isFinished) return;
        try {
            this.wait();
            return;
        }
        catch (InterruptedException interruptedException) {
        }
    }

    public synchronized void tunnel() {
        if (this.wait) {
            return;
        }
        this.leap();
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void finish() {
        Object object;
        if (!this.wait) {
            return;
        }
        this.isFinished = true;
        try {
            object = (AnimatedActorFace)((Object)this.actor.getFace(this.state));
            object.removeActorFaceListener(this);
        }
        catch (ClassCastException classCastException) {
        }
        catch (NullPointerException nullPointerException) {
        }
        try {
            this.actor.getMouth(this.state).removeActorMouthListener(this);
        }
        catch (NullPointerException nullPointerException) {
        }
        object = this;
        synchronized (object) {
            this.notifyAll();
            return;
        }
    }

    public synchronized void actorAnimationFinished(ActorFaceEvent actorFaceEvent) {
        ((AnimatedActorFace)actorFaceEvent.getSource()).removeActorFaceListener(this);
        if (!this.isFinished) {
            this.isFinished = true;
            this.notifyAll();
        }
    }

    public synchronized void actorMouthFinished(ActorMouthEvent actorMouthEvent) {
        this.actor.getMouth(this.state).removeActorMouthListener(this);
        if (!this.isFinished) {
            this.isFinished = true;
            this.notifyAll();
        }
    }
}
