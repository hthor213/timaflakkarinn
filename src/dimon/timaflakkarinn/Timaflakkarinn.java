/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.CelledAnimated2DActorFace;
import is.dimon.agt.CursorFace;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Killable;
import is.dimon.agt.Preparable;
import is.dimon.agt.Pulser;
import is.dimon.agt.Scene;
import is.dimon.agt.SimplePseudo3DTerrain;
import is.dimon.agt.StaticActor;
import is.dimon.agt.StaticActorFace;
import is.dimon.agt.Terrain;
import is.dimon.agt.TextActorFace;
import is.dimon.agt.World;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.Sequence;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.agt.event.FreezeListener;
import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.common.Volume;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.Color24;
import is.dimon.nemesis.input.KeyEvent;
import is.dimon.nemesis.input.KeyListener;
import is.dimon.timaflakkarinn.Saver;
import is.dimon.timaflakkarinn.TTParser;
import is.dimon.util.Enumeration;
import is.dimon.util.Hashtable;
import is.dimon.util.Vector;
import java.awt.Polygon;
import java.awt.Rectangle;
import java.io.File;

public class Timaflakkarinn
extends Thread
implements ActorMouseListener,
KeyListener {
    static Timaflakkarinn timaflakkarinn = null;
    public static final int NORMAL = 1;
    public static final int HILITE = 2;
    public static final int INTRO = 0;
    public static final int MAIN_MENU = 1;
    public static final int LANDNAM = 2;
    public static final int KRISTNITAKA = 3;
    public static final int SIDASKIPTI = 4;
    public static final int TYRKJARAN = 5;
    public static final int EXTRO = 6;
    private static final int LOAD = 0;
    private static final int SAVE = 1;
    private static final int NOTHING = 2;
    private static final int QUIT = 3;
    World world;
    Hashtable screenContainer;
    Hashtable tempContainer;
    int currentScreen = 0;
    String gmlPath;
    String resourcePath;
    TTParser ttParser;
    String sep;
    boolean[] parsed;
    long counter = 0L;
    int screenToDisplay;
    private Object runLock;
    private Pulser pulser;
    private CursorFace normal;
    private CursorFace hilite;
    private int game;
    private boolean ff = false;
    private boolean eff = false;
    private boolean introOn = true;
    private boolean extroOn = false;
    private boolean gameIntroDone = false;
    private boolean mainIntroDone = false;
    private int flag;
    private String[] saveInfo;
    private Scene waitScene;
    private Scene saveScene;
    private Saver mySaver;
    Scene blackScene;
    private boolean loaded;
    private Vector saveActors;
    private StaticActor quitActor;
    private StaticActor loadActor;
    private StaticActor saveActor;
    private StaticActor gameActor;
    private Actor selectedActor;
    private StaticActor yesActor;
    private StaticActor noActor;
    private StaticActor okActor;
    private StaticActor displayTextActor;
    private StaticActor textInputActor;
    private StaticActor dialogActor;
    private StaticActor dialogActor2;
    private StaticActor textInputActor2;
    private StaticActor displayTextActor2;
    private StaticActorFace dialogFace2;
    private StaticActorFace saveBack;
    private StaticActorFace dialogFace;
    private TextActorFace textInputFace2;
    private TextActorFace displayTextFace2;
    private Scene gameScene;
    private int mode;
    private boolean input = false;
    private boolean input2 = false;
    private boolean init2 = false;
    private SimplePseudo3DTerrain saveTerrain;

    public static Timaflakkarinn getCurrentTimaflakkarinn() {
        return timaflakkarinn;
    }

    private void initialize() {
        this.toBlack();
        this.ttParser.setContainer(this.screenContainer);
        this.ttParser.parseGMLFile("intro");
        this.parsed[0] = true;
        this.loaded = true;
        System.gc();
        if (!this.ff) {
            this.performSequence("s_always", true);
        }
        if (!this.ff) {
            this.performSequence("s_prepare", true);
        }
        if (!this.ff) {
            this.performSequence("s_begin", true);
        }
        this.performSequence("s_end", true);
        this.introOn = false;
    }

    public void performSequence(String string, boolean bl) {
        if (bl) {
            ((Sequence)this.screenContainer.get(string)).perform(Thread.currentThread());
            this.hold(0L);
        } else {
            ((Sequence)this.screenContainer.get(string)).perform();
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void hold(long l) {
        if (l <= 0L) {
            Timaflakkarinn timaflakkarinn = this;
            synchronized (timaflakkarinn) {
                try {
                    this.wait();
                }
                catch (InterruptedException interruptedException) {
                }
                return;
            }
        }
        Timaflakkarinn timaflakkarinn = this;
        synchronized (timaflakkarinn) {
            try {
                this.wait(l);
            }
            catch (InterruptedException interruptedException) {
            }
            return;
        }
    }

    World getWorld() {
        return this.world;
    }

    public void themeFinished() {
        if (this.currentScreen == 0 || this.currentScreen == 6) {
            this.screenToDisplay = 1;
            this.flag = 0;
        } else {
            this.screenToDisplay = this.currentScreen + 1;
            this.flag = 0;
        }
        if (!this.isAlive()) {
            this.start();
        } else {
            Object object = this.runLock;
            synchronized (object) {
                this.runLock.notify();
            }
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void run() {
        while (true) {
            this.displayScreen2();
            Object object = this.runLock;
            synchronized (object) {
                try {
                    System.out.println("About to wait on runlock");
                    this.runLock.wait();
                }
                catch (InterruptedException interruptedException) {
                }
            }
        }
    }

    public void handleKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getID() == 401) {
            this.keyPressed(keyEvent);
        } else if (keyEvent.getID() == 400) {
            this.keyTyped(keyEvent);
        }
    }

    private void doExtro() {
        this.ttParser.parseGMLFile("extro");
        this.parsed[6] = true;
        System.gc();
        if (!this.eff) {
            this.performSequence("s_always", true);
        }
        if (!this.eff) {
            this.performSequence("s_prepare", true);
        }
        if (!this.eff) {
            this.performSequence("s_begin", true);
        }
        this.extroOn = false;
        this.performSequence("s_end", false);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void displayScreen2() {
        this.toBlack();
        if (this.flag == 0) {
            this.world.setCurrentScene(this.waitScene);
            Scene.setCursorFace(null);
            try {
                this.performSequence("s_final", true);
            }
            catch (NullPointerException nullPointerException) {
            }
            this.clearContainer(this.screenContainer);
            this.parsed[this.currentScreen] = false;
            this.currentScreen = this.screenToDisplay;
            if (this.currentScreen == 6) {
                this.extroOn = true;
                this.doExtro();
                return;
            }
            if (this.currentScreen != 1) {
                this.parseStoryPage(this.currentScreen);
                this.performSequence("s_always", true);
                this.performSequence("s_prepare", true);
                this.performSequence("s_begin", true);
                return;
            }
            this.displaySaver(0);
            return;
        }
        if (this.flag == 1) {
            System.out.println("About to load between scenes");
            this.world.setCurrentScene(this.waitScene);
            System.out.println("jUST SET waitscene");
            try {
                this.performSequence("s_final", true);
            }
            catch (NullPointerException nullPointerException) {
            }
            System.out.println("About to clearContainer");
            this.clearContainer(this.screenContainer);
            this.parsed[this.currentScreen] = false;
            this.currentScreen = this.getScreenFromName(this.saveInfo[0]);
            System.out.println("About to parseStoryPage");
            this.parseStoryPage(this.currentScreen);
            this.loaded = true;
            System.out.println("About to parse save info");
            this.ttParser.parseGMLFile(this.saveInfo[1]);
            this.performSequence(this.saveInfo[2], true);
            this.performSequence("s_always", true);
            this.performSequence("s_prepare", true);
            this.ttParser.currentSC.setState(1);
            return;
        }
        if (this.flag != 2) return;
        this.world.setCurrentScene(this.waitScene);
        this.loaded = true;
        try {
            this.performSequence("s_final", true);
        }
        catch (NullPointerException nullPointerException) {
        }
        this.ttParser.parseGMLFile(this.saveInfo[1]);
        this.performSequence(this.saveInfo[2], true);
        this.performSequence("s_always", true);
        this.performSequence("s_prepare", true);
        this.ttParser.currentSC.setState(1);
    }

    void clearContainer(Hashtable hashtable) {
        if (hashtable == this.screenContainer) {
            Groups.clearAll();
        }
        Enumeration enumeration = hashtable.elements();
        while (enumeration.hasMoreElements()) {
            Object object = enumeration.nextElement();
            if (this.ttParser.currentSC != null && object instanceof Actor) {
                ((Actor)object).removeActorMouseListener(this.ttParser.currentSC);
            }
            if (object instanceof Preparable) {
                ((Preparable)object).unprepare();
            }
            if (object instanceof FreezeListener) {
                this.world.removeFreezeListener((FreezeListener)object);
            }
            if (!(object instanceof Killable)) continue;
            ((Killable)object).kill();
        }
        hashtable.clear();
        if (this.ttParser.currentSC != null) {
            this.ttParser.currentSC.kill();
        }
        this.ttParser.currentSC = null;
        this.mySaver.clear();
        System.gc();
        this.init2 = false;
    }

    void toBlack() {
        this.world.setCurrentScene(this.blackScene);
    }

    void setCursorFace(int n) {
        if (n == 1) {
            Scene.setCursorFace(this.normal);
        } else if (n == 2) {
            Scene.setCursorFace(this.hilite);
        }
    }

    void parseStoryPage(int n) {
        this.ttParser.setContainer(this.screenContainer);
        String string = null;
        switch (n) {
            case 2: {
                string = "landnam";
                break;
            }
            case 3: {
                string = "kristnit";
                break;
            }
            case 4: {
                string = "sidaskip";
                break;
            }
            case 5: {
                string = "tyrkran";
                break;
            }
            case 6: {
                string = "extro";
                break;
            }
        }
        if (this.ttParser.currentSC != null) {
            this.ttParser.currentSC.kill();
            this.ttParser.currentSC = null;
        }
        this.ttParser.parseGMLFile(string);
        this.parsed[n] = true;
    }

    String getThemeName(int n) {
        switch (n) {
            case 2: {
                return "landnam";
            }
            case 3: {
                return "kristnit";
            }
            case 4: {
                return "sidaskip";
            }
            case 5: {
                return "tyrkran";
            }
            case 6: {
                return "extro";
            }
        }
        return "";
    }

    private int getScreenFromName(String string) {
        if (string.equals("landnam")) {
            return 2;
        }
        if (string.equals("kristnit")) {
            return 3;
        }
        if (string.equals("sidaskip")) {
            return 4;
        }
        if (string.equals("tyrkran")) {
            return 5;
        }
        if (string.equals("extro")) {
            return 6;
        }
        return 2;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public static void main(String[] stringArray) {
        String string = System.getProperty("gmlPath");
        String string2 = System.getProperty("resourcePath");
        try {
            System.loadLibrary("Nemesis");
        }
        catch (SecurityException securityException) {
            System.err.println("Strange security error!");
            System.exit(0);
        }
        catch (UnsatisfiedLinkError unsatisfiedLinkError) {
            System.err.println("Can't find Nemesis library in path");
            System.exit(0);
        }
        catch (Exception exception) {
            System.err.println("Unexpected exception: " + exception);
        }
        if (string == null) {
            System.out.println("No gmlPath set, using application path");
            string = Nemesis.getPathToNemesis() + "gml" + File.separator;
        }
        if (string2 == null) {
            System.out.println("No resourcePath set, looking for CD");
            Volume[] volumeArray = Nemesis.getVolumes();
            int n = 0;
            while (n < volumeArray.length) {
                try {
                    String string3 = volumeArray[n].getName().toLowerCase();
                    if (string3.equals("flakkari") && (volumeArray[n].getType() == 3 || volumeArray[n].getType() == 0)) {
                        string2 = volumeArray[n].getPath() + "game";
                    }
                }
                catch (NullPointerException nullPointerException) {
                }
                ++n;
            }
            if (string2 == null) {
                System.out.println("No cd in drive");
                System.exit(0);
            }
        }
        System.out.println("gmlPath is " + string);
        System.out.println("resourcePath is " + string2);
        timaflakkarinn = new Timaflakkarinn(string, string2);
    }

    public void keyPressed(KeyEvent keyEvent) {
        if (this.introOn) {
            if (this.ff) {
                return;
            }
            if (keyEvent.getKeyCode() == 32 || keyEvent.getKeyCode() == 13 || keyEvent.getKeyCode() == 112) {
                this.ff = true;
                Sequence sequence = (Sequence)this.screenContainer.get("s_begin");
                if (sequence != null) {
                    sequence.stopPerforming();
                }
                Thread.currentThread();
                Thread.yield();
            }
            return;
        }
        if (this.extroOn) {
            if (this.eff) {
                return;
            }
            if (keyEvent.getKeyCode() == 32 || keyEvent.getKeyCode() == 13 || keyEvent.getKeyCode() == 112) {
                this.eff = true;
                Sequence sequence = (Sequence)this.screenContainer.get("s_begin");
                if (sequence != null) {
                    sequence.stopPerforming();
                }
                Thread.currentThread();
                Thread.yield();
            }
            return;
        }
        if (keyEvent.getKeyCode() == 112) {
            if (this.world.getCurrentScene() == this.saveScene || this.world.getCurrentScene().getName().equals("s_Inventory")) {
                return;
            }
            if (this.world.getCurrentScene() == null || this.world.getCurrentScene() == this.waitScene) {
                return;
            }
            if (this.ttParser.currentSC.getState() != 4 && this.ttParser.currentSC.getState() != 6 && this.ttParser.currentSC.getState() != 5) {
                this.ttParser.currentSC.setState(4);
                this.displaySaver(1);
                return;
            }
            return;
        }
        if (this.input) {
            if (keyEvent.getKeyCode() == 8 || keyEvent.getKeyCode() == 127) {
                TextActorFace textActorFace = (TextActorFace)this.textInputActor.getFace("stop");
                Rectangle rectangle = textActorFace.getBounds();
                String string = new String(textActorFace.getText());
                if (string.length() != 0) {
                    string = string.substring(0, string.length() - 1);
                }
                textActorFace.setText(string);
                return;
            }
            if (keyEvent.getKeyCode() == 13) {
                this.doSave();
                return;
            }
        } else if (this.input2) {
            if (keyEvent.getKeyCode() == 8 || keyEvent.getKeyCode() == 127) {
                Rectangle rectangle = this.textInputFace2.getBounds();
                String string = new String(this.textInputFace2.getText());
                if (string.length() != 0) {
                    string = string.substring(0, string.length() - 1);
                }
                this.textInputFace2.setText(string);
                return;
            }
            if (keyEvent.getKeyCode() == 13) {
                this.hideDialog2();
                String string = new String(this.textInputFace2.getText());
                if (string.equalsIgnoreCase("erna")) {
                    this.performSequence("s_GuessCorrect", false);
                } else {
                    this.performSequence("s_GuessWrong", false);
                }
            }
        }
    }

    private void doSave() {
        Scene.setCursorFace(null);
        this.world.setCurrentScene(this.waitScene);
        this.hideDialog();
        String string = new String(((TextActorFace)this.textInputActor.getFace("stop")).getText());
        int n = this.saveActors.indexOf(this.selectedActor);
        this.mySaver.save(this.getThemeName(this.currentScreen), string, this.gameScene.getName(), n + 1);
        String string2 = "Leikur " + (n + 1);
        while (string2.length() < 20) {
            string2 = string2.concat(" ");
        }
        string2 = string2.concat(string);
        ((TextActorFace)this.selectedActor.getFace("stop")).setText(string2);
        this.performSequence("s_prepare", true);
        this.saveBack.unprepare();
        this.dialogFace.unprepare();
        this.ttParser.currentSC.setState(1);
    }

    public void keyTyped(KeyEvent keyEvent) {
        if (this.charNotAllowed(keyEvent.getKeyChar())) {
            return;
        }
        if (this.input) {
            TextActorFace textActorFace = (TextActorFace)this.textInputActor.getFace("stop");
            Rectangle rectangle = textActorFace.getBounds();
            if (rectangle.width > 300) {
                return;
            }
            String string = new String(textActorFace.getText());
            string = string.concat(String.valueOf(keyEvent.getKeyChar()));
            textActorFace.setText(string);
            rectangle = textActorFace.getBounds();
            return;
        }
        if (this.input2) {
            Rectangle rectangle = this.textInputFace2.getBounds();
            if (rectangle.width > 150) {
                return;
            }
            String string = new String(this.textInputFace2.getText());
            string = string.concat(String.valueOf(keyEvent.getKeyChar()));
            this.textInputFace2.setText(string);
            rectangle = this.textInputFace2.getBounds();
        }
    }

    public boolean charNotAllowed(char c) {
        char c2 = c;
        if (c2 > '\u001f' && c2 < '\u007f') {
            return false;
        }
        switch (c2) {
            case '\u00c1': 
            case '\u00c6': 
            case '\u00c9': 
            case '\u00cd': 
            case '\u00d0': 
            case '\u00d3': 
            case '\u00d6': 
            case '\u00da': 
            case '\u00dd': 
            case '\u00de': 
            case '\u00e1': 
            case '\u00e6': 
            case '\u00e9': 
            case '\u00ed': 
            case '\u00f0': 
            case '\u00f3': 
            case '\u00f6': 
            case '\u00fa': 
            case '\u00fd': 
            case '\u00fe': {
                return false;
            }
        }
        return true;
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void initializeActors() {
        this.waitScene = new Scene(this.world);
        this.waitScene.setName("waitScene");
        this.waitScene.setBackgroundColor(new Color24(0, 0, 0));
        var1_1 = new Polygon();
        var1_1.addPoint(0, 0);
        var1_1.addPoint(0, 600);
        var1_1.addPoint(800, 600);
        var1_1.addPoint(800, 0);
        var2_2 = new SimplePseudo3DTerrain(this.waitScene, var1_1, 5000, 5500);
        var3_3 = new StaticActorFace();
        var3_3.setBaseImage(this.resourcePath + this.sep + "common" + this.sep + "graphic" + this.sep + "wait.png");
        var3_3.prepare();
        var4_4 = new StaticActor();
        var4_4.setFace(var3_3, "stop");
        var4_4.setState("stop");
        var4_4.setTerrain(var2_2);
        try {
            var4_4.setLocation(260.0f, 5300.0f, 5000.0f);
        }
        catch (InvalidPositionException var5_5) {
        }
        var5_6 = new CelledAnimated2DActorFace(this.pulser, 8);
        var5_6.setBaseImage(this.resourcePath + this.sep + "common" + this.sep + "graphic" + this.sep + "klukka.png");
        var5_6.setRepeatCount(-1);
        var5_6.setAnimationSpeed(375);
        var5_6.prepare();
        var6_7 = new StaticActor();
        var6_7.setFace(var5_6, "stop");
        var6_7.setState("stop");
        var6_7.setTerrain(var2_2);
        try {
            var6_7.setLocation(330.0f, 5220.0f, 5000.0f);
        }
        catch (InvalidPositionException var7_8) {
        }
        this.saveScene = new Scene(this.world);
        this.saveScene.setName("saveScene");
        this.saveTerrain = new SimplePseudo3DTerrain(this.saveScene, var1_1, 3000, 5000);
        this.saveBack = new StaticActorFace();
        this.saveBack.setBaseImage(this.resourcePath + this.sep + "common" + this.sep + "graphic" + this.sep + "saveload.png");
        var7_9 = new StaticActor();
        var7_9.setFace(this.saveBack, "stop");
        var7_9.setState("stop");
        var7_9.setTerrain(this.saveTerrain);
        try {
            var7_9.setLocation(0.0f, 3000.0f, 3000.0f);
        }
        catch (InvalidPositionException var8_10) {
        }
        var8_11 = new TextActorFace();
        var8_11.setColor(new Color24(255, 255, 255));
        var8_11.setText("H\u00e6tta");
        var8_11.prepare();
        this.quitActor = new StaticActor();
        this.quitActor.setFace(var8_11, "stop");
        this.quitActor.setState("stop");
        var8_11.setHighlighted(true);
        this.quitActor.setTerrain(this.saveTerrain);
        try {
            this.quitActor.setLocation(460.0f, 3095.0f, 3000.0f);
        }
        catch (InvalidPositionException var9_12) {
        }
        this.quitActor.addActorMouseListener(this);
        var9_13 = new TextActorFace();
        var9_13.setColor(new Color24(255, 255, 255));
        var9_13.setText("Til baka");
        var9_13.prepare();
        this.gameActor = new StaticActor();
        this.gameActor.setFace(var9_13, "stop");
        this.gameActor.setState("stop");
        var9_13.setHighlighted(true);
        this.gameActor.setTerrain(this.saveTerrain);
        try {
            this.gameActor.setLocation(610.0f, 3095.0f, 3000.0f);
        }
        catch (InvalidPositionException var10_14) {
        }
        this.gameActor.addActorMouseListener(this);
        var10_15 = new TextActorFace();
        var10_15.setColor(new Color24(255, 255, 255));
        var10_15.setText("Vista leik");
        var10_15.prepare();
        this.saveActor = new StaticActor();
        this.saveActor.setFace(var10_15, "stop");
        this.saveActor.setState("stop");
        var10_15.setHighlighted(true);
        this.saveActor.setTerrain(this.saveTerrain);
        try {
            this.saveActor.setLocation(260.0f, 3095.0f, 3000.0f);
        }
        catch (InvalidPositionException var11_16) {
        }
        this.saveActor.addActorMouseListener(this);
        var11_17 = new TextActorFace();
        var11_17.setColor(new Color24(255, 255, 255));
        var11_17.setText("Opna leik");
        var11_17.prepare();
        this.loadActor = new StaticActor();
        this.loadActor.setFace(var11_17, "stop");
        this.loadActor.setState("stop");
        var11_17.setHighlighted(true);
        this.loadActor.setTerrain(this.saveTerrain);
        try {
            this.loadActor.setLocation(60.0f, 3095.0f, 3000.0f);
        }
        catch (InvalidPositionException var12_18) {
        }
        this.loadActor.addActorMouseListener(this);
        this.dialogFace = new StaticActorFace();
        this.dialogFace.setBaseImage(this.resourcePath + this.sep + "common" + this.sep + "graphic" + this.sep + "dialog.png");
        this.dialogActor = new StaticActor();
        this.dialogActor.setFace(this.dialogFace, "stop");
        this.dialogActor.setState("hide");
        this.dialogActor.setTerrain(this.saveTerrain);
        try {
            this.dialogActor.setLocation(165.0f, 4200.0f, 4000.0f);
        }
        catch (InvalidPositionException var12_19) {
        }
        var12_20 = new TextActorFace();
        var12_20.setColor(new Color24(255, 255, 255));
        var12_20.setText(" ");
        var12_20.prepare();
        this.displayTextActor = new StaticActor();
        this.displayTextActor.setFace(var12_20, "stop");
        this.displayTextActor.setState("hide");
        this.displayTextActor.setTerrain(this.saveTerrain);
        try {
            this.displayTextActor.setLocation(220.0f, 4720.0f, 4500.0f);
        }
        catch (InvalidPositionException var13_21) {
        }
        var13_22 = new TextActorFace();
        var13_22.setColor(new Color24(255, 255, 255));
        var13_22.setText("\u00cd lagi!");
        var13_22.setHighlighted(true);
        var13_22.prepare();
        this.okActor = new StaticActor();
        this.okActor.setFace(var13_22, "stop");
        this.okActor.setState("hide");
        this.okActor.setTerrain(this.saveTerrain);
        try {
            this.okActor.setLocation(370.0f, 4880.0f, 4500.0f);
        }
        catch (InvalidPositionException var14_23) {
        }
        this.okActor.addActorMouseListener(this);
        var14_24 = new TextActorFace();
        var14_24.setColor(new Color24(255, 255, 255));
        var14_24.setText("\u00cd lagi!");
        var14_24.setHighlighted(true);
        var14_24.prepare();
        this.yesActor = new StaticActor();
        this.yesActor.setFace(var14_24, "stop");
        this.yesActor.setState("hide");
        this.yesActor.setTerrain(this.saveTerrain);
        try {
            this.yesActor.setLocation(240.0f, 4880.0f, 4500.0f);
        }
        catch (InvalidPositionException var15_25) {
        }
        this.yesActor.addActorMouseListener(this);
        var15_26 = new TextActorFace();
        var15_26.setColor(new Color24(255, 255, 255));
        var15_26.setText("H\u00e6tta vi\u00f0!");
        var15_26.setHighlighted(true);
        var15_26.prepare();
        this.noActor = new StaticActor();
        this.noActor.setFace(var15_26, "stop");
        this.noActor.setState("hide");
        this.noActor.setTerrain(this.saveTerrain);
        try {
            this.noActor.setLocation(430.0f, 4880.0f, 4500.0f);
        }
        catch (InvalidPositionException var16_27) {
        }
        this.noActor.addActorMouseListener(this);
        var16_28 = new TextActorFace();
        var16_28.setColor(new Color24(120, 190, 30));
        var16_28.setText("");
        var16_28.prepare();
        this.textInputActor = new StaticActor();
        this.textInputActor.setFace(var16_28, "stop");
        this.textInputActor.setState("hide");
        this.textInputActor.setTerrain(this.saveTerrain);
        try {
            this.textInputActor.setLocation(240.0f, 4800.0f, 4500.0f);
        }
        catch (InvalidPositionException var17_29) {
        }
        var17_30 = new TextActorFace[10];
        this.saveActors = new Vector(10);
        var20_31 = 0;
        while (var20_31 < 10) {
            block31: {
                block30: {
                    var17_30[var20_31] = new TextActorFace();
                    var17_30[var20_31].setColor(new Color24(120, 190, 30));
                    var19_33 = this.mySaver.getSaveInfo(var20_31 + 1);
                    if (var19_33 == null) break block30;
                    var21_34 = "Leikur " + (var20_31 + 1);
                    if (true) ** GOTO lbl207
                }
                var21_34 = "Leikur " + (var20_31 + 1);
                break block31;
                do {
                    var21_34 = var21_34.concat(" ");
lbl207:
                    // 2 sources

                } while (var21_34.length() < 20);
                var21_34 = var21_34.concat(var19_33[3]);
            }
            var17_30[var20_31].setText(var21_34);
            var17_30[var20_31].prepare();
            var18_32 = new StaticActor();
            var18_32.setFace(var17_30[var20_31], "stop");
            var18_32.setState("stop");
            var17_30[var20_31].setHighlighted(true);
            var18_32.setTerrain(this.saveTerrain);
            try {
                var18_32.setLocation(100.0f, 178 + var20_31 * 30 + 3000, 3000.0f);
            }
            catch (InvalidPositionException var22_35) {
            }
            var18_32.addActorMouseListener(this);
            this.saveActors.addElement(var18_32);
            ++var20_31;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void initial2() {
        this.dialogFace2 = new StaticActorFace();
        this.dialogFace2.setBaseImage(this.resourcePath + this.sep + "kristniA" + this.sep + "graphic" + this.sep + "dialog.png");
        this.dialogFace2.prepare();
        this.dialogActor2 = new StaticActor();
        this.dialogActor2.setFace(this.dialogFace2, "stop");
        try {
            this.dialogActor2.setLocation(165.0f, 4010.0f, 4000.0f);
        }
        catch (InvalidPositionException invalidPositionException) {
        }
        this.dialogActor2.setTerrain((Terrain)this.screenContainer.get("t_HjaVolvul"));
        this.dialogActor2.setState("hide");
        this.displayTextFace2 = new TextActorFace();
        this.displayTextFace2.setColor(new Color24(255, 255, 255));
        this.displayTextFace2.setText("Sl\u00e1\u00f0u inn nafn sei\u00f0konu!");
        this.displayTextFace2.prepare();
        this.displayTextActor2 = new StaticActor();
        this.displayTextActor2.setFace(this.displayTextFace2, "stop");
        this.displayTextActor2.setState("hide");
        try {
            this.displayTextActor2.setLocation(220.0f, 4540.0f, 4500.0f);
        }
        catch (InvalidPositionException invalidPositionException) {
        }
        this.displayTextActor2.setTerrain((Terrain)this.screenContainer.get("t_HjaVolvul"));
        this.displayTextActor2.setState("hide");
        this.textInputFace2 = new TextActorFace();
        this.textInputFace2.setColor(new Color24(120, 190, 30));
        this.textInputFace2.setText("");
        this.textInputActor2 = new StaticActor();
        this.textInputActor2.setFace(this.textInputFace2, "stop");
        this.textInputActor2.setState("hide");
        try {
            this.textInputActor2.setLocation(240.0f, 4610.0f, 4500.0f);
        }
        catch (InvalidPositionException invalidPositionException) {
        }
        this.textInputActor2.setTerrain((Terrain)this.screenContainer.get("t_HjaVolvul"));
        this.textInputFace2.prepare();
        this.init2 = true;
    }

    public void actorExited(AGTMouseEvent aGTMouseEvent) {
    }

    public void actorEntered(AGTMouseEvent aGTMouseEvent) {
    }

    void showDialog2() {
        if (!this.init2) {
            this.initial2();
        }
        this.textInputFace2.setText("");
        this.dialogActor2.setState("stop");
        this.textInputActor2.setState("stop");
        this.displayTextActor2.setState("stop");
        this.input2 = true;
    }

    private void hideDialog2() {
        this.input2 = false;
        this.dialogActor2.setState("hide");
        this.textInputActor2.setState("hide");
        this.displayTextActor2.setState("hide");
    }

    public void actorClicked(AGTMouseEvent aGTMouseEvent) {
        Actor actor = (Actor)aGTMouseEvent.getSource();
        int n = 0;
        while (n < 10) {
            if (actor == this.saveActors.elementAt(n)) {
                TextActorFace textActorFace;
                if (this.selectedActor != null) {
                    textActorFace = (TextActorFace)this.selectedActor.getFace("stop");
                    textActorFace.setColor(new Color24(120, 190, 30));
                    textActorFace.setHighlighted(true);
                }
                this.selectedActor = actor;
                textActorFace = (TextActorFace)actor.getFace("stop");
                textActorFace.setColor(new Color24(0, 0, 255));
                textActorFace.setHighlighted(false);
                return;
            }
            ++n;
        }
        if (actor == this.quitActor) {
            this.mode = 3;
            this.displayDialog("Vilt \u00fe\u00fa \u00f6rugglega h\u00e6tta \u00ed leiknum?", 1);
            return;
        }
        if (actor == this.saveActor) {
            if (this.selectedActor != null) {
                this.mode = 1;
                this.displayDialog("Sl\u00e1\u00f0u inn nafn vista\u00f0s leiks.", 2);
                return;
            }
            this.mode = 2;
            this.displayDialog("Enginn leikur hefur veri\u00f0 valinn!", 0);
            return;
        }
        if (actor == this.loadActor) {
            if (this.selectedActor != null) {
                if (((TextActorFace)this.selectedActor.getFace("stop")).getText().length() < 10) {
                    this.mode = 2;
                    this.displayDialog("Ekki er h\u00e6gt a\u00f0 opna valinn leik", 0);
                    return;
                }
                TextActorFace textActorFace = (TextActorFace)this.gameActor.getFace("stop");
                String string = new String(textActorFace.getText());
                if (!string.equals("Til baka")) {
                    this.toBlack();
                    int n2 = this.saveActors.indexOf(this.selectedActor);
                    this.saveInfo = this.mySaver.getSaveInfo(n2 + 1);
                    this.flag = 1;
                    Scene.setCursorFace(null);
                    Object object = this.runLock;
                    synchronized (object) {
                        this.runLock.notify();
                    }
                    return;
                }
                this.mode = 0;
                this.displayDialog("N\u00faverandi sta\u00f0a leiks glatast!", 1);
                return;
            }
            this.mode = 2;
            this.displayDialog("Enginn leikur hefur veri\u00f0 valinn!", 0);
            return;
        }
        if (actor == this.gameActor) {
            TextActorFace textActorFace = (TextActorFace)this.gameActor.getFace("stop");
            String string = new String(textActorFace.getText());
            if (string.equals("Til baka")) {
                this.saveBack.unprepare();
                this.dialogFace.unprepare();
                this.performSequence("s_prepare", true);
                this.ttParser.currentSC.setState(1);
                return;
            }
            Scene.setCursorFace(null);
            this.toBlack();
            this.hideDialog();
            this.saveBack.unprepare();
            this.dialogFace.unprepare();
            this.screenToDisplay = 2;
            this.flag = 0;
            Object object = this.runLock;
            synchronized (object) {
                this.runLock.notify();
            }
            return;
        }
        if (actor == this.okActor) {
            this.hideDialog();
            return;
        }
        if (actor == this.noActor) {
            this.hideDialog();
            return;
        }
        if (actor == this.yesActor) {
            if (this.mode == 3) {
                System.out.println("Quitting upon request");
                this.world.shutDown();
                System.exit(0);
            }
            if (this.mode == 0) {
                Scene.setCursorFace(null);
                this.toBlack();
                this.hideDialog();
                this.saveBack.unprepare();
                this.dialogFace.unprepare();
                n = this.saveActors.indexOf(this.selectedActor);
                this.saveInfo = this.mySaver.getSaveInfo(n + 1);
                this.flag = !this.loaded || this.getScreenFromName(this.saveInfo[0]) != this.currentScreen ? 1 : 2;
                Object object = this.runLock;
                synchronized (object) {
                    this.runLock.notify();
                }
                return;
            }
            if (this.mode == 1) {
                this.doSave();
            }
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void displayDialog(String string, int n) {
        this.saveActor.removeActorMouseListener(this);
        ((TextActorFace)this.saveActor.getFace("stop")).setHighlighted(false);
        this.loadActor.removeActorMouseListener(this);
        ((TextActorFace)this.loadActor.getFace("stop")).setHighlighted(false);
        this.quitActor.removeActorMouseListener(this);
        ((TextActorFace)this.quitActor.getFace("stop")).setHighlighted(false);
        this.gameActor.removeActorMouseListener(this);
        ((TextActorFace)this.gameActor.getFace("stop")).setHighlighted(false);
        int n2 = 0;
        while (n2 < 10) {
            StaticActor staticActor = (StaticActor)this.saveActors.elementAt(n2);
            staticActor.setState("hide");
            ++n2;
        }
        this.dialogActor.setState("stop");
        this.displayTextActor.setState("stop");
        ((TextActorFace)this.displayTextActor.getFace("stop")).setText(string);
        if (n == 0) {
            this.okActor.setState("stop");
        } else if (n >= 1) {
            this.yesActor.setState("stop");
            this.noActor.setState("stop");
        }
        if (n == 2) {
            String string2 = String.valueOf(((TextActorFace)this.selectedActor.getFace("stop")).getText());
            try {
                string2 = string2.substring(20);
            }
            catch (StringIndexOutOfBoundsException stringIndexOutOfBoundsException) {
                string2 = "";
            }
            ((TextActorFace)this.textInputActor.getFace("stop")).setText(string2);
            this.textInputActor.setState("stop");
            this.input = true;
        }
    }

    private void hideDialog() {
        this.input = false;
        this.dialogActor.setState("hide");
        this.displayTextActor.setState("hide");
        this.okActor.setState("hide");
        this.yesActor.setState("hide");
        this.noActor.setState("hide");
        this.textInputActor.setState("hide");
        ((TextActorFace)this.saveActor.getFace("stop")).setHighlighted(true);
        this.saveActor.addActorMouseListener(this);
        ((TextActorFace)this.loadActor.getFace("stop")).setHighlighted(true);
        this.loadActor.addActorMouseListener(this);
        ((TextActorFace)this.quitActor.getFace("stop")).setHighlighted(true);
        this.quitActor.addActorMouseListener(this);
        ((TextActorFace)this.gameActor.getFace("stop")).setHighlighted(true);
        this.gameActor.addActorMouseListener(this);
        int n = 0;
        while (n < 10) {
            StaticActor staticActor = (StaticActor)this.saveActors.elementAt(n);
            staticActor.setState("stop");
            ++n;
        }
    }

    private void displaySaver(int n) {
        this.saveBack.prepare();
        this.dialogFace.prepare();
        this.saveActor.setState("stop");
        ((TextActorFace)this.gameActor.getFace("stop")).setText("Til baka");
        if (n == 0) {
            this.saveActor.setState("hide");
            this.setCursorFace(1);
            ((TextActorFace)this.gameActor.getFace("stop")).setText("N\u00fdr leikur");
        } else {
            this.gameScene = this.world.getCurrentScene();
            this.setCursorFace(1);
        }
        this.world.setCurrentScene(this.saveScene);
    }

    public Timaflakkarinn(String string, String string2) {
        timaflakkarinn = this;
        this.gmlPath = string;
        this.resourcePath = string2;
        this.runLock = new Object();
        this.setName("theTimaflakkaraThread");
        this.parsed = new boolean[7];
        int n = 0;
        while (n < 7) {
            this.parsed[n] = false;
            ++n;
        }
        this.pulser = new Pulser();
        this.world = new World();
        this.screenContainer = new Hashtable();
        this.tempContainer = new Hashtable();
        this.blackScene = new Scene(this.world);
        this.blackScene.setName("blackScene");
        this.blackScene.setBlack(true);
        this.sep = File.separator;
        this.mySaver = new Saver(string);
        this.ttParser = new TTParser(this.world, string, string2, this.pulser, this.mySaver);
        this.ttParser.setTimaflakkarinn(this);
        Nemesis.getKeyboard().startYellingAt(this);
        BitBuffer.setDefaultTransparentColor(new Color24(0, 255, 0));
        this.normal = new CursorFace(string2 + this.sep + "common" + this.sep + "bendill1.png");
        this.hilite = new CursorFace(string2 + this.sep + "common" + this.sep + "bendill2.png");
        this.initializeActors();
        this.initialize();
    }
}
