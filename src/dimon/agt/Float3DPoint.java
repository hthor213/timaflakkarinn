/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

public class Float3DPoint {
    public float x;
    public float y;
    public float z;

    public Float3DPoint getLocation() {
        return new Float3DPoint(this.x, this.y, this.z);
    }

    public void setLocation(float f, float f2, float f3) {
        this.x = f;
        this.y = f2;
        this.z = f3;
    }

    public void setLocation(Float3DPoint float3DPoint) {
        this.x = float3DPoint.x;
        this.y = float3DPoint.y;
        this.z = float3DPoint.z;
    }

    public boolean equals(Float3DPoint float3DPoint) {
        return float3DPoint.x == this.x && float3DPoint.y == this.y && float3DPoint.z == this.z;
    }

    public Float3DPoint() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
    }

    public Float3DPoint(float f, float f2, float f3) {
        this.x = f;
        this.y = f2;
        this.z = f3;
    }

    public Float3DPoint(Float3DPoint float3DPoint) {
        if (float3DPoint != null) {
            this.x = float3DPoint.x;
            this.y = float3DPoint.y;
            this.z = float3DPoint.z;
        } else {
            this.x = 0.0f;
            this.y = 0.0f;
            this.z = 0.0f;
        }
    }
}
