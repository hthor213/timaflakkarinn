/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt.event;

import is.dimon.agt.Scene;
import is.dimon.agt.event.AGTEvent;

public class WorldSceneChangeEvent
extends AGTEvent {
    private Scene newScene;

    public Scene getScene() {
        return this.newScene;
    }

    public WorldSceneChangeEvent(Object object, int n, Scene scene) {
        super(object, n);
        this.newScene = scene;
    }
}
