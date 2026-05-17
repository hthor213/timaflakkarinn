/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.AnimatedActorFace;
import is.dimon.agt.FaceSwitcher;
import is.dimon.agt.MovingActor;

public class Walker
implements FaceSwitcher {
    public void switchFace(MovingActor movingActor) {
        String string;
        if (this.isStateDeclared(movingActor.getState()) && !(string = this.getStateFromDegree(movingActor.getCourse())).equals(movingActor.getState())) {
            if (movingActor.getState().indexOf(50) == -1) {
                String string2 = movingActor.getState() + "2" + string;
                if (movingActor.getFace(string2) != null) {
                    movingActor.setState(string2);
                } else {
                    movingActor.setState(string);
                }
            } else if (movingActor.getCourse() != 10.0) {
                if (((AnimatedActorFace)((Object)movingActor.getFace(movingActor.getState()))).getCurrentRepetition() == 0) {
                    movingActor.setState(string);
                }
            } else {
                movingActor.setState(string);
            }
        }
    }

    private String getStateFromDegree(double d) {
        if (d == 10.0) {
            return "stop";
        }
        if (d < -2.356194490192345) {
            return "left";
        }
        if (d < -0.7853981633974483) {
            return "front";
        }
        if (d < 0.7853981633974483) {
            return "right";
        }
        if (d < 2.356194490192345) {
            return "back";
        }
        return "left";
    }

    public boolean isStateDeclared(String string) {
        if (string.equals("stop")) {
            return true;
        }
        if (string.equals("front")) {
            return true;
        }
        if (string.equals("back")) {
            return true;
        }
        if (string.equals("left")) {
            return true;
        }
        if (string.equals("right")) {
            return true;
        }
        return string.indexOf(50) != -1;
    }
}
