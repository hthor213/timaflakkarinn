/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.action.Quantum;
import is.dimon.timaflakkarinn.Timaflakkarinn;

public class GuessQuantum
implements Quantum {
    private Timaflakkarinn timaflakkarinn;

    public synchronized void leap() {
        this.timaflakkarinn.showDialog2();
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }

    public GuessQuantum(Timaflakkarinn timaflakkarinn) {
        this.timaflakkarinn = timaflakkarinn;
    }
}
