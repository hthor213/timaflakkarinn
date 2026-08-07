/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

public class Volume {
    public static final int TYPE_UNKNOWN = 0;
    public static final int TYPE_HARD_DRIVE = 1;
    public static final int TYPE_FLOPPY_DRIVE = 2;
    public static final int TYPE_CD_ROM = 3;
    public static final int TYPE_DVD = 4;
    public static final int TYPE_NETWORK_DRIVE = 5;
    private String name;
    private String path;
    private int type;
    private boolean readOnly;

    public Volume(String name, String path, int type, boolean readOnly) {
        this.name = name;
        this.path = path;
        this.type = type;
        this.readOnly = readOnly;
    }

    public String getName() {
        return this.name;
    }

    public String getPath() {
        return this.path;
    }

    public int getType() {
        return this.type;
    }

    public boolean getReadOnly() {
        return this.readOnly;
    }
}
