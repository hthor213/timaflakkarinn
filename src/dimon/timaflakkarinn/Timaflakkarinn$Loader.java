/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.timaflakkarinn.Timaflakkarinn;

private class Timaflakkarinn.Loader
extends Thread {
    private String[] saveinfo;
    private int flag;

    public Timaflakkarinn.Loader() {
        Timaflakkarinn.this = Timaflakkarinn.this;
    }

    public void doLoad(int n, String[] stringArray) {
        this.flag = n;
        this.saveinfo = stringArray;
        if (!this.isAlive()) {
            this.start();
        }
        this.resume();
    }

    public void run() {
        while (true) {
            Timaflakkarinn.access$1((Timaflakkarinn)Timaflakkarinn.this, (boolean)false);
            if (this.flag == 0) {
                Timaflakkarinn.this.currentScreen = Integer.parseInt(this.saveinfo[0]);
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.parseStoryPage(Timaflakkarinn.this.currentScreen);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.access$1((Timaflakkarinn)Timaflakkarinn.this, (boolean)true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.ttParser.parseGMLFile(this.saveinfo[1]);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence(this.saveinfo[2], true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_always", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_prepare", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.ttParser.currentSC.setState(1);
                }
            } else if (this.flag == 1) {
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.access$1((Timaflakkarinn)Timaflakkarinn.this, (boolean)true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.ttParser.parseGMLFile(this.saveinfo[1]);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence(this.saveinfo[2], true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_always", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_prepare", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.ttParser.currentSC.setState(1);
                }
            } else if (this.flag == 2) {
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.parseStoryPage(Timaflakkarinn.this.currentScreen);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.access$1((Timaflakkarinn)Timaflakkarinn.this, (boolean)true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_always", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_prepare", true);
                }
                if (!Timaflakkarinn.access$2((Timaflakkarinn)Timaflakkarinn.this)) {
                    Timaflakkarinn.this.performSequence("s_begin", false);
                }
            }
            this.suspend();
        }
    }
}
