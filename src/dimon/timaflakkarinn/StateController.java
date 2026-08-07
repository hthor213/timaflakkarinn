/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.agt.Actor;
import is.dimon.agt.ActorFace;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.MovingActor;
import is.dimon.agt.Scene;
import is.dimon.agt.ScrollingScene;
import is.dimon.agt.StaticActor;
import is.dimon.agt.TextActorFace;
import is.dimon.agt.World;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.agt.event.WorldSceneChangeEvent;
import is.dimon.agt.event.WorldSceneChangeListener;
import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.input.KeyEvent;
import is.dimon.nemesis.input.KeyListener;
import is.dimon.nemesis.input.MouseEvent;
import is.dimon.nemesis.input.MouseListener;
import is.dimon.timaflakkarinn.ActionLook;
import is.dimon.timaflakkarinn.ActionNotFoundException;
import is.dimon.timaflakkarinn.ActionTake;
import is.dimon.timaflakkarinn.ActionTalk;
import is.dimon.timaflakkarinn.ActionUse;
import is.dimon.timaflakkarinn.Inventory;
import is.dimon.timaflakkarinn.Timaflakkarinn;
import java.awt.Point;
import java.util.Hashtable;

public class StateController
implements MouseListener,
KeyListener,
ActorMouseListener,
WorldSceneChangeListener {
    static long coun = 0L;
    public static final int MOVING = 0;
    public static final int TAKING = 1;
    public static final int LOOKING = 2;
    public static final int TALKING = 3;
    public static final int FREEZE = 4;
    public static final int USING = 5;
    public static final int CONVERSATING = 6;
    private World myWorld;
    private MovingActor mainActor;
    private Actor usedActor;
    private ActionLook looker;
    private ActionTake taker;
    private ActionTalk talker;
    private ActionUse user;
    private StaticActor stateActor;
    private StaticActor inventoryActor;
    private StaticActor textActor;
    private boolean inventoryOn = false;
    private Scene currentScene;
    private Scene inventoryScene;
    private Inventory inventoryTerrain;
    private Actor currentOverActor;
    boolean justLeftInventory = false;
    private int state = 4;
    Hashtable movingDescriptions;
    Hashtable lookingDescriptions;
    Hashtable talkingDescriptions;
    Hashtable takingDescriptions;
    Hashtable usingDescriptions;
    Hashtable tholfall;

    public static long getCount() {
        return coun;
    }

    public void worldChangesScene(WorldSceneChangeEvent worldSceneChangeEvent) {
        Scene scene = worldSceneChangeEvent.getScene();
        if (scene.getName().equals("saveScene") || scene.getName().equals("waitScene") || scene.getName().equals("blackScene") || scene.getName().equals("s_Black")) {
            return;
        }
        if (this.inventoryActor == null) {
            System.out.println("WARNING StateController:worldChangesScene : inventoryActor is null, exiting");
            return;
        }
        this.inventoryActor.getTerrain().setScene(scene);
        this.stateActor.getTerrain().setScene(scene);
        if (scene != this.inventoryScene) {
            this.currentScene = scene;
        }
    }

    public void setInventoryScene(Scene scene) {
        this.inventoryScene = scene;
    }

    public void setLooker(ActionLook actionLook) {
        this.looker = actionLook;
    }

    public void setTalker(ActionTalk actionTalk) {
        this.talker = actionTalk;
    }

    public void setTaker(ActionTake actionTake) {
        this.taker = actionTake;
    }

    public void setUser(ActionUse actionUse) {
        this.user = actionUse;
    }

    public void setPlayer(MovingActor movingActor) {
        this.mainActor = movingActor;
    }

    public int getState() {
        return this.state;
    }

    public synchronized void setState(int n) {
        if (n <= 6 && n >= 0) {
            this.state = n;
            this.updateState();
            return;
        }
        System.out.println("Illegal state!!");
        System.exit(0);
    }

    public void setStateUsing(Actor actor) {
        this.usedActor = actor;
        this.setState(5);
    }

    public void handleMouseEvent(MouseEvent mouseEvent) {
        if (mouseEvent.getID() == 501) {
            if (mouseEvent.getWhichButton() == 2) {
                this.doRightButton();
            } else if (mouseEvent.getWhichButton() == 0 && !this.inventoryOn) {
                if (this.state == 0 && !this.justLeftInventory) {
                    Point point = new Point(0, 0);
                    if (this.currentScene instanceof ScrollingScene) {
                        point.setLocation(((ScrollingScene)this.currentScene).getScrollPosition());
                    }
                    this.mainActor.setDestination(mouseEvent.getX() + point.x, mouseEvent.getY() + point.y);
                    return;
                }
                this.justLeftInventory = false;
            }
        }
    }

    public void handleKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getID() == 401 && keyEvent.getKeyCode() == 32) {
            this.doRightButton();
        }
    }

    private void doRightButton() {
        if (!this.inventoryOn) {
            switch (this.state) {
                case 4: {
                    break;
                }
                case 6: {
                    break;
                }
                case 5: {
                    this.usedActor.setTerrain(this.inventoryTerrain);
                    this.inventoryTerrain.updatePositions();
                    this.setState(0);
                    break;
                }
                default: {
                    this.setState((this.state + 1) % 4);
                    break;
                }
            }
            if (!this.mainActor.getFaceSwitcher().isStateDeclared(this.mainActor.getState()) && this.state == 0) {
                this.setState(1);
            }
        } else {
            switch (this.state) {
                case 1: {
                    this.setState(2);
                    break;
                }
                case 2: {
                    this.setState(1);
                    break;
                }
                case 5: {
                    this.usedActor.setTerrain(this.inventoryTerrain);
                    this.inventoryTerrain.updatePositions();
                    this.setState(1);
                    break;
                }
            }
        }
        this.updateText(this.currentOverActor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void actorClicked(AGTMouseEvent aGTMouseEvent) {
        if (aGTMouseEvent.getButton() == 2) return;
        if (aGTMouseEvent.getButton() == 1) {
            return;
        }
        if (aGTMouseEvent.getSource() == this.inventoryActor && this.state != 4 && this.state != 6) {
            if (!this.inventoryOn) {
                this.mainActor.stopActor();
                this.myWorld.setCurrentScene(this.inventoryScene);
                if (this.state != 5 && this.state != 1) {
                    this.setState(1);
                }
                this.inventoryOn = true;
                return;
            }
            this.justLeftInventory = true;
            Timaflakkarinn.getCurrentTimaflakkarinn().performSequence("s_prepare", true);
            if (this.state != 5 && this.mainActor.getFaceSwitcher().isStateDeclared(this.mainActor.getState())) {
                this.setState(0);
            }
            this.inventoryOn = false;
            return;
        }
        Actor actor = (Actor)aGTMouseEvent.getSource();
        if (this.inventoryOn && this.state == 1 && actor.getFace("use") != null) {
            this.inventoryTerrain = (Inventory)actor.getTerrain();
            actor.setTerrain(null);
            try {
                actor.setLocation(actor.getLocation());
            }
            catch (InvalidPositionException invalidPositionException) {
                System.err.println("StateController got InvalidPositionException " + invalidPositionException.toString() + " on actor " + actor.getName());
            }
            this.setStateUsing(actor);
            return;
        }
        switch (this.state) {
            case 1: {
                try {
                    this.taker.take(actor);
                }
                catch (ActionNotFoundException actionNotFoundException) {
                    if (!actor.getRandom()) break;
                    Timaflakkarinn.getCurrentTimaflakkarinn().performSequence("s_randomTake", false);
                }
                break;
            }
            case 2: {
                try {
                    this.looker.look(actor);
                }
                catch (ActionNotFoundException actionNotFoundException) {
                    if (!actor.getRandom()) break;
                    Timaflakkarinn.getCurrentTimaflakkarinn().performSequence("s_randomLook", false);
                }
                break;
            }
            case 3: {
                this.updateText(null);
                try {
                    this.talker.talk(actor);
                }
                catch (ActionNotFoundException actionNotFoundException) {
                    if (!actor.getRandom()) break;
                    Timaflakkarinn.getCurrentTimaflakkarinn().performSequence("s_randomTalk", false);
                }
                break;
            }
            case 5: {
                try {
                    this.user.use(this.usedActor, actor);
                }
                catch (ActionNotFoundException actionNotFoundException) {
                    if (!actor.getRandom() || !this.usedActor.getRandom()) break;
                    Timaflakkarinn.getCurrentTimaflakkarinn().performSequence("s_randomUse", false);
                    this.usedActor.setTerrain(this.inventoryTerrain);
                    this.inventoryTerrain.updatePositions();
                    this.setState(1);
                }
                break;
            }
            case 6: {
                if (actor.getFace(actor.getState()) instanceof TextActorFace) {
                    try {
                        this.talker.talk(actor);
                    }
                    catch (ActionNotFoundException actionNotFoundException) {}
                    break;
                } else {
                    break;
                }
            }
        }
        this.updateText(null);
    }

    private void updateState() {
        switch (this.state) {
            case 0: {
                this.stateActor.setState("moving");
                break;
            }
            case 1: {
                this.stateActor.setState("taking");
                break;
            }
            case 2: {
                this.stateActor.setState("looking");
                break;
            }
            case 3: {
                this.stateActor.setState("talking");
                break;
            }
            case 4: {
                this.stateActor.setState("freeze");
                break;
            }
            case 5: {
                this.stateActor.setFace(this.usedActor.getFace("use"), "using");
                this.stateActor.setState("using");
                break;
            }
        }
        if (this.state == 4) {
            Scene.setCursorFace(null);
            this.updateText(null);
        } else {
            Point point = Nemesis.getMouse().getPosition();
            ActorFace actorFace = Scene.currScene.getActorFaceAt(point.x, point.y);
            Actor actor = null;
            if (actorFace != null && (String)this.movingDescriptions.get(actor = actorFace.getOwner()) == null) {
                actor = null;
            }
            if (actor != null) {
                this.currentOverActor = actor;
                Timaflakkarinn.getCurrentTimaflakkarinn().setCursorFace(2);
                this.updateText(this.currentOverActor);
            } else {
                this.currentOverActor = null;
                Timaflakkarinn.getCurrentTimaflakkarinn().setCursorFace(1);
            }
        }
    }

    private void updateText(Actor actor) {
        String string;
        block20: {
            block21: {
                string = null;
                if (actor == null) break block20;
                if (this.movingDescriptions.get(actor) == null) break block21;
                switch (this.state) {
                    case 0: {
                        string = (String)this.movingDescriptions.get(actor);
                        break;
                    }
                    case 1: {
                        string = (String)this.takingDescriptions.get(actor);
                        if (string == null) {
                            string = "Taka " + (String)this.tholfall.get(actor);
                            if (this.tholfall.get(actor) == null) {
                                string = null;
                                break;
                            }
                        }
                        break block20;
                    }
                    case 2: {
                        string = (String)this.lookingDescriptions.get(actor);
                        if (string == null) {
                            string = "Sko\u00f0a " + (String)this.tholfall.get(actor);
                            if (this.tholfall.get(actor) == null) {
                                string = null;
                                break;
                            }
                        }
                        break block20;
                    }
                    case 3: {
                        string = (String)this.talkingDescriptions.get(actor);
                        if (string == null) {
                            string = "Tala vi\u00f0 " + (String)this.tholfall.get(actor);
                            if (this.tholfall.get(actor) == null) {
                                string = null;
                                break;
                            }
                        }
                        break block20;
                    }
                    case 5: {
                        if (this.usingDescriptions.get(this.usedActor) != null) {
                            string = (String)((Hashtable)this.usingDescriptions.get(this.usedActor)).get(actor);
                        }
                        if (string == null) {
                            string = "Nota " + (String)this.tholfall.get(this.usedActor) + " \u00e1 " + (String)this.tholfall.get(actor);
                            if (this.tholfall.get(this.usedActor) == null || this.tholfall.get(actor) == null) {
                                string = null;
                                break;
                            }
                        }
                        break block20;
                    }
                }
                break block20;
            }
            string = null;
        }
        if (string != null) {
            ((TextActorFace)this.textActor.getFace(this.textActor.getState())).setText(string);
            if (this.state != 4) {
                Timaflakkarinn.getCurrentTimaflakkarinn().setCursorFace(2);
            }
        } else {
            ((TextActorFace)this.textActor.getFace(this.textActor.getState())).setText("");
            if (this.state != 4) {
                Timaflakkarinn.getCurrentTimaflakkarinn().setCursorFace(1);
            }
        }
    }

    public void actorEntered(AGTMouseEvent aGTMouseEvent) {
        this.currentOverActor = (Actor)aGTMouseEvent.getSource();
        this.updateText(this.currentOverActor);
    }

    public void actorExited(AGTMouseEvent aGTMouseEvent) {
        this.currentOverActor = null;
        this.updateText(null);
    }

    public void setTholfall(Actor actor, String string) {
        this.tholfall.put(actor, string);
    }

    public void setMovingDescription(Actor actor, String string) {
        this.movingDescriptions.put(actor, string);
    }

    public void setLookingDescription(Actor actor, String string) {
        this.lookingDescriptions.put(actor, string);
    }

    public void setTalkingDescription(Actor actor, String string) {
        this.talkingDescriptions.put(actor, string);
    }

    public void setTakingDescription(Actor actor, String string) {
        this.takingDescriptions.put(actor, string);
    }

    public void setUsingDescription(Actor actor, Actor actor2, String string) {
        Hashtable<Actor, String> hashtable = (Hashtable<Actor, String>)this.usingDescriptions.get(actor);
        if (hashtable == null) {
            hashtable = new Hashtable<Actor, String>();
            this.usingDescriptions.put(actor, hashtable);
        }
        hashtable.put(actor2, string);
    }

    public void kill() {
        Nemesis.getMouse().stopYellingAt(this);
        Nemesis.getKeyboard().stopYellingAt(this);
        this.myWorld.removeWorldSceneChangeListener(this);
        this.inventoryActor.removeActorMouseListener(this);
        this.myWorld = null;
        this.mainActor = null;
        this.stateActor = null;
        this.usedActor = null;
        this.looker = null;
        this.taker = null;
        this.talker = null;
        this.user = null;
        this.inventoryActor = null;
        this.textActor = null;
        this.currentScene = null;
        this.inventoryScene = null;
        this.movingDescriptions.clear();
        this.movingDescriptions = null;
        this.lookingDescriptions.clear();
        this.lookingDescriptions = null;
        this.talkingDescriptions.clear();
        this.talkingDescriptions = null;
        this.takingDescriptions.clear();
        this.takingDescriptions = null;
        this.currentOverActor = null;
    }

    public void finalize() {
        --coun;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public StateController(World world, StaticActor staticActor, StaticActor staticActor2, StaticActor staticActor3) {
        this.myWorld = world;
        ++coun;
        this.stateActor = staticActor;
        this.inventoryActor = staticActor2;
        this.textActor = staticActor3;
        TextActorFace textActorFace = (TextActorFace)this.textActor.getFace("text");
        textActorFace.setAlignment(0);
        try {
            this.textActor.setLocation(400.0f, 1850.0f, 1800.0f);
        }
        catch (InvalidPositionException invalidPositionException) {
        }
        this.movingDescriptions = new Hashtable();
        this.lookingDescriptions = new Hashtable();
        this.talkingDescriptions = new Hashtable();
        this.takingDescriptions = new Hashtable();
        this.usingDescriptions = new Hashtable();
        this.tholfall = new Hashtable();
        Nemesis.getMouse().startYellingAt(this);
        Nemesis.getKeyboard().startYellingAt(this);
        this.myWorld.addWorldSceneChangeListener(this);
    }
}
