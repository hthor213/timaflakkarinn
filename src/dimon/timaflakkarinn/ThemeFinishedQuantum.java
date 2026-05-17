/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.action.Quantum;
import is.dimon.timaflakkarinn.Timaflakkarinn;

public class ThemeFinishedQuantum
implements Quantum {
    private Timaflakkarinn reactor;

    public void setFinishingReactor(Timaflakkarinn timaflakkarinn) {
        this.reactor = timaflakkarinn;
    }

    public synchronized void leap() {
        this.reactor.themeFinished();
    }

    public synchronized void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
