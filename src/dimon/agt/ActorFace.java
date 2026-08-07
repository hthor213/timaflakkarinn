/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.Killable;
import is.dimon.agt.Preparable;
import is.dimon.agt.Scene;
import is.dimon.agt.Terrain;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.AGTMouseListener;
import is.dimon.agt.event.ActorTerrainChangeEvent;
import is.dimon.agt.event.ActorTerrainChangeListener;
import is.dimon.agt.event.StageEvent;
import is.dimon.agt.event.StageListener;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.util.Comparable;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;

public abstract class ActorFace
implements Comparable,
Preparable,
StageListener,
ActorTerrainChangeListener,
Killable {
    static int actorFaceCount = 1;
    static long coun = 0L;
    public String name;
    private Actor myOwner;
    private ActorFace inFront = null;
    private ActorFace behind = null;
    protected float scaling = 1.0f;
    protected Rectangle bounds;
    protected Rectangle oldBounds;
    protected int xOffset;
    protected int yOffset;
    protected Scene parent;
    protected boolean onStage = false;
    protected boolean attached = false;
    transient AGTMouseListener agtMouseListener;

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public void kill() {
        if (this.myOwner != null) {
            this.myOwner.removeActorTerrainChangeListener(this);
        }
        this.myOwner = null;
        if (this.parent != null) {
            this.parent.removeStageListener(this);
        }
        this.parent = null;
        this.inFront = null;
        this.behind = null;
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public Scene getParent() {
        return this.parent;
    }

    void setParent(Scene scene) {
        if (scene == this.parent) {
            return;
        }
        this.parent = scene;
    }

    public abstract void setScalingFactor(float var1);

    public float getScalingFactor() {
        return this.scaling;
    }

    public Actor getOwner() {
        return this.myOwner;
    }

    public void setOwner(Actor actor) {
        if (this.myOwner != null) {
            this.detach();
        }
        this.myOwner = actor;
    }

    public void offStage(StageEvent stageEvent) {
        this.onStage = false;
    }

    public void onStage(StageEvent stageEvent) {
        if (this.onStage) {
            return;
        }
        this.onStage = true;
    }

    public int compareTo(Object object) {
        float f;
        if (object == null) {
            System.out.println("ERROR   ActorFace::compareTo : o is null");
            return -1;
        }
        float f2 = this.getOwner().getZOrder();
        if (f2 < (f = ((ActorFace)object).getOwner().getZOrder())) {
            return -1;
        }
        if (f2 > f) {
            return 1;
        }
        if (f2 == f) {
            if (this.getName().compareTo(((ActorFace)object).getName()) < 0) {
                return -1;
            }
            if (this.getName().compareTo(((ActorFace)object).getName()) > 0) {
                return 1;
            }
            return 0;
        }
        return 0;
    }

    public ActorFace getBehind() {
        return this.behind;
    }

    public ActorFace getInFront() {
        return this.inFront;
    }

    void setBehind(ActorFace actorFace) {
        if (this.parent == null) {
            return;
        }
        if (actorFace == null) {
            this.parent.setFirstFace(this);
        }
        this.behind = actorFace;
    }

    void setInFront(ActorFace actorFace) {
        if (this.parent == null) {
            return;
        }
        this.inFront = actorFace;
    }

    public Rectangle getBounds() {
        return new Rectangle(this.bounds);
    }

    public Dimension getSize() {
        return new Dimension(this.bounds.width, this.bounds.height);
    }

    public void detach() {
        if (!this.attached) {
            return;
        }
        this.attached = false;
        this.myOwner.removeActorTerrainChangeListener(this);
        if (this.parent == null) {
            return;
        }
        this.parent.invalidateRectangle(this.oldBounds);
        this.parent.invalidateRectangle(this.bounds);
        this.parent.remove(this);
    }

    public void attach() {
        if (this.attached) {
            return;
        }
        this.attached = true;
        this.myOwner.addActorTerrainChangeListener(this);
        Terrain terrain = this.myOwner.getTerrain();
        if (terrain == null) {
            return;
        }
        if (terrain.getScene() == null) {
            return;
        }
        this.oldBounds.setBounds(this.bounds);
        terrain.getScene().add(this);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorChangesTerrain(ActorTerrainChangeEvent actorTerrainChangeEvent) {
        if (!this.attached) {
            System.out.println("WARNING ActorFace::actorChangesTerrain : Face " + this.name + " got an ActorTerrainChangeEvent when not attached");
            return;
        }
        try {
            if (this.parent == actorTerrainChangeEvent.getTerrain().getScene()) {
                return;
            }
        }
        catch (NullPointerException nullPointerException) {
        }
        if (this.parent != null) {
            this.parent.remove(this);
        }
        if (actorTerrainChangeEvent.getTerrain() != null && actorTerrainChangeEvent.getTerrain().getScene() != null) {
            actorTerrainChangeEvent.getTerrain().getScene().add(this);
        }
    }

    public void setLocation(int n, int n2) {
        int n3 = (int)((float)this.xOffset * this.scaling);
        int n4 = (int)((float)this.yOffset * this.scaling);
        Scene scene = this.parent;
        if (scene != null) {
            Object object = scene.chainLock;
            synchronized (object) {
                this.bounds.x = n + n3;
                this.bounds.y = n2 + n4;
                this.updateChain();
                scene.invalidateRectangle(this.oldBounds);
                scene.invalidateRectangle(this.bounds);
                this.oldBounds.setBounds(this.bounds);
            }
        } else {
            this.bounds.x = n + n3;
            this.bounds.y = n2 + n4;
        }
    }

    public void setOffset(int n, int n2) {
        this.xOffset = n;
        this.yOffset = n2;
    }

    private void updateChain() {
        if (this.parent == null) {
            return;
        }
        ActorFace actorFace = this;
        ActorFace actorFace2 = actorFace.getInFront();
        while (actorFace2 != null) {
            if (this.compareTo(actorFace2) == 1) {
                actorFace = actorFace2;
                if ((actorFace2 = actorFace.getInFront()) != null) continue;
                actorFace.setInFront(this);
                if (this.behind != null) {
                    this.behind.setInFront(this.inFront);
                    this.inFront.setBehind(this.behind);
                } else {
                    this.inFront.setBehind(null);
                }
                this.setBehind(actorFace);
                this.setInFront(null);
                return;
            }
            if (actorFace == this) break;
            actorFace2.setBehind(this);
            actorFace.setInFront(this);
            if (this.behind != null) {
                this.behind.setInFront(this.inFront);
                this.inFront.setBehind(this.behind);
            } else {
                this.inFront.setBehind(null);
            }
            this.setBehind(actorFace);
            this.setInFront(actorFace2);
            return;
        }
        actorFace = this;
        actorFace2 = actorFace.getBehind();
        while (actorFace2 != null) {
            if (this.compareTo(actorFace2) == -1) {
                actorFace = actorFace2;
                if ((actorFace2 = actorFace.getBehind()) != null) continue;
                actorFace.setBehind(this);
                if (this.inFront != null) {
                    this.inFront.setBehind(this.behind);
                    this.behind.setInFront(this.inFront);
                } else {
                    this.behind.setInFront(null);
                }
                this.setInFront(actorFace);
                this.setBehind(null);
                return;
            }
            if (actorFace != this) {
                actorFace2.setInFront(this);
                actorFace.setBehind(this);
                if (this.inFront != null) {
                    this.inFront.setBehind(this.behind);
                    this.behind.setInFront(this.inFront);
                } else {
                    this.behind.setInFront(null);
                }
                this.setInFront(actorFace);
                this.setBehind(actorFace2);
                return;
            }
            return;
        }
    }

    public void setLocation(Point point) {
        this.setLocation(point.x, point.y);
    }

    public Point getLocation() {
        return new Point(this.bounds.x, this.bounds.y);
    }

    public abstract void prepare();

    public abstract void unprepare();

    public abstract boolean isPrepared();

    public Rectangle fixInvalidation(Rectangle rectangle) {
        return rectangle;
    }

    public void paint(Rectangle rectangle, BitBuffer bitBuffer) {
        this.paint(rectangle.x, rectangle.y, rectangle.width, rectangle.height, bitBuffer);
    }

    public abstract void paint(int var1, int var2, int var3, int var4, BitBuffer var5);

    public boolean contains(int n, int n2) {
        return n > 0 && n < this.bounds.width && n2 > 0 && n2 < this.bounds.height;
    }

    public boolean contains(Point point) {
        return this.contains(point.x, point.y);
    }

    public synchronized void addAGTMouseListener(AGTMouseListener aGTMouseListener) {
        this.agtMouseListener = AGTEventMulticaster.add(this.agtMouseListener, aGTMouseListener);
    }

    public synchronized void removeAGTMouseListener(AGTMouseListener aGTMouseListener) {
        this.agtMouseListener = AGTEventMulticaster.remove(this.agtMouseListener, aGTMouseListener);
    }

    void processMouseEnteredEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.agtMouseListener != null) {
            this.agtMouseListener.mouseEntered(aGTMouseEvent);
        }
    }

    void processMouseExitedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.agtMouseListener != null) {
            this.agtMouseListener.mouseExited(aGTMouseEvent);
        }
    }

    void processMouseClickedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.agtMouseListener != null) {
            this.agtMouseListener.mouseClicked(aGTMouseEvent);
        }
    }

    void processMousePressedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.agtMouseListener != null) {
            this.agtMouseListener.mousePressed(aGTMouseEvent);
        }
    }

    void processMouseReleasedEvent(AGTMouseEvent aGTMouseEvent) {
        if (this.agtMouseListener != null) {
            this.agtMouseListener.mouseReleased(aGTMouseEvent);
        }
    }

    public ActorFace() {
        this.setName("ActorFace" + actorFaceCount++);
        ++coun;
        this.parent = null;
        this.bounds = new Rectangle();
        this.oldBounds = new Rectangle();
        this.xOffset = 0;
        this.yOffset = 0;
    }
}
