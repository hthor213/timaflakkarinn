/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.ActorFace;
import is.dimon.agt.CursorFace;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.Killable;
import is.dimon.agt.Terrain;
import is.dimon.agt.World;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.StageEvent;
import is.dimon.agt.event.StageListener;
import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.Color;
import is.dimon.nemesis.input.MouseEvent;
import is.dimon.nemesis.input.MouseListener;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;
import java.util.Enumeration;
import java.util.Vector;

public class Scene
implements MouseListener,
Killable {
    protected static CursorFace cursorFace;
    public static Scene currScene;
    static int count;
    static long coun;
    protected boolean iAmOn = false;
    protected int x;
    protected int y;
    protected ActorFace oldComponent = null;
    protected Color backgroundColor = null;
    protected Dimension screenDimension;
    public final Object chainLock = new Object();
    protected World myWorld;
    protected ActorFace firstFace;
    protected Vector terrains = new Vector(4, 2);
    transient StageListener stageListener;
    private String name;
    private boolean black = false;
    protected Vector invalRects = new Vector(10, 10);
    protected Rectangle oldRect;
    protected Rectangle dirtyRect;
    protected Rectangle tempRect;

    public void finalize() {
        --coun;
    }

    public static long getNumberOfObjects() {
        return coun;
    }

    public static void setCursorFace(CursorFace cursorFace) {
        if (Scene.cursorFace != null && currScene != null) {
            currScene.invalidateRectangle(Scene.cursorFace.getBounds());
        }
        if ((Scene.cursorFace = cursorFace) != null && currScene != null) {
            Point point = Nemesis.getMouse().getPosition();
            Scene.cursorFace.setLocation(point.x, point.y, currScene);
        }
    }

    public void setScreenDimension(Dimension dimension) {
        this.screenDimension = dimension;
    }

    public void setBackgroundColor(Color color) {
        this.backgroundColor = color;
    }

    public Color getBackgroundColod() {
        return this.backgroundColor;
    }

    public void onStage() {
        this.iAmOn = true;
        Nemesis.getMouse().startYellingAt(this);
        this.processStageOnEvent(new StageEvent(this, 1));
        Object object = this.terrains.elements();
        while (object.hasMoreElements()) {
            ((Terrain)object.nextElement()).onStage();
        }
        this.invalidateRectangle(new Rectangle(0, 0, this.screenDimension.width, this.screenDimension.height));
        currScene = this;
        object = Nemesis.getMouse().getPosition();
        ActorFace actorFace = this.getActorFaceAt(((Point)object).x, ((Point)object).y);
        if (actorFace != null) {
            actorFace.processMouseEnteredEvent(new AGTMouseEvent(actorFace.getOwner(), 504, ((Point)object).x, ((Point)object).y, -1));
        }
    }

    public void offStage() {
        this.iAmOn = false;
        Nemesis.getMouse().stopYellingAt(this);
        this.processStageOffEvent(new StageEvent(this, 0));
        Object object = this.terrains.elements();
        while (object.hasMoreElements()) {
            ((Terrain)object.nextElement()).offStage();
        }
        this.invalRects.removeAllElements();
        object = Nemesis.getMouse().getPosition();
        ActorFace actorFace = this.getActorFaceAt(((Point)object).x, ((Point)object).y);
        if (actorFace != null) {
            actorFace.processMouseExitedEvent(new AGTMouseEvent(actorFace.getOwner(), 505, ((Point)object).x, ((Point)object).y, -1));
        }
    }

    ActorFace getFirstFace() {
        Object object = this.chainLock;
        synchronized (object) {
            ActorFace actorFace = this.firstFace;
            Object var2_3 = null;
            return actorFace;
        }
    }

    void setFirstFace(ActorFace actorFace) {
        Object object = this.chainLock;
        synchronized (object) {
            this.firstFace = actorFace;
        }
    }

    public void setName(String string) {
        this.name = string;
    }

    public String getName() {
        return this.name;
    }

    public void addTerrain(Terrain terrain) {
        this.terrains.addElement(terrain);
        Enumeration enumeration = terrain.getActors().elements();
        while (enumeration.hasMoreElements()) {
            Actor actor = (Actor)enumeration.nextElement();
            ActorFace actorFace = actor.getFace(actor.getState());
            if (actorFace == null) continue;
            this.add(actorFace);
        }
    }

    public boolean removeTerrain(Terrain terrain) {
        if (this.terrains.contains(terrain)) {
            ActorFace actorFace = this.firstFace;
            Object object = this.chainLock;
            synchronized (object) {
                actorFace = this.firstFace;
                while (actorFace != null) {
                    if (actorFace.getOwner().getTerrain() == terrain) {
                        this.remove(actorFace);
                    }
                    actorFace = actorFace.getInFront();
                }
            }
        }
        return this.terrains.removeElement(terrain);
    }

    public Terrain getTerrainAt(Float3DPoint float3DPoint) {
        Enumeration enumeration = this.terrains.elements();
        while (enumeration.hasMoreElements()) {
            Terrain terrain = (Terrain)enumeration.nextElement();
            if (!terrain.contains(float3DPoint)) continue;
            return terrain;
        }
        return null;
    }

    public int getNumberOfTerrains() {
        return this.terrains.size();
    }

    public Vector getTerrains() {
        return this.terrains;
    }

    public void setBlack(boolean bl) {
        this.black = bl;
    }

    public boolean getBlack() {
        return this.black;
    }

    public World getWorld() {
        return this.myWorld;
    }

    public ActorFace getActorFaceAt(int n, int n2) {
        ActorFace actorFace = null;
        Object object = this.chainLock;
        synchronized (object) {
            ActorFace actorFace2 = this.firstFace;
            while (actorFace2 != null) {
                if (actorFace2.contains(n - actorFace2.getLocation().x, n2 - actorFace2.getLocation().y)) {
                    actorFace = actorFace2;
                }
                actorFace2 = actorFace2.getInFront();
            }
            ActorFace actorFace3 = actorFace;
            Object var5_7 = null;
            return actorFace3;
        }
    }

    public boolean contains(ActorFace actorFace) {
        Object object = this.chainLock;
        synchronized (object) {
            ActorFace actorFace2 = this.firstFace;
            while (actorFace2 != null) {
                if (actorFace2 == actorFace) {
                    boolean bl = true;
                    Object var3_6 = null;
                    return bl;
                }
                actorFace2 = actorFace2.getInFront();
            }
            boolean bl = false;
            Object var3_7 = null;
            return bl;
        }
    }

    public void listChain() {
        Object object = this.chainLock;
        synchronized (object) {
            ActorFace actorFace = this.firstFace;
            System.out.println("-- Start of List --");
            while (actorFace != null) {
                System.out.println(actorFace.getName() + " Order is: " + actorFace.getOwner().getZOrder());
                actorFace = actorFace.getInFront();
            }
            System.out.println("-- End of List --");
        }
    }

    /*
     * Enabled force condition propagation
     * Lifted jumps to return sites
     */
    public ActorFace add(ActorFace actorFace) {
        Object object = this.chainLock;
        synchronized (object) {
            this.invalidateRectangle(actorFace.getBounds());
            actorFace.setParent(this);
            this.addStageListener(actorFace);
            if (this.myWorld.getCurrentScene() == this) {
                actorFace.onStage(new StageEvent(this, 1));
            }
            if (this.firstFace == null) {
                this.firstFace = actorFace;
                actorFace.setInFront(null);
                actorFace.setBehind(null);
                return actorFace;
            }
            ActorFace actorFace2 = this.firstFace;
            ActorFace actorFace3 = null;
            while (actorFace2 != null) {
                if (actorFace2.compareTo(actorFace) == 1) {
                    if (actorFace3 != null) {
                        actorFace3.setInFront(actorFace);
                    }
                    actorFace.setBehind(actorFace3);
                    actorFace.setInFront(actorFace2);
                    actorFace2.setBehind(actorFace);
                    if (actorFace2 != this.firstFace) return actorFace;
                    this.firstFace = actorFace;
                    return actorFace;
                }
                actorFace3 = actorFace2;
                actorFace2 = actorFace2.getInFront();
            }
            actorFace.setBehind(actorFace3);
            actorFace.setInFront(null);
            actorFace3.setInFront(actorFace);
            return actorFace;
        }
    }

    public void remove(ActorFace actorFace) {
        this.removeStageListener(actorFace);
        Object object = this.chainLock;
        synchronized (object) {
            actorFace.setParent(null);
            ActorFace actorFace2 = this.firstFace;
            while (actorFace2 != null) {
                if (actorFace2 == actorFace) {
                    if (actorFace2 == this.firstFace) {
                        this.firstFace = actorFace2.getInFront();
                    }
                    ActorFace actorFace3 = actorFace2.getBehind();
                    ActorFace actorFace4 = actorFace2.getInFront();
                    if (actorFace3 != null) {
                        actorFace3.setInFront(actorFace4);
                    }
                    if (actorFace4 != null) {
                        actorFace4.setBehind(actorFace3);
                    }
                    actorFace2 = null;
                }
                if (actorFace2 == null) continue;
                actorFace2 = actorFace2.getInFront();
            }
            this.invalidateRectangle(actorFace.getBounds());
        }
    }

    public void invalidateRectangle(int n, int n2, int n3, int n4) {
        if (!this.iAmOn) {
            return;
        }
        Object object = this.chainLock;
        synchronized (object) {
            Rectangle rectangle = new Rectangle(n, n2, n3, n4);
            ActorFace actorFace = this.firstFace;
            while (actorFace != null) {
                if (actorFace.getBounds().intersects(rectangle)) {
                    rectangle = actorFace.fixInvalidation(rectangle);
                }
                actorFace = actorFace.getInFront();
            }
            this.invalRects.addElement(rectangle);
        }
    }

    public void invalidateRectangle(Rectangle rectangle) {
        this.invalidateRectangle(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
    }

    private Rectangle mergeRects() {
        if (this.backgroundColor != null) {
            return new Rectangle(this.screenDimension);
        }
        int n = 20000;
        int n2 = -20000;
        int n3 = 20000;
        int n4 = -20000;
        Object object = this.chainLock;
        synchronized (object) {
            Enumeration enumeration = this.invalRects.elements();
            while (enumeration.hasMoreElements()) {
                Rectangle rectangle = (Rectangle)enumeration.nextElement();
                if (rectangle.x < n) {
                    n = rectangle.x;
                }
                if (rectangle.y < n3) {
                    n3 = rectangle.y;
                }
                if (rectangle.x + rectangle.width > n2) {
                    n2 = rectangle.x + rectangle.width;
                }
                if (rectangle.y + rectangle.height <= n4) continue;
                n4 = rectangle.y + rectangle.height;
            }
        }
        if (n2 - n < 1 || n4 - n3 < 1) {
            return null;
        }
        return new Rectangle(n, n3, n2 - n, n4 - n3);
    }

    public boolean paint(BitBuffer bitBuffer) {
        if (!this.iAmOn) {
            return false;
        }
        Object object = this.chainLock;
        synchronized (object) {
            if (!this.black) {
                if (this.backgroundColor != null) {
                    bitBuffer.fill(this.backgroundColor);
                }
                this.tempRect = this.mergeRects();
                this.invalRects.removeAllElements();
                if (this.tempRect == null) {
                    boolean bl = false;
                    Object var3_4 = null;
                    return bl;
                }
                this.dirtyRect = this.oldRect != null ? this.tempRect.union(this.oldRect) : this.tempRect;
                this.oldRect = this.tempRect;
                ActorFace actorFace = this.firstFace;
                long l = 0L;
                while (actorFace != null) {
                    actorFace.paint(actorFace.getBounds().intersection(this.dirtyRect), bitBuffer);
                    actorFace = actorFace.getInFront();
                    if (++l == 500L) {
                        System.out.println("WARNING: 500 faces blitted");
                        ActorFace actorFace2 = this.firstFace;
                        System.out.println("-- Start of List --");
                        int n = 0;
                        while (actorFace2 != null) {
                            if (++n > 50) break;
                            System.out.println(actorFace2.getName());
                            actorFace2 = actorFace2.getInFront();
                        }
                        System.out.println("-- End of List --");
                    }
                    Thread.currentThread();
                    Thread.yield();
                }
                if (cursorFace != null) {
                    cursorFace.paint(cursorFace.getBounds().intersection(this.dirtyRect), bitBuffer);
                }
            } else {
                bitBuffer.clearToBlack();
            }
        }
        return true;
    }

    public void handleMouseEvent(MouseEvent mouseEvent) {
        this.x = mouseEvent.getX();
        this.y = mouseEvent.getY();
        ActorFace actorFace = this.getActorFaceAt(this.x, this.y);
        if (actorFace != this.oldComponent) {
            if (this.oldComponent != null && this.contains(this.oldComponent)) {
                this.oldComponent.processMouseExitedEvent(new AGTMouseEvent(this.oldComponent.getOwner(), 505, this.x, this.y, -1));
            }
            if (actorFace != null) {
                actorFace.processMouseEnteredEvent(new AGTMouseEvent(actorFace.getOwner(), 504, this.x, this.y, -1));
            }
        }
        int n = mouseEvent.getID();
        if (actorFace != null) {
            if (n == 500) {
                actorFace.processMouseClickedEvent(new AGTMouseEvent(actorFace.getOwner(), 500, this.x, this.y, mouseEvent.getWhichButton()));
            } else if (n == 501) {
                actorFace.processMousePressedEvent(new AGTMouseEvent(actorFace.getOwner(), 501, this.x, this.y, mouseEvent.getWhichButton()));
            } else if (n == 502) {
                actorFace.processMouseReleasedEvent(new AGTMouseEvent(actorFace.getOwner(), 502, this.x, this.y, mouseEvent.getWhichButton()));
            }
        }
        if ((n == 503 || n == 504) && cursorFace != null) {
            cursorFace.setLocation(this.x, this.y, this);
        }
        this.oldComponent = actorFace;
    }

    public void kill() {
        this.myWorld = null;
        this.invalRects = null;
        this.firstFace = null;
        this.terrains = null;
        Nemesis.getMouse().stopYellingAt(this);
    }

    public void processStageOffEvent(StageEvent stageEvent) {
        if (this.stageListener != null) {
            this.stageListener.offStage(stageEvent);
        }
    }

    public void processStageOnEvent(StageEvent stageEvent) {
        if (this.stageListener != null) {
            this.stageListener.onStage(stageEvent);
        }
    }

    public synchronized void addStageListener(StageListener stageListener) {
        if (this.iAmOn) {
            stageListener.onStage(new StageEvent(this, 1));
        }
        this.stageListener = AGTEventMulticaster.add(this.stageListener, stageListener);
    }

    public synchronized void removeStageListener(StageListener stageListener) {
        this.stageListener = AGTEventMulticaster.remove(this.stageListener, stageListener);
    }

    public Scene(World world) {
        this.myWorld = world;
        this.name = "Scene" + count++;
        ++coun;
        this.screenDimension = new Dimension(800, 600);
    }

    static {
        count = 0;
        coun = 0L;
    }
}
