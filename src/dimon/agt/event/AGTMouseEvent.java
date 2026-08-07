/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Actor;
import is.dimon.agt.event.AGTEvent;
import java.awt.Point;

public class AGTMouseEvent
extends AGTEvent {
    public static final int LEFT_BUTTON = 0;
    public static final int MIDDLE_BUTTON = 1;
    public static final int RIGHT_BUTTON = 2;
    public static final int MOUSE_FIRST = 500;
    public static final int MOUSE_LAST = 506;
    public static final int MOUSE_CLICKED = 500;
    public static final int MOUSE_PRESSED = 501;
    public static final int MOUSE_RELEASED = 502;
    public static final int MOUSE_MOVED = 503;
    public static final int MOUSE_ENTERED = 504;
    public static final int MOUSE_EXITED = 505;
    public static final int MOUSE_DRAGGED = 506;
    int x;
    int y;
    long when;
    private int button;

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public int getButton() {
        switch (this.id) {
            case 500: 
            case 501: 
            case 502: 
            case 506: {
                return this.button;
            }
        }
        return -1;
    }

    public Point getPoint() {
        int n;
        int n2;
        AGTMouseEvent aGTMouseEvent = this;
        synchronized (aGTMouseEvent) {
            n2 = this.x;
            n = this.y;
        }
        return new Point(n2, n);
    }

    public synchronized void translatePoint(int n, int n2) {
        this.x += n;
        this.y += n2;
    }

    public AGTMouseEvent(Actor actor, int n, int n2, int n3, int n4) {
        super(actor, n);
        this.x = n2;
        this.y = n3;
        this.button = n4;
    }
}
