/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.Quantum;

public class MethodQuantum
implements Quantum {
    private String method;
    private Class[] args;
    private Object callee;

    public void setMethodName(String string, Class[] classArray) throws NoSuchMethodException {
        this.method = string;
        this.args = classArray;
    }

    public void setCallee(String string) throws ClassNotFoundException {
        this.callee = Class.forName(string);
    }

    public Object getCallee() {
        return this.callee;
    }

    public void leap() {
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
