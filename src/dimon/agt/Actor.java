/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.ActorFace;
import is.dimon.agt.ActorMouth;
import is.dimon.agt.CelledAnimated2DActorFace;
import is.dimon.agt.CollisionBox;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Killable;
import is.dimon.agt.Pseudo3DCollisionBox;
import is.dimon.agt.Terrain;
import is.dimon.agt.action.Groups;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.AGTMouseListener;
import is.dimon.agt.event.ActorCollisionEvent;
import is.dimon.agt.event.ActorCollisionListener;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.agt.event.ActorMovementEvent;
import is.dimon.agt.event.ActorMovementListener;
import is.dimon.agt.event.ActorStateChangeEvent;
import is.dimon.agt.event.ActorStateChangeListener;
import is.dimon.agt.event.ActorTerrainChangeEvent;
import is.dimon.agt.event.ActorTerrainChangeListener;
import java.awt.Point;
import java.util.Enumeration;
import java.util.Hashtable;

public abstract class Actor
implements AGTMouseListener,
Killable {
    public static final int NO_SCALING = 0;
    public static final int STATIC_SCALING = 1;
    public static final int DYNAMIC_SCALING = 2;
    static int count = 0;
    static long coun = 0L;
    int scalingType = 0;
    private String name;
    protected boolean onStage = false;
    public Object actorLock = new Object();
    transient ActorMouseListener actorMouseListener;
    transient ActorMovementListener actorMovementListener;
    transient ActorStateChangeListener actorStateChangeListener;
    transient ActorCollisionListener actorCollisionListener;
    transient ActorTerrainChangeListener actorTerrainChangeListener;
    private Hashtable faces;
    private Hashtable mouths;
    private Hashtable collisionBoxes;
    private String currentState;
    private Terrain currentTerrain;
    private CollisionBox currentCollisionBox;
    private ActorFace currentFace;
    private ActorMouth currentMouth;
    private Float3DPoint location;
    boolean random;

    public void kill() {
        this.faces.clear();
        this.faces = null;
        this.mouths.clear();
        this.mouths = null;
        this.collisionBoxes.clear();
        this.collisionBoxes = null;
        this.currentMouth = null;
        if (this.currentFace != null) {
            this.currentFace.removeAGTMouseListener(this);
        }
        this.currentFace = null;
        this.currentTerrain = null;
    }

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void setScalingType(int n) {
        this.scalingType = n;
    }

    public void setLocation(float f, float f2, float f3) throws InvalidPositionException {
        Object object = this.actorLock;
        synchronized (object) {
            if (this.currentTerrain != null && this.currentCollisionBox != null && !this.currentCollisionBox.validLocation(f, f2, f3)) {
                throw new InvalidPositionException();
            }
            this.location.setLocation(f, f2, f3);
            this.updateFace();
            this.processActorMovementEvent(new ActorMovementEvent(this, 0, new Float3DPoint(this.location)));
        }
    }

    public void setLocation(Float3DPoint float3DPoint) throws InvalidPositionException {
        this.setLocation(float3DPoint.x, float3DPoint.y, float3DPoint.z);
    }

    public Float3DPoint getLocation() {
        return new Float3DPoint(this.location);
    }

    public float getZOrder() {
        return this.location.y;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void updateFace() {
        Object object = this.actorLock;
        synchronized (object) {
            if (this.currentFace == null) {
                return;
            }
            if (this.currentTerrain != null) {
                Point point = this.currentTerrain.getPhysicalCoords(this.location);
                float f = 1.0f;
                switch (this.scalingType) {
                    case 1: {
                        f = this.currentTerrain.getDefaultScaling();
                        break;
                    }
                    case 2: {
                        f = this.currentTerrain.getScaling(this.location);
                        break;
                    }
                }
                Pseudo3DCollisionBox pseudo3DCollisionBox = (Pseudo3DCollisionBox)this.currentCollisionBox;
                if (pseudo3DCollisionBox != null) {
                    pseudo3DCollisionBox.setScalingFactor(f);
                    point.y -= pseudo3DCollisionBox.getDepth();
                    point.x -= pseudo3DCollisionBox.getWidth() / 2;
                }
                this.currentFace.setScalingFactor(f);
                this.currentFace.setLocation(point);
                return;
            }
            this.currentFace.setLocation((int)this.location.x, (int)this.location.y - (int)this.location.z);
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void setState(String string) {
        if (this.currentState != null && this.currentState.equals(string)) {
            if (this.currentFace != null && this.currentFace instanceof CelledAnimated2DActorFace) {
                ((CelledAnimated2DActorFace)this.currentFace).reset();
            }
            if (this.currentMouth != null) {
                this.currentMouth.stop();
                this.currentMouth.start();
            }
            return;
        }
        ActorFace actorFace = (ActorFace)this.faces.get(string);
        this.currentCollisionBox = (CollisionBox)this.collisionBoxes.get(string);
        Object object = this.actorLock;
        synchronized (object) {
            if (this.currentFace != null && actorFace != null && this.currentFace != actorFace) {
                if (this.currentFace.getParent() != null) {
                    Object object2 = this.currentFace.getParent().chainLock;
                    synchronized (object2) {
                        this.currentFace.detach();
                        if (this.actorMouseListener != null) {
                            this.currentFace.removeAGTMouseListener(this);
                        }
                        this.currentFace = actorFace;
                        this.updateFace();
                        this.currentFace.attach();
                        if (this.actorMouseListener != null) {
                            this.currentFace.addAGTMouseListener(this);
                        }
                    }
                }
                this.currentFace.detach();
                if (this.actorMouseListener != null) {
                    this.currentFace.removeAGTMouseListener(this);
                }
                this.currentFace = actorFace;
                this.updateFace();
                this.currentFace.attach();
                if (this.actorMouseListener != null) {
                    this.currentFace.addAGTMouseListener(this);
                }
            } else if (this.currentFace != null && this.currentFace == actorFace) {
                if (this.currentFace instanceof CelledAnimated2DActorFace) {
                    ((CelledAnimated2DActorFace)this.currentFace).reset();
                }
            } else {
                if (this.currentFace != null) {
                    this.currentFace.detach();
                    if (this.actorMouseListener != null) {
                        this.currentFace.removeAGTMouseListener(this);
                    }
                }
                this.currentFace = actorFace;
                if (this.currentFace != null) {
                    this.updateFace();
                    this.currentFace.attach();
                    if (this.actorMouseListener != null) {
                        this.currentFace.addAGTMouseListener(this);
                    }
                }
            }
            try {
                this.currentMouth.stop();
            }
            catch (NullPointerException nullPointerException) {
            }
            this.currentMouth = (ActorMouth)this.mouths.get(string);
            try {
                this.currentMouth.start();
            }
            catch (NullPointerException nullPointerException) {
            }
            this.currentState = string;
        }
        this.processActorStateChangeEvent(new ActorStateChangeEvent(this, 0, string));
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void setTerrain(Terrain terrain) {
        if (terrain == this.currentTerrain) {
            return;
        }
        Object object = this.actorLock;
        synchronized (object) {
            block17: {
                if (this.currentTerrain != null) {
                    this.currentTerrain.removeActor(this);
                }
                Terrain terrain2 = this.currentTerrain;
                this.currentTerrain = terrain;
                if (this.currentTerrain != null) {
                    this.currentTerrain.addActor(this);
                    float f = 1.0f;
                    switch (this.scalingType) {
                        case 1: {
                            f = this.currentTerrain.getDefaultScaling();
                            break;
                        }
                        case 2: {
                            f = this.currentTerrain.getScaling(this.location);
                            break;
                        }
                    }
                    Pseudo3DCollisionBox pseudo3DCollisionBox = (Pseudo3DCollisionBox)this.currentCollisionBox;
                    if (pseudo3DCollisionBox != null) {
                        System.out.println("About to set scaling as: " + f + " I am " + this.getName());
                        pseudo3DCollisionBox.setScalingFactor(f);
                    }
                    try {
                        this.setLocation(this.getLocation());
                    }
                    catch (InvalidPositionException invalidPositionException) {
                        System.err.println("SetTerrain for actor: " + this.getName() + " failed");
                        System.err.println("The actor still has it's oldTerrain");
                        this.currentTerrain = terrain2;
                        if (this.currentTerrain == null) break block17;
                        switch (this.scalingType) {
                            case 1: {
                                f = this.currentTerrain.getDefaultScaling();
                                break;
                            }
                            case 2: {
                                f = this.currentTerrain.getScaling(this.location);
                                break;
                            }
                        }
                        if (pseudo3DCollisionBox == null) break block17;
                        System.out.println("About to set scaling as: " + f + " I am " + this.getName());
                        pseudo3DCollisionBox.setScalingFactor(f);
                    }
                }
            }
        }
        this.processActorTerrainChangeEvent(new ActorTerrainChangeEvent(this, 0, this.currentTerrain));
    }

    public Terrain getTerrain() {
        return this.currentTerrain;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public void offStage() {
        this.onStage = false;
    }

    public void onStage() {
        this.onStage = true;
    }

    public String getState() {
        return this.currentState;
    }

    public boolean isAllowed(Actor actor) {
        return false;
    }

    void collision(Actor actor) {
        this.processActorCollisionEvent(new ActorCollisionEvent(this, 0, actor));
    }

    public int getFaceCount() {
        return this.faces.size();
    }

    public int getCollisionBoxCount() {
        return this.collisionBoxes.size();
    }

    public int getMouthCount() {
        return this.mouths.size();
    }

    public Enumeration getFaceStates() {
        return this.faces.keys();
    }

    public Enumeration getCollsionBoxStates() {
        return this.collisionBoxes.keys();
    }

    public Enumeration getMouthStates() {
        return this.mouths.keys();
    }

    public CollisionBox getCollisionBox(String string) {
        return (CollisionBox)this.collisionBoxes.get(string);
    }

    public void setCollisionBox(CollisionBox collisionBox, String string) {
        if (this.collisionBoxes.get(string) != null) {
            this.collisionBoxes.remove(string);
        }
        if (collisionBox == null) {
            this.collisionBoxes.remove(string);
        } else {
            this.collisionBoxes.put(string, collisionBox);
            collisionBox.setOwner(this);
        }
    }

    public void setFace(ActorFace actorFace, String string) {
        if (this.faces.get(string) != null) {
            this.faces.remove(string);
        }
        if (actorFace == null) {
            this.faces.remove(string);
        } else {
            this.faces.put(string, actorFace);
            actorFace.setOwner(this);
            if (this.currentTerrain != null) {
                actorFace.setLocation(this.currentTerrain.getPhysicalCoords(this.location));
            }
        }
    }

    public ActorFace getFace(String string) {
        return (ActorFace)this.faces.get(string);
    }

    public ActorMouth getMouth(String string) {
        return (ActorMouth)this.mouths.get(string);
    }

    public void setMouth(ActorMouth actorMouth, String string) {
        if (this.mouths.get(string) != null) {
            this.mouths.remove(string);
        }
        if (actorMouth == null) {
            this.mouths.remove(string);
        } else {
            this.mouths.put(string, actorMouth);
        }
    }

    public synchronized void addActorMovementListener(ActorMovementListener actorMovementListener) {
        this.actorMovementListener = AGTEventMulticaster.add(this.actorMovementListener, actorMovementListener);
    }

    public synchronized void removeActorMovementListener(ActorMovementListener actorMovementListener) {
        this.actorMovementListener = AGTEventMulticaster.remove(this.actorMovementListener, actorMovementListener);
    }

    protected void processActorMovementEvent(ActorMovementEvent actorMovementEvent) {
        if (this.actorMovementListener != null) {
            this.actorMovementListener.actorMoves(actorMovementEvent);
        }
    }

    public synchronized void addActorCollisionListener(ActorCollisionListener actorCollisionListener) {
        this.actorCollisionListener = AGTEventMulticaster.add(this.actorCollisionListener, actorCollisionListener);
    }

    public synchronized void removeActorCollisionListener(ActorCollisionListener actorCollisionListener) {
        this.actorCollisionListener = AGTEventMulticaster.remove(this.actorCollisionListener, actorCollisionListener);
    }

    protected void processActorCollisionEvent(ActorCollisionEvent actorCollisionEvent) {
        if (this.actorCollisionListener != null) {
            this.actorCollisionListener.actorCollides(actorCollisionEvent);
        }
    }

    public synchronized void addActorStateChangeListener(ActorStateChangeListener actorStateChangeListener) {
        this.actorStateChangeListener = AGTEventMulticaster.add(this.actorStateChangeListener, actorStateChangeListener);
    }

    public synchronized void removeActorStateChangeListener(ActorStateChangeListener actorStateChangeListener) {
        this.actorStateChangeListener = AGTEventMulticaster.remove(this.actorStateChangeListener, actorStateChangeListener);
    }

    protected void processActorStateChangeEvent(ActorStateChangeEvent actorStateChangeEvent) {
        if (this.actorStateChangeListener != null) {
            this.actorStateChangeListener.actorChangesState(actorStateChangeEvent);
        }
    }

    public synchronized void addActorTerrainChangeListener(ActorTerrainChangeListener actorTerrainChangeListener) {
        this.actorTerrainChangeListener = AGTEventMulticaster.add(this.actorTerrainChangeListener, actorTerrainChangeListener);
    }

    public synchronized void removeActorTerrainChangeListener(ActorTerrainChangeListener actorTerrainChangeListener) {
        this.actorTerrainChangeListener = AGTEventMulticaster.remove(this.actorTerrainChangeListener, actorTerrainChangeListener);
    }

    protected void processActorTerrainChangeEvent(ActorTerrainChangeEvent actorTerrainChangeEvent) {
        if (this.actorTerrainChangeListener != null) {
            this.actorTerrainChangeListener.actorChangesTerrain(actorTerrainChangeEvent);
        }
    }

    public synchronized void addActorMouseListener(ActorMouseListener actorMouseListener) {
        if (this.actorMouseListener == null && this.currentFace != null) {
            this.currentFace.addAGTMouseListener(this);
        }
        this.actorMouseListener = AGTEventMulticaster.add(this.actorMouseListener, actorMouseListener);
    }

    public synchronized void removeActorMouseListener(ActorMouseListener actorMouseListener) {
        this.actorMouseListener = AGTEventMulticaster.remove(this.actorMouseListener, actorMouseListener);
        if (this.actorMouseListener == null && this.currentFace != null) {
            this.currentFace.removeAGTMouseListener(this);
        }
    }

    protected void processActorEnteredEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.actorMouseListener != null) {
            this.actorMouseListener.actorEntered(aGTMouseEvent);
        }
    }

    protected void processActorExitedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.actorMouseListener != null) {
            this.actorMouseListener.actorExited(aGTMouseEvent);
        }
    }

    protected void processActorClickedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.actorMouseListener != null) {
            this.actorMouseListener.actorClicked(aGTMouseEvent);
        }
    }

    public void mouseClicked(AGTMouseEvent aGTMouseEvent) {
    }

    public void mousePressed(AGTMouseEvent aGTMouseEvent) {
        this.processActorClickedEvent(aGTMouseEvent);
    }

    public void mouseReleased(AGTMouseEvent aGTMouseEvent) {
    }

    public void mouseEntered(AGTMouseEvent aGTMouseEvent) {
        this.processActorEnteredEvent(aGTMouseEvent);
    }

    public void mouseExited(AGTMouseEvent aGTMouseEvent) {
        this.processActorExitedEvent(aGTMouseEvent);
    }

    public void setRandom(boolean bl) {
        this.random = bl;
    }

    public boolean getRandom() {
        return this.random;
    }

    public Actor() {
        this.name = new String("Actor" + ++count);
        ++coun;
        this.faces = new Hashtable();
        this.mouths = new Hashtable();
        this.collisionBoxes = new Hashtable();
        this.location = new Float3DPoint();
    }

    public Actor(String string) {
        this();
        Groups.add(string, this);
    }
}
