/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.ActorMouth;
import is.dimon.agt.action.Quantum;

public class FadeQuantum
implements Quantum {
    boolean finished;
    ActorMouth mouth;
    float goalVolume;
    int speed = 10;

    public void setMouth(ActorMouth actorMouth) {
        this.mouth = actorMouth;
    }

    public void setGoalVolume(float f) {
        this.goalVolume = f;
    }

    public void setSpeed(int n) {
        this.speed = n;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public synchronized void leap() {
        block8: {
            block9: {
                this.finished = false;
                var1_1 = this.mouth.getVolume();
                if (var1_1 == this.goalVolume) {
                    return;
                }
                var2_2 = 0.0f;
                if (!(var1_1 - this.goalVolume > 0.0f)) break block9;
                var2_2 = -5.0f;
                var3_3 = var1_1;
                if (true) ** GOTO lbl25
            }
            var2_2 = 5.0f;
            var3_4 = var1_1;
            if (true) ** GOTO lbl38
            do {
                this.mouth.setVolume(var3_3);
                try {
                    Thread.currentThread();
                    Thread.sleep(this.speed);
                }
                catch (InterruptedException var4_5) {
                }
                if (this.finished) break block8;
                var3_3 += var2_2;
lbl25:
                // 2 sources

            } while (var3_3 > this.goalVolume);
            break block8;
            do {
                this.mouth.setVolume(var3_4);
                try {
                    Thread.currentThread();
                    Thread.sleep(this.speed);
                }
                catch (InterruptedException var4_6) {
                }
                if (this.finished) break;
                var3_4 += var2_2;
lbl38:
                // 2 sources

            } while (var3_4 < this.goalVolume);
        }
        this.mouth.setVolume(this.goalVolume);
    }

    public void tunnel() {
        this.mouth.setVolume(this.goalVolume);
    }

    public void finish() {
        this.finished = true;
    }
}
