/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Float3DPoint;
import is.dimon.agt.Scene;
import is.dimon.agt.ScrollingScene;
import is.dimon.agt.Terrain;
import java.awt.Point;
import java.awt.Polygon;

public class SimplePseudo3DTerrain
extends Terrain {
    protected Polygon myPolygon;
    protected int zMin;
    protected int zMax;
    protected float focalY;
    protected float referenceY;
    protected float referenceYScaling;
    protected float a = 0.0f;
    protected float b = 0.0f;
    boolean scrolling = true;

    public boolean contains(Float3DPoint float3DPoint) {
        if (this.myPolygon == null) {
            System.err.println("My polygon is null. I am: " + this.toString());
        }
        if (this.myPolygon.contains(Math.round(float3DPoint.x), Math.round(float3DPoint.y))) {
            return float3DPoint.z > (float)this.zMin && float3DPoint.z < (float)this.zMax;
        }
        return false;
    }

    public Point getPhysicalCoords(Float3DPoint float3DPoint) {
        return new Point(this.getPhysicalXCoord(float3DPoint), this.getPhysicalYCoord(float3DPoint));
    }

    public int getPhysicalXCoord(Float3DPoint float3DPoint) {
        int n = Math.round(float3DPoint.x);
        if (this.myScene instanceof ScrollingScene && this.scrolling) {
            Point point = ((ScrollingScene)this.myScene).getScrollPosition();
            n -= point.x;
        }
        return n;
    }

    public int getPhysicalYCoord(Float3DPoint float3DPoint) {
        int n = Math.round(float3DPoint.y - float3DPoint.z);
        if (this.myScene instanceof ScrollingScene && this.scrolling) {
            Point point = ((ScrollingScene)this.myScene).getScrollPosition();
            n -= point.y;
        }
        return n;
    }

    public void setScrolling(boolean bl) {
        this.scrolling = bl;
    }

    public boolean getScrolling() {
        return this.scrolling;
    }

    public void setScalingParameters(float f, float f2, float f3) {
        this.focalY = f;
        this.referenceY = f2;
        this.referenceYScaling = f3;
        this.a = (this.defaultScaling - f3) / (f - f2);
        this.b = f3 - this.a * f2;
    }

    public float getFocalY() {
        return this.focalY;
    }

    public float getReferenceY() {
        return this.referenceY;
    }

    public float getReferenceYScaling() {
        return this.referenceYScaling;
    }

    public float getScaling(Float3DPoint float3DPoint) {
        if (this.a != 0.0f) {
            return this.a * float3DPoint.y + this.b;
        }
        return this.defaultScaling;
    }

    public Polygon getPolygon() {
        return this.myPolygon;
    }

    public void setPolygon(Polygon polygon) {
        this.myPolygon = polygon;
    }

    public void setZMin(int n) {
        this.zMin = n;
    }

    public void setZMax(int n) {
        this.zMax = n;
    }

    public int getZMin() {
        return this.zMin;
    }

    public int getZMax() {
        return this.zMax;
    }

    public SimplePseudo3DTerrain(Scene scene, Polygon polygon, int n, int n2) {
        super(scene);
        this.myPolygon = polygon;
        this.zMin = n;
        this.zMax = n2;
    }
}
