/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.action;

import is.dimon.agt.action.Groups;
import is.dimon.agt.action.SuperQuantum;
import is.dimon.util.Iterator;

public class GroupObjectQuantum
implements SuperQuantum {
    private boolean add = true;
    private String destinationGroupName;
    private Object object;
    private String groupName;

    public void setDestinationGroupName(String string) {
        this.destinationGroupName = string;
    }

    public String getDestinationGroupName() {
        return this.destinationGroupName;
    }

    public void setGroupName(String string) {
        this.groupName = string;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public Object getObject() {
        return this.object;
    }

    public void setAdd(boolean bl) {
        this.add = bl;
    }

    public boolean getAdd() {
        return this.add;
    }

    public void leap() {
        block7: {
            if (this.object != null) {
                if (this.add) {
                    Groups.add(this.destinationGroupName, this.object);
                } else {
                    boolean bl = Groups.remove(this.destinationGroupName, this.object);
                }
            }
            if (this.groupName == null) break block7;
            if (this.add) {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    Groups.add(this.destinationGroupName, iterator.next());
                }
            } else {
                Iterator iterator = Groups.iterator(this.groupName);
                while (iterator.hasNext()) {
                    boolean bl = Groups.remove(this.destinationGroupName, iterator.next());
                }
            }
        }
    }

    public void tunnel() {
        this.leap();
    }

    public void finish() {
    }
}
