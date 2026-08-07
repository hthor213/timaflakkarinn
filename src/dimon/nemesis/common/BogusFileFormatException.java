/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

import java.io.IOException;

public class BogusFileFormatException
extends IOException {
    private String errorMsg;

    public String toString() {
        return this.errorMsg;
    }

    public BogusFileFormatException(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public BogusFileFormatException() {
    }
}
