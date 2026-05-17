/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.MovingActor;
import is.dimon.agt.Scene;
import is.dimon.agt.Terrain;
import is.dimon.agt.World;
import is.dimon.agt.event.ActorMovementEvent;
import is.dimon.agt.event.ActorMovementListener;
import is.dimon.agt.event.WorldSceneChangeEvent;
import is.dimon.agt.event.WorldSceneChangeListener;
import java.awt.Point;
import java.util.Enumeration;

public class ScrollingScene
extends Scene
implements ActorMovementListener,
WorldSceneChangeListener {
    private int scrollX = 0;
    private int scrollY = 0;
    private int realWidth;
    private int realHeight;
    private MovingActor mainActor;
    private boolean scrollAutomatic = true;
    private int topScrollDistance;
    private int bottomScrollDistance;
    private int leftScrollDistance;
    private int rightScrollDistance;
    private int scrollStep = 30;
    protected int[] scrollLock;
    protected boolean iAmOn = false;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void setScrollPosition(int n, int n2) {
        int[] nArray = this.scrollLock;
        synchronized (nArray) {
            if (n > this.realWidth - 800) {
                n = this.realWidth - 800;
            }
            if (n < 0) {
                n = 0;
            }
            if (n2 > this.realHeight - 600) {
                n2 = this.realHeight - 600;
            }
            if (n2 < 0) {
                n2 = 0;
            }
            if (n == this.scrollX && n2 == this.scrollY) {
                return;
            }
            this.setScrollXY(n, n2);
            this.myWorld.setPaint(false);
            Enumeration enumeration = this.getTerrains().elements();
            block5: while (true) {
                if (!enumeration.hasMoreElements()) {
                    this.myWorld.setPaint(true);
                    return;
                }
                Terrain terrain = (Terrain)enumeration.nextElement();
                Enumeration enumeration2 = terrain.getActors().elements();
                while (true) {
                    if (!enumeration2.hasMoreElements()) continue block5;
                    Actor actor = (Actor)enumeration2.nextElement();
                    try {
                        actor.setLocation(actor.getLocation());
                    }
                    catch (Exception exception) {
                    }
                }
                break;
            }
        }
    }

    private void setScrollXY(int n, int n2) {
        this.scrollX = n;
        this.scrollY = n2;
    }

    public int getRealWidth() {
        return this.realWidth;
    }

    public int getRealHeight() {
        return this.realHeight;
    }

    public Point getScrollPosition() {
        return new Point(this.scrollX, this.scrollY);
    }

    public void setScrollingDistances(int n, int n2, int n3, int n4) {
        this.topScrollDistance = n3;
        this.bottomScrollDistance = n4;
        this.rightScrollDistance = n2;
        this.leftScrollDistance = n;
    }

    public void setScrollStep(int n) {
        this.scrollStep = n;
    }

    public void setMainActor(MovingActor movingActor) {
        this.mainActor = movingActor;
    }

    public void worldChangesScene(WorldSceneChangeEvent worldSceneChangeEvent) {
        Scene scene = worldSceneChangeEvent.getScene();
        if (this.iAmOn && scene != this) {
            this.mainActor.removeActorMovementListener(this);
            this.iAmOn = false;
        }
        if (scene == this) {
            this.mainActor.addActorMovementListener(this);
            this.centerActor();
            this.iAmOn = true;
        }
    }

    public void actorMoves(ActorMovementEvent actorMovementEvent) {
        if (!this.scrollAutomatic) {
            return;
        }
        int n = Math.round(actorMovementEvent.getLocation().x) - this.scrollX;
        int n2 = Math.round(actorMovementEvent.getLocation().y) - this.scrollY;
        int n3 = this.scrollX;
        int n4 = this.scrollY;
        if (n < this.leftScrollDistance) {
            n3 -= this.scrollStep;
        }
        if (n > this.rightScrollDistance) {
            n3 += this.scrollStep;
        }
        if (n2 < this.topScrollDistance) {
            n4 -= this.scrollStep;
        }
        if (n2 > this.bottomScrollDistance) {
            n4 += this.scrollStep;
        }
        if (n3 != this.scrollX || n4 != this.scrollY) {
            this.setScrollPosition(n3, n4);
        }
    }

    public void centerActor() {
        if (!this.scrollAutomatic) {
            return;
        }
        this.setScrollPosition(Math.round(this.mainActor.getLocation().x) - 400, Math.round(this.mainActor.getLocation().y) - 300);
    }

    public void setAutomaticScrolling(boolean bl) {
        this.scrollAutomatic = bl;
    }

    public ScrollingScene(World world, int n, int n2) {
        super(world);
        world.addWorldSceneChangeListener(this);
        this.realWidth = n;
        this.realHeight = n2;
        this.scrollLock = new int[0];
    }
}
