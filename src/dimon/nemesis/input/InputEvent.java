/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.input;

public class InputEvent {
    public static final int SHIFT_MASK = 1;
    public static final int CTRL_MASK = 2;
    public static final int META_MASK = 4;
    public static final int ALT_MASK = 8;
    public static final int BUTTON1_MASK = 16;
    public static final int BUTTON2_MASK = 8;
    public static final int BUTTON3_MASK = 4;
    protected int id;
    protected int modifiers;

    public int getID() {
        return this.id;
    }

    InputEvent(int n, int n2) {
        this.id = n;
        this.modifiers = n2;
    }

    public boolean isShiftDown() {
        return (this.modifiers & 1) != 0;
    }

    public boolean isControlDown() {
        return (this.modifiers & 2) != 0;
    }

    public boolean isMetaDown() {
        return (this.modifiers & 4) != 0;
    }

    public boolean isAltDown() {
        return (this.modifiers & 8) != 0;
    }

    public int getModifiers() {
        return this.modifiers;
    }
}
