/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.input;

import is.dimon.nemesis.input.InputEvent;
import java.awt.Point;

public class MouseEvent
extends InputEvent {
    public static final int MOUSE_FIRST = 500;
    public static final int MOUSE_LAST = 504;
    public static final int MOUSE_CLICKED = 500;
    public static final int MOUSE_PRESSED = 501;
    public static final int MOUSE_RELEASED = 502;
    public static final int MOUSE_MOVED = 503;
    public static final int MOUSE_DRAGGED = 504;
    int x;
    int y;
    int clickCount;
    int whichButton;

    public MouseEvent(int n, int n2, int n3, int n4, int n5, int n6) {
        super(n, n2);
        this.x = n3;
        this.y = n4;
        this.clickCount = n5;
        this.whichButton = n6;
    }

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public Point getPoint() {
        int n;
        int n2;
        MouseEvent mouseEvent = this;
        synchronized (mouseEvent) {
            n2 = this.x;
            n = this.y;
        }
        return new Point(n2, n);
    }

    public synchronized void translatePoint(int n, int n2) {
        this.x += n;
        this.y += n2;
    }

    public int getClickCount() {
        return this.clickCount;
    }

    public int getWhichButton() {
        return this.whichButton;
    }

    public String paramString() {
        String string;
        switch (this.id) {
            case 501: {
                string = "MOUSE_PRESSED";
                break;
            }
            case 502: {
                string = "MOUSE_RELEASED";
                break;
            }
            case 500: {
                string = "MOUSE_CLICKED";
                break;
            }
            case 503: {
                string = "MOUSE_MOVED";
                break;
            }
            case 504: {
                string = "MOUSE_DRAGGED";
                break;
            }
            default: {
                string = "unknown type";
            }
        }
        return String.valueOf(string) + ",(" + this.x + "," + this.y + ")" + ",mods=" + this.getModifiers() + ",clickCount=" + this.clickCount + ",whichButton=" + this.whichButton;
    }
}
