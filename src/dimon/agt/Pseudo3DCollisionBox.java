/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Actor;
import is.dimon.agt.CollisionBox;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.Scene;
import is.dimon.agt.Terrain;
import java.awt.Rectangle;
import java.util.Vector;

public class Pseudo3DCollisionBox
extends CollisionBox {
    private Rectangle myRectangle;
    private int myDepth;
    private int baseWidth;
    private int baseHeight;
    private int baseDepth;
    private Float3DPoint[] points = new Float3DPoint[27];
    private int xOff;
    private int yOff;
    private int zOff;

    public void setOffset(int n, int n2, int n3) {
        if (n > this.getWidth() || n2 > this.getHeight() || n3 > this.getDepth()) {
            System.out.println("Invalid Offset. The offset must be less than the corresponding dimension of the collision box");
            System.out.println("The offset is going to be: " + n + " , " + n2 + " , " + n3 + ", ");
            System.out.println("but my dimensions are: " + this.getWidth() + " , " + this.getHeight() + " , " + this.getDepth() + ", ");
            if (this.myOwner != null) {
                System.out.println("My owner is: " + this.myOwner.getName());
            }
            return;
        }
        this.xOff = n;
        this.yOff = n2;
        this.zOff = n3;
    }

    public int getXOffset() {
        return this.xOff;
    }

    public int getYOffset() {
        return this.yOff;
    }

    public int getZOffset() {
        return this.zOff;
    }

    public boolean validLocation(Float3DPoint float3DPoint) {
        int n;
        Terrain terrain = this.myOwner.getTerrain();
        Scene scene = terrain.getScene();
        Terrain terrain2 = terrain;
        this.points[0].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[1].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[2].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[3].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[4].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[5].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[6].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[7].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[8].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z - (float)this.zOff);
        this.points[17].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
        int n2 = 0;
        Vector<Terrain> vector = new Vector<Terrain>();
        int n3 = 0;
        while (n3 <= 8) {
            if (terrain.contains(this.points[n3])) {
                ++n2;
            }
            ++n3;
        }
        if (terrain.contains(this.points[17])) {
            ++n2;
        }
        if (n2 < 10) {
            this.points[9].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[10].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[11].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[12].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[13].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[14].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[15].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[16].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)this.myDepth - (float)this.zOff);
            this.points[18].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[19].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[20].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[21].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[22].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[23].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)this.myRectangle.height - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[24].setLocation(float3DPoint.x - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[25].setLocation(float3DPoint.x + (float)this.myRectangle.width - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[26].setLocation(float3DPoint.x + (float)(this.myRectangle.width / 2) - (float)this.xOff, float3DPoint.y + (float)(this.myRectangle.height / 2) - (float)this.yOff, float3DPoint.z + (float)(this.myDepth / 2) - (float)this.zOff);
            n3 = -99;
            int n4 = 0;
            while (n4 <= 26) {
                Terrain terrain3 = scene.getTerrainAt(this.points[n4]);
                if (terrain3 == null || !terrain3.isAllowed(this.myOwner)) {
                    return false;
                }
                if (!vector.contains(terrain3)) {
                    vector.addElement(terrain3);
                    n = 0;
                    if (n > n3) {
                        n3 = n;
                        terrain2 = terrain3;
                    }
                }
                ++n4;
            }
        }
        Vector vector2 = new Vector();
        if (vector.isEmpty()) {
            vector2 = terrain.getActors();
        } else {
            vector2 = ((Terrain)vector.elementAt(0)).getActors();
            int n5 = 1;
            while (n5 < vector.size()) {
                Vector vector3 = ((Terrain)vector.elementAt(n5)).getActors();
                n = 0;
                while (n < vector3.size()) {
                    vector2.addElement((Actor)vector3.elementAt(n));
                    ++n;
                }
                ++n5;
            }
        }
        int n6 = 0;
        while (n6 < vector2.size()) {
            Actor actor = (Actor)vector2.elementAt(n6);
            CollisionBox collisionBox = actor.getCollisionBox(actor.getState());
            if (collisionBox != null && collisionBox.checkCollision(float3DPoint, this.myOwner)) {
                return false;
            }
            ++n6;
        }
        if (terrain2 != terrain) {
            this.myOwner.setTerrain(terrain2);
        }
        return true;
    }

    public boolean validLocation(float f, float f2, float f3) {
        int n;
        Terrain terrain = this.myOwner.getTerrain();
        Scene scene = terrain.getScene();
        Terrain terrain2 = terrain;
        this.points[0].setLocation(f - (float)this.xOff, f2 - (float)this.yOff, f3 - (float)this.zOff);
        this.points[1].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 - (float)this.yOff, f3 - (float)this.zOff);
        this.points[2].setLocation(f - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 - (float)this.zOff);
        this.points[3].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 - (float)this.zOff);
        this.points[4].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 - (float)this.yOff, f3 - (float)this.zOff);
        this.points[5].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 - (float)this.zOff);
        this.points[6].setLocation(f - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 - (float)this.zOff);
        this.points[7].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 - (float)this.zOff);
        this.points[8].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 - (float)this.zOff);
        this.points[17].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
        int n2 = 0;
        Vector<Terrain> vector = new Vector<Terrain>();
        int n3 = 0;
        while (n3 <= 8) {
            if (terrain.contains(this.points[n3])) {
                ++n2;
            }
            ++n3;
        }
        if (terrain.contains(this.points[17])) {
            ++n2;
        }
        if (n2 < 10) {
            this.points[9].setLocation(f - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[10].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[11].setLocation(f - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[12].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[13].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[14].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[15].setLocation(f - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[16].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)this.myDepth - (float)this.zOff);
            this.points[18].setLocation(f - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[19].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[20].setLocation(f - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[21].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[22].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[23].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)this.myRectangle.height - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[24].setLocation(f - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[25].setLocation(f + (float)this.myRectangle.width - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            this.points[26].setLocation(f + (float)(this.myRectangle.width / 2) - (float)this.xOff, f2 + (float)(this.myRectangle.height / 2) - (float)this.yOff, f3 + (float)(this.myDepth / 2) - (float)this.zOff);
            n3 = -99;
            int n4 = 0;
            while (n4 <= 26) {
                Terrain terrain3 = scene.getTerrainAt(this.points[n4]);
                if (terrain3 == null || !terrain3.isAllowed(this.myOwner)) {
                    return false;
                }
                if (!vector.contains(terrain3)) {
                    vector.addElement(terrain3);
                    n = 1;
                    if (n > n3) {
                        n3 = n;
                        terrain2 = terrain3;
                    }
                }
                ++n4;
            }
        }
        Vector vector2 = new Vector();
        if (vector.isEmpty()) {
            vector2 = terrain.getActors();
        } else {
            vector2 = ((Terrain)vector.elementAt(0)).getActors();
            int n5 = 1;
            while (n5 < vector.size()) {
                Vector vector3 = ((Terrain)vector.elementAt(n5)).getActors();
                n = 0;
                while (n < vector3.size()) {
                    vector2.addElement((Actor)vector3.elementAt(n));
                    ++n;
                }
                ++n5;
            }
        }
        int n6 = 0;
        while (n6 < vector2.size()) {
            Actor actor = (Actor)vector2.elementAt(n6);
            CollisionBox collisionBox = actor.getCollisionBox(actor.getState());
            if (collisionBox != null && collisionBox.checkCollision(f, f2, f3, this.myOwner)) {
                return false;
            }
            ++n6;
        }
        if (terrain2 != terrain) {
            this.myOwner.setTerrain(terrain2);
        }
        return true;
    }

    public int getWidth() {
        return this.myRectangle.width;
    }

    public int getHeight() {
        return this.myRectangle.height;
    }

    public int getDepth() {
        return this.myDepth;
    }

    public int getBaseWidth() {
        return this.baseWidth;
    }

    public int getBaseHeight() {
        return this.baseHeight;
    }

    public int getBaseDepth() {
        return this.baseDepth;
    }

    public void setScalingFactor(float f) {
        super.setScalingFactor(f);
        this.myRectangle.setSize(Math.round((float)this.getBaseWidth() * f), Math.round((float)this.getBaseHeight() * f));
        this.myDepth = Math.round((float)this.getBaseDepth() * f);
        this.setOffset(this.getWidth() / 2, this.getHeight() / 2, 0);
    }

    public Rectangle getRectangle() {
        return this.myRectangle;
    }

    public boolean checkCollision(Float3DPoint float3DPoint, Actor actor) {
        CollisionBox collisionBox = actor.getCollisionBox(actor.getState());
        if (collisionBox == this) {
            return false;
        }
        if (collisionBox instanceof Pseudo3DCollisionBox) {
            Pseudo3DCollisionBox pseudo3DCollisionBox = (Pseudo3DCollisionBox)collisionBox;
            Float3DPoint float3DPoint2 = this.myOwner.getLocation();
            this.myRectangle.setLocation(Math.round(float3DPoint2.x) - this.xOff, Math.round(float3DPoint2.y) - this.yOff);
            Rectangle rectangle = pseudo3DCollisionBox.getRectangle();
            rectangle.setLocation(Math.round(float3DPoint.x) - pseudo3DCollisionBox.getXOffset(), Math.round(float3DPoint.y) - pseudo3DCollisionBox.getYOffset());
            if (rectangle.intersects(this.myRectangle) && float3DPoint2.z + (float)this.myDepth - (float)this.zOff > float3DPoint.z - (float)pseudo3DCollisionBox.getZOffset() && float3DPoint2.z - (float)this.zOff < float3DPoint.z + (float)pseudo3DCollisionBox.getDepth() - (float)pseudo3DCollisionBox.getZOffset()) {
                System.out.println("I am: " + this.myOwner.getName() + " Collision with actor: " + actor.getName());
                this.myOwner.collision(actor);
                actor.collision(this.myOwner);
                return !(this.myOwner.isAllowed(actor) || actor.isAllowed(this.myOwner));
            }
        } else {
            return false;
        }
        return false;
    }

    public boolean checkCollision(float f, float f2, float f3, Actor actor) {
        CollisionBox collisionBox = actor.getCollisionBox(actor.getState());
        if (collisionBox == this) {
            return false;
        }
        if (collisionBox instanceof Pseudo3DCollisionBox) {
            Pseudo3DCollisionBox pseudo3DCollisionBox = (Pseudo3DCollisionBox)collisionBox;
            Float3DPoint float3DPoint = this.myOwner.getLocation();
            this.myRectangle.setLocation(Math.round(float3DPoint.x) - this.xOff, Math.round(float3DPoint.y) - this.yOff);
            Rectangle rectangle = pseudo3DCollisionBox.getRectangle();
            rectangle.setLocation(Math.round(f) - pseudo3DCollisionBox.getXOffset(), Math.round(f2) - pseudo3DCollisionBox.getYOffset());
            if (rectangle.intersects(this.myRectangle) && float3DPoint.z + (float)this.myDepth - (float)this.zOff > f3 - (float)pseudo3DCollisionBox.getZOffset() && float3DPoint.z - (float)this.zOff < f3 + (float)pseudo3DCollisionBox.getDepth() - (float)pseudo3DCollisionBox.getZOffset()) {
                this.myOwner.collision(actor);
                actor.collision(this.myOwner);
                return !(this.myOwner.isAllowed(actor) || actor.isAllowed(this.myOwner));
            }
        } else {
            return false;
        }
        return false;
    }

    public Pseudo3DCollisionBox(int n, int n2, int n3) {
        this.baseWidth = n;
        this.baseHeight = n2;
        this.myRectangle = new Rectangle(n, n2);
        this.myDepth = n3;
        this.baseDepth = n3;
        this.xOff = n / 2;
        this.yOff = n2 / 2;
        this.zOff = 0;
        int n4 = 0;
        while (n4 < 27) {
            this.points[n4] = new Float3DPoint();
            ++n4;
        }
    }
}
