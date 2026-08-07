/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

public class AlreadyExistsException
extends Exception {
    private String errorMsg;

    public String toString() {
        return this.errorMsg;
    }

    public AlreadyExistsException(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public AlreadyExistsException() {
    }
}
