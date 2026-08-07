/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.CursorFace;
import is.dimon.agt.Scene;
import is.dimon.agt.action.Quantum;
import java.awt.Point;

public class CursorQuantum
implements Quantum {
    protected String cursorImageFileName;
    protected int xOffset = 0;
    protected int yOffset = 0;

    public void setXOffset(int n) {
        this.xOffset = n;
    }

    public void setYOffset(int n) {
        this.yOffset = n;
    }

    public Point getOffset() {
        return new Point(this.xOffset, this.yOffset);
    }

    public void setCursorImagePath(String string) {
        this.cursorImageFileName = string;
    }

    public String getCursorImagePath() {
        return this.cursorImageFileName;
    }

    public void leap() {
        if (this.cursorImageFileName != null) {
            CursorFace cursorFace = new CursorFace(this.cursorImageFileName);
            cursorFace.setOffset(this.xOffset, this.yOffset);
            Scene.setCursorFace(cursorFace);
        } else {
            Scene.setCursorFace(null);
        }
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
