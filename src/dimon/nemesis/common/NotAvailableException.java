/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

public class NotAvailableException
extends Exception {
    private String errorMsg;

    public String toString() {
        return this.errorMsg;
    }

    public NotAvailableException(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public NotAvailableException() {
    }
}
