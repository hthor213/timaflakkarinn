/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.action.Quantum;
import is.dimon.timaflakkarinn.StateController;

public class SwitchStateQuantum
implements Quantum {
    int state;
    StateController sc;

    public void setState(int n) {
        this.state = n;
    }

    public void setStateController(StateController stateController) {
        this.sc = stateController;
    }

    public synchronized void leap() {
        this.sc.setState(this.state);
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
