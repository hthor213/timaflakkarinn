/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.AGTMouseListener;
import is.dimon.agt.event.ActorCollisionEvent;
import is.dimon.agt.event.ActorCollisionListener;
import is.dimon.agt.event.ActorFaceEvent;
import is.dimon.agt.event.ActorFaceListener;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.agt.event.ActorMouthEvent;
import is.dimon.agt.event.ActorMouthListener;
import is.dimon.agt.event.ActorMovementEvent;
import is.dimon.agt.event.ActorMovementListener;
import is.dimon.agt.event.ActorStateChangeEvent;
import is.dimon.agt.event.ActorStateChangeListener;
import is.dimon.agt.event.ActorTerrainChangeEvent;
import is.dimon.agt.event.ActorTerrainChangeListener;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import is.dimon.agt.event.MovingActorDestinationReachedEvent;
import is.dimon.agt.event.MovingActorDestinationReachedListener;
import is.dimon.agt.event.StageEvent;
import is.dimon.agt.event.StageListener;
import is.dimon.agt.event.WorldSceneChangeEvent;
import is.dimon.agt.event.WorldSceneChangeListener;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.EventListener;

public class AGTEventMulticaster
implements ActorMovementListener,
ActorCollisionListener,
ActorStateChangeListener,
ActorTerrainChangeListener,
WorldSceneChangeListener,
ActorMouthListener,
ActorFaceListener,
ActorMouseListener,
MovingActorDestinationReachedListener,
StageListener,
AGTMouseListener,
FreezeListener {
    protected final EventListener a;
    protected final EventListener b;

    protected EventListener remove(EventListener eventListener) {
        if (eventListener == this.a) {
            return this.b;
        }
        if (eventListener == this.b) {
            return this.a;
        }
        EventListener eventListener2 = AGTEventMulticaster.removeInternal(this.a, eventListener);
        EventListener eventListener3 = AGTEventMulticaster.removeInternal(this.b, eventListener);
        if (eventListener2 == this.a && eventListener3 == this.b) {
            return this;
        }
        return AGTEventMulticaster.addInternal(eventListener2, eventListener3);
    }

    public static AGTMouseListener add(AGTMouseListener aGTMouseListener, AGTMouseListener aGTMouseListener2) {
        return (AGTMouseListener)AGTEventMulticaster.addInternal(aGTMouseListener, aGTMouseListener2);
    }

    public static AGTMouseListener remove(AGTMouseListener aGTMouseListener, AGTMouseListener aGTMouseListener2) {
        return (AGTMouseListener)AGTEventMulticaster.removeInternal(aGTMouseListener, aGTMouseListener2);
    }

    public static FreezeListener add(FreezeListener freezeListener, FreezeListener freezeListener2) {
        return (FreezeListener)AGTEventMulticaster.addInternal(freezeListener, freezeListener2);
    }

    public static FreezeListener remove(FreezeListener freezeListener, FreezeListener freezeListener2) {
        return (FreezeListener)AGTEventMulticaster.removeInternal(freezeListener, freezeListener2);
    }

    public void freeze(FreezeEvent freezeEvent) {
        ((FreezeListener)this.a).freeze(freezeEvent);
        ((FreezeListener)this.b).freeze(freezeEvent);
    }

    public void thaw(FreezeEvent freezeEvent) {
        ((FreezeListener)this.a).thaw(freezeEvent);
        ((FreezeListener)this.b).thaw(freezeEvent);
    }

    public void mousePressed(AGTMouseEvent aGTMouseEvent) {
        ((AGTMouseListener)this.a).mousePressed(aGTMouseEvent);
        ((AGTMouseListener)this.b).mousePressed(aGTMouseEvent);
    }

    public void mouseReleased(AGTMouseEvent aGTMouseEvent) {
        ((AGTMouseListener)this.a).mouseReleased(aGTMouseEvent);
        ((AGTMouseListener)this.b).mouseReleased(aGTMouseEvent);
    }

    public void mouseExited(AGTMouseEvent aGTMouseEvent) {
        ((AGTMouseListener)this.a).mouseExited(aGTMouseEvent);
        ((AGTMouseListener)this.b).mouseExited(aGTMouseEvent);
    }

    public void mouseEntered(AGTMouseEvent aGTMouseEvent) {
        ((AGTMouseListener)this.a).mouseEntered(aGTMouseEvent);
        ((AGTMouseListener)this.b).mouseEntered(aGTMouseEvent);
    }

    public void mouseClicked(AGTMouseEvent aGTMouseEvent) {
        ((AGTMouseListener)this.a).mouseClicked(aGTMouseEvent);
        ((AGTMouseListener)this.b).mouseClicked(aGTMouseEvent);
    }

    public void actorMoves(ActorMovementEvent actorMovementEvent) {
        ((ActorMovementListener)this.a).actorMoves(actorMovementEvent);
        ((ActorMovementListener)this.b).actorMoves(actorMovementEvent);
    }

    public static ActorMovementListener add(ActorMovementListener actorMovementListener, ActorMovementListener actorMovementListener2) {
        return (ActorMovementListener)AGTEventMulticaster.addInternal(actorMovementListener, actorMovementListener2);
    }

    public static ActorMovementListener remove(ActorMovementListener actorMovementListener, ActorMovementListener actorMovementListener2) {
        return (ActorMovementListener)AGTEventMulticaster.removeInternal(actorMovementListener, actorMovementListener2);
    }

    public void movingActorDestinationReached(MovingActorDestinationReachedEvent movingActorDestinationReachedEvent) {
        ((MovingActorDestinationReachedListener)this.a).movingActorDestinationReached(movingActorDestinationReachedEvent);
        ((MovingActorDestinationReachedListener)this.b).movingActorDestinationReached(movingActorDestinationReachedEvent);
    }

    public static MovingActorDestinationReachedListener add(MovingActorDestinationReachedListener movingActorDestinationReachedListener, MovingActorDestinationReachedListener movingActorDestinationReachedListener2) {
        return (MovingActorDestinationReachedListener)AGTEventMulticaster.addInternal(movingActorDestinationReachedListener, movingActorDestinationReachedListener2);
    }

    public static MovingActorDestinationReachedListener remove(MovingActorDestinationReachedListener movingActorDestinationReachedListener, MovingActorDestinationReachedListener movingActorDestinationReachedListener2) {
        return (MovingActorDestinationReachedListener)AGTEventMulticaster.removeInternal(movingActorDestinationReachedListener, movingActorDestinationReachedListener2);
    }

    public void actorCollides(ActorCollisionEvent actorCollisionEvent) {
        ((ActorCollisionListener)this.a).actorCollides(actorCollisionEvent);
        ((ActorCollisionListener)this.b).actorCollides(actorCollisionEvent);
    }

    public static ActorCollisionListener add(ActorCollisionListener actorCollisionListener, ActorCollisionListener actorCollisionListener2) {
        return (ActorCollisionListener)AGTEventMulticaster.addInternal(actorCollisionListener, actorCollisionListener2);
    }

    public static ActorCollisionListener remove(ActorCollisionListener actorCollisionListener, ActorCollisionListener actorCollisionListener2) {
        return (ActorCollisionListener)AGTEventMulticaster.removeInternal(actorCollisionListener, actorCollisionListener2);
    }

    public void actorMouthFinished(ActorMouthEvent actorMouthEvent) {
        ((ActorMouthListener)this.a).actorMouthFinished(actorMouthEvent);
        ((ActorMouthListener)this.b).actorMouthFinished(actorMouthEvent);
    }

    public static ActorMouthListener add(ActorMouthListener actorMouthListener, ActorMouthListener actorMouthListener2) {
        return (ActorMouthListener)AGTEventMulticaster.addInternal(actorMouthListener, actorMouthListener2);
    }

    public static ActorMouthListener remove(ActorMouthListener actorMouthListener, ActorMouthListener actorMouthListener2) {
        return (ActorMouthListener)AGTEventMulticaster.removeInternal(actorMouthListener, actorMouthListener2);
    }

    public void actorClicked(AGTMouseEvent aGTMouseEvent) {
        ((ActorMouseListener)this.a).actorClicked(aGTMouseEvent);
        ((ActorMouseListener)this.b).actorClicked(aGTMouseEvent);
    }

    public void actorEntered(AGTMouseEvent aGTMouseEvent) {
        ((ActorMouseListener)this.a).actorEntered(aGTMouseEvent);
        ((ActorMouseListener)this.b).actorEntered(aGTMouseEvent);
    }

    public void actorExited(AGTMouseEvent aGTMouseEvent) {
        ((ActorMouseListener)this.a).actorExited(aGTMouseEvent);
        ((ActorMouseListener)this.b).actorExited(aGTMouseEvent);
    }

    public static ActorMouseListener add(ActorMouseListener actorMouseListener, ActorMouseListener actorMouseListener2) {
        return (ActorMouseListener)AGTEventMulticaster.addInternal(actorMouseListener, actorMouseListener2);
    }

    public static ActorMouseListener remove(ActorMouseListener actorMouseListener, ActorMouseListener actorMouseListener2) {
        return (ActorMouseListener)AGTEventMulticaster.removeInternal(actorMouseListener, actorMouseListener2);
    }

    public void offStage(StageEvent stageEvent) {
        ((StageListener)this.a).offStage(stageEvent);
        ((StageListener)this.b).offStage(stageEvent);
    }

    public void onStage(StageEvent stageEvent) {
        ((StageListener)this.a).onStage(stageEvent);
        ((StageListener)this.b).onStage(stageEvent);
    }

    public static StageListener add(StageListener stageListener, StageListener stageListener2) {
        return (StageListener)AGTEventMulticaster.addInternal(stageListener, stageListener2);
    }

    public static StageListener remove(StageListener stageListener, StageListener stageListener2) {
        return (StageListener)AGTEventMulticaster.removeInternal(stageListener, stageListener2);
    }

    public void actorAnimationFinished(ActorFaceEvent actorFaceEvent) {
        ((ActorFaceListener)this.a).actorAnimationFinished(actorFaceEvent);
        ((ActorFaceListener)this.b).actorAnimationFinished(actorFaceEvent);
    }

    public static ActorFaceListener add(ActorFaceListener actorFaceListener, ActorFaceListener actorFaceListener2) {
        return (ActorFaceListener)AGTEventMulticaster.addInternal(actorFaceListener, actorFaceListener2);
    }

    public static ActorFaceListener remove(ActorFaceListener actorFaceListener, ActorFaceListener actorFaceListener2) {
        return (ActorFaceListener)AGTEventMulticaster.removeInternal(actorFaceListener, actorFaceListener2);
    }

    public void actorChangesState(ActorStateChangeEvent actorStateChangeEvent) {
        ((ActorStateChangeListener)this.a).actorChangesState(actorStateChangeEvent);
        ((ActorStateChangeListener)this.b).actorChangesState(actorStateChangeEvent);
    }

    public static ActorStateChangeListener add(ActorStateChangeListener actorStateChangeListener, ActorStateChangeListener actorStateChangeListener2) {
        return (ActorStateChangeListener)AGTEventMulticaster.addInternal(actorStateChangeListener, actorStateChangeListener2);
    }

    public static ActorStateChangeListener remove(ActorStateChangeListener actorStateChangeListener, ActorStateChangeListener actorStateChangeListener2) {
        return (ActorStateChangeListener)AGTEventMulticaster.removeInternal(actorStateChangeListener, actorStateChangeListener2);
    }

    public void actorChangesTerrain(ActorTerrainChangeEvent actorTerrainChangeEvent) {
        ((ActorTerrainChangeListener)this.a).actorChangesTerrain(actorTerrainChangeEvent);
        ((ActorTerrainChangeListener)this.b).actorChangesTerrain(actorTerrainChangeEvent);
    }

    public static ActorTerrainChangeListener add(ActorTerrainChangeListener actorTerrainChangeListener, ActorTerrainChangeListener actorTerrainChangeListener2) {
        return (ActorTerrainChangeListener)AGTEventMulticaster.addInternal(actorTerrainChangeListener, actorTerrainChangeListener2);
    }

    public static ActorTerrainChangeListener remove(ActorTerrainChangeListener actorTerrainChangeListener, ActorTerrainChangeListener actorTerrainChangeListener2) {
        return (ActorTerrainChangeListener)AGTEventMulticaster.removeInternal(actorTerrainChangeListener, actorTerrainChangeListener2);
    }

    public void worldChangesScene(WorldSceneChangeEvent worldSceneChangeEvent) {
        ((WorldSceneChangeListener)this.a).worldChangesScene(worldSceneChangeEvent);
        ((WorldSceneChangeListener)this.b).worldChangesScene(worldSceneChangeEvent);
    }

    public static WorldSceneChangeListener add(WorldSceneChangeListener worldSceneChangeListener, WorldSceneChangeListener worldSceneChangeListener2) {
        return (WorldSceneChangeListener)AGTEventMulticaster.addInternal(worldSceneChangeListener, worldSceneChangeListener2);
    }

    public static WorldSceneChangeListener remove(WorldSceneChangeListener worldSceneChangeListener, WorldSceneChangeListener worldSceneChangeListener2) {
        return (WorldSceneChangeListener)AGTEventMulticaster.removeInternal(worldSceneChangeListener, worldSceneChangeListener2);
    }

    protected static EventListener addInternal(EventListener eventListener, EventListener eventListener2) {
        if (eventListener == null) {
            return eventListener2;
        }
        if (eventListener2 == null) {
            return eventListener;
        }
        return new AGTEventMulticaster(eventListener, eventListener2);
    }

    protected static EventListener removeInternal(EventListener eventListener, EventListener eventListener2) {
        if (eventListener == eventListener2 || eventListener == null) {
            return null;
        }
        if (eventListener instanceof AGTEventMulticaster) {
            return ((AGTEventMulticaster)eventListener).remove(eventListener2);
        }
        return eventListener;
    }

    protected void saveInternal(ObjectOutputStream objectOutputStream, String string) throws IOException {
        if (this.a instanceof AGTEventMulticaster) {
            ((AGTEventMulticaster)this.a).saveInternal(objectOutputStream, string);
        } else if (this.a instanceof Serializable) {
            objectOutputStream.writeObject(string);
            objectOutputStream.writeObject(this.a);
        }
        if (this.b instanceof AGTEventMulticaster) {
            ((AGTEventMulticaster)this.b).saveInternal(objectOutputStream, string);
        } else if (this.b instanceof Serializable) {
            objectOutputStream.writeObject(string);
            objectOutputStream.writeObject(this.b);
        }
    }

    protected static void save(ObjectOutputStream objectOutputStream, String string, EventListener eventListener) throws IOException {
        if (eventListener == null) {
            return;
        }
        if (eventListener instanceof AGTEventMulticaster) {
            ((AGTEventMulticaster)eventListener).saveInternal(objectOutputStream, string);
        } else if (eventListener instanceof Serializable) {
            objectOutputStream.writeObject(string);
            objectOutputStream.writeObject(eventListener);
        }
    }

    protected AGTEventMulticaster(EventListener eventListener, EventListener eventListener2) {
        this.a = eventListener;
        this.b = eventListener2;
    }
}
