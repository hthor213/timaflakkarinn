/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Scene;
import is.dimon.agt.event.AGTEventMulticaster;
import is.dimon.agt.event.FreezeEvent;
import is.dimon.agt.event.FreezeListener;
import is.dimon.agt.event.WorldSceneChangeEvent;
import is.dimon.agt.event.WorldSceneChangeListener;
import is.dimon.nemesis.common.AlreadyExistsException;
import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.common.NotAvailableException;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.Display;
import is.dimon.nemesis.draw.Draw;
import is.dimon.nemesis.draw.ScreenMode;
import is.dimon.nemesis.sound.SndFormat;
import is.dimon.nemesis.sound.Sound;

public class World
extends Thread {
    public static final long DEFAULT_REFRESH_RATE = 25L;
    private static Draw draw = null;
    private static Sound sound = null;
    private static Display display = null;
    private Scene currentScene;
    private long refreshRate = 25L;
    transient WorldSceneChangeListener worldSceneChangeListener;
    transient FreezeListener freezeListener;
    private BitBuffer backBuffer = null;
    private boolean exit = false;
    boolean paint = true;

    public void setPaint(boolean bl) {
        this.paint = bl;
    }

    public void run() {
        while (!this.exit) {
            if (this.paint) {
                this.repaint();
            }
            Thread.yield();
        }
    }

    public void setCurrentScene(Scene scene) {
        System.out.println("SetCurrentScene about to start");
        if (this.currentScene != null) {
            this.currentScene.offStage();
        }
        this.currentScene = scene;
        this.backBuffer.clearToBlack();
        display.flip(true);
        this.backBuffer.clearToBlack();
        display.flip(true);
        this.backBuffer.clearToBlack();
        display.flip(true);
        if (scene != null) {
            scene.onStage();
        }
        this.processWorldSceneChangeEvent(new WorldSceneChangeEvent(this, 0, scene));
        System.out.println("SetCurrentScene finished");
    }

    public void repaint() {
        if (this.currentScene == null) {
            return;
        }
        if (!this.currentScene.paint(this.backBuffer)) {
            return;
        }
        display.flip(true);
    }

    public Scene getCurrentScene() {
        return this.currentScene;
    }

    public BitBuffer getBackBuffer() {
        return this.backBuffer;
    }

    public synchronized void addWorldSceneChangeListener(WorldSceneChangeListener worldSceneChangeListener) {
        this.worldSceneChangeListener = AGTEventMulticaster.add(this.worldSceneChangeListener, worldSceneChangeListener);
    }

    public synchronized void removeWorldSceneChangeListener(WorldSceneChangeListener worldSceneChangeListener) {
        this.worldSceneChangeListener = AGTEventMulticaster.remove(this.worldSceneChangeListener, worldSceneChangeListener);
    }

    protected void processWorldSceneChangeEvent(WorldSceneChangeEvent worldSceneChangeEvent) {
        if (this.worldSceneChangeListener != null) {
            this.worldSceneChangeListener.worldChangesScene(worldSceneChangeEvent);
        }
    }

    public synchronized void addFreezeListener(FreezeListener freezeListener) {
        this.freezeListener = AGTEventMulticaster.add(this.freezeListener, freezeListener);
    }

    public synchronized void removeFreezeListener(FreezeListener freezeListener) {
        this.freezeListener = AGTEventMulticaster.remove(this.freezeListener, freezeListener);
    }

    protected void processFreezeEvent(FreezeEvent freezeEvent) {
        if (this.freezeListener != null) {
            this.freezeListener.freeze(freezeEvent);
        }
    }

    protected void processThawEvent(FreezeEvent freezeEvent) {
        if (this.freezeListener != null) {
            this.freezeListener.thaw(freezeEvent);
        }
    }

    public void freeze() {
        this.processFreezeEvent(new FreezeEvent(this, 0));
    }

    public void thaw() {
        this.processThawEvent(new FreezeEvent(this, 1));
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void shutDown() {
        this.exit = true;
        try {
            this.join();
        }
        catch (InterruptedException interruptedException) {
        }
        draw.shutDown();
        System.out.println("exiting from shutdown");
        System.exit(0);
    }

    protected void finalize() {
        draw.shutDown();
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public World() {
        ScreenMode screenMode;
        System.runFinalizersOnExit(true);
        this.setName("theWorldThread");
        boolean bl = false;
        try {
            bl = Nemesis.init();
        }
        catch (AlreadyExistsException alreadyExistsException) {
            System.err.println("Nemesis already initialized!\n");
            return;
        }
        if (!bl) {
            System.out.println("Exiting from world 1");
            System.exit(0);
        }
        try {
            draw = new Draw();
        }
        catch (AlreadyExistsException alreadyExistsException) {
            System.err.println("Draw already exists!");
            System.err.println(alreadyExistsException.toString());
            System.exit(0);
        }
        try {
            sound = new Sound();
        }
        catch (AlreadyExistsException alreadyExistsException) {
            System.err.println("Sound already exists!");
            System.err.println(alreadyExistsException.toString());
            System.exit(0);
        }
        display = draw.getDisplay();
        if (display == null) {
            System.err.println("Display is null! Bummer!");
            System.exit(0);
        }
        if (display.setScreenMode(screenMode = new ScreenMode(800, 600, 16, 0, 0)) != 0) {
            Nemesis.stop();
            System.out.println("Exiting from world 2");
            System.exit(0);
        }
        display.setBuffering(2);
        try {
            draw.startUp();
        }
        catch (NotAvailableException notAvailableException) {
            System.err.println("Ouch! Says we can't have display 'coz somebody already has it!");
            Nemesis.stop();
            System.exit(0);
        }
        System.err.println("Graphics system started up.");
        try {
            sound.startUp();
            sound.setSndFormat(new SndFormat(22050, 16, 1));
        }
        catch (NotAvailableException notAvailableException) {
            System.err.println("Ouch! Says we can't have the sound stuff 'coz somebody already has it!");
            System.exit(0);
        }
        this.backBuffer = display.getBackBuffer();
        if (this.backBuffer == null) {
            System.err.println("Back buffer is null! Bummer!.");
            System.exit(0);
        }
        this.backBuffer.clearToBlack();
        display.flip(true);
        this.start();
    }
}
