/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.ibm.xml.parser.Parser
 *  com.ibm.xml.parser.TXDocument
 *  com.ibm.xml.parser.TXElement
 */
package is.dimon.timaflakkarinn;

import com.ibm.xml.parser.Parser;
import com.ibm.xml.parser.TXDocument;
import com.ibm.xml.parser.TXElement;
import is.dimon.agt.Actor;
import is.dimon.agt.ActorFace;
import is.dimon.agt.ActorMouth;
import is.dimon.agt.CelledAnimated2DActorFace;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.MovingActor;
import is.dimon.agt.Preparable;
import is.dimon.agt.Pseudo3DCollisionBox;
import is.dimon.agt.Pulser;
import is.dimon.agt.Scene;
import is.dimon.agt.ScrollingScene;
import is.dimon.agt.SimpleActorMouth;
import is.dimon.agt.SimplePseudo3DTerrain;
import is.dimon.agt.SpeechActorMouth;
import is.dimon.agt.StaticActor;
import is.dimon.agt.StaticActorFace;
import is.dimon.agt.Terrain;
import is.dimon.agt.TextActorFace;
import is.dimon.agt.Walker;
import is.dimon.agt.World;
import is.dimon.agt.action.AGTEventReactor;
import is.dimon.agt.action.CheckConditionQuantum;
import is.dimon.agt.action.ConditionFlag;
import is.dimon.agt.action.DecrementFlagQuantum;
import is.dimon.agt.action.FadeQuantum;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.IncrementFlagQuantum;
import is.dimon.agt.action.MoveActorQuantum;
import is.dimon.agt.action.MoveTerrainQuantum;
import is.dimon.agt.action.PauseQuantum;
import is.dimon.agt.action.PrepareQuantum;
import is.dimon.agt.action.Quantum;
import is.dimon.agt.action.RandomSetFlagQuantum;
import is.dimon.agt.action.Sequence;
import is.dimon.agt.action.SetDestinationQuantum;
import is.dimon.agt.action.SetFlagQuantum;
import is.dimon.agt.action.SetSpeedQuantum;
import is.dimon.agt.action.StateQuantum;
import is.dimon.agt.action.StopActorQuantum;
import is.dimon.agt.action.SwitchSceneQuantum;
import is.dimon.agt.event.ActorCollisionListener;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.nemesis.draw.Color24;
import is.dimon.timaflakkarinn.ActionCollision;
import is.dimon.timaflakkarinn.ActionDoubleReactor;
import is.dimon.timaflakkarinn.ActionLook;
import is.dimon.timaflakkarinn.ActionReactor;
import is.dimon.timaflakkarinn.ActionTake;
import is.dimon.timaflakkarinn.ActionTalk;
import is.dimon.timaflakkarinn.ActionUse;
import is.dimon.timaflakkarinn.GuessQuantum;
import is.dimon.timaflakkarinn.Inventory;
import is.dimon.timaflakkarinn.Saver;
import is.dimon.timaflakkarinn.SentenceContainer;
import is.dimon.timaflakkarinn.StateController;
import is.dimon.timaflakkarinn.SwitchStateQuantum;
import is.dimon.timaflakkarinn.ThemeFinishedQuantum;
import is.dimon.timaflakkarinn.Timaflakkarinn;
import is.dimon.timaflakkarinn.UpdateQuantum;
import is.dimon.util.Hashtable;
import java.awt.Polygon;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class TTParser {
    public StateController currentSC;
    Saver mySaver;
    protected String gmlRoot = new String("");
    protected String resourceRoot = new String("");
    protected Timaflakkarinn timaflakkarinn;
    protected Hashtable container = new Hashtable();
    private FileInputStream is;
    private boolean stopParsing = false;
    protected World world;
    protected Pulser pulser;
    private char sep = File.separatorChar;
    private char backSlash = (char)92;

    public String getResourceRoot() {
        return this.resourceRoot;
    }

    public void setResourceRoot(String string) {
        this.resourceRoot = string;
    }

    public void setWorld(World world) {
        this.world = world;
    }

    public World getWorld(World world) {
        return this.world;
    }

    public String getGMLRoot() {
        return this.gmlRoot;
    }

    public void setTimaflakkarinn(Timaflakkarinn timaflakkarinn) {
        this.timaflakkarinn = timaflakkarinn;
    }

    private String adaptPath(String string) {
        return string.replace(this.backSlash, this.sep);
    }

    public void setGMLRoot(String string) {
        this.gmlRoot = string;
    }

    public void setContainer(Hashtable hashtable) {
        this.container = hashtable;
    }

    public Hashtable getContainer() {
        return this.container;
    }

    public void stopParsing() {
        this.stopParsing = true;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void parseGMLFile(File file) {
        System.out.println("");
        System.out.println("Before parsing file: " + file.getName() + " status of AGT objects is:");
        System.out.println("");
        System.out.println("StateController count is: " + StateController.getCount());
        System.out.println("Scene count is: " + Scene.getNumberOfObjects());
        System.out.println("Terrain count is: " + Terrain.getNumberOfObjects());
        System.out.println("Actor count is: " + Actor.getNumberOfObjects());
        System.out.println("Sequence count is: " + Sequence.getNumberOfObjects());
        System.out.println("ActorFace count is: " + ActorFace.getNumberOfObjects());
        System.out.println("ActorMouth count is: " + SimpleActorMouth.getNumberOfObjects());
        System.out.println("ConditionFlag count is: " + ConditionFlag.getNumberOfObjects());
        System.out.println("Reactor count is: " + AGTEventReactor.getNumberOfObjects());
        System.out.println("");
        this.stopParsing = false;
        try {
            this.is = new FileInputStream(file);
        }
        catch (IOException iOException) {
            System.out.println("GMLParserError while reading file: " + file.getName() + " Returning without parsing");
            return;
        }
        TXDocument tXDocument = new Parser(file.getName()).readStream((InputStream)this.is);
        this.parseDoc(tXDocument);
        System.out.println("");
        System.out.println("After parsing file: " + file.getName() + " status of AGT objects is:");
        System.out.println("");
        System.out.println("StateController count is: " + StateController.getCount());
        System.out.println("Scene count is: " + Scene.getNumberOfObjects());
        System.out.println("Terrain count is: " + Terrain.getNumberOfObjects());
        System.out.println("Actor count is: " + Actor.getNumberOfObjects());
        System.out.println("Sequence count is: " + Sequence.getNumberOfObjects());
        System.out.println("ActorFace count is: " + ActorFace.getNumberOfObjects());
        System.out.println("ActorMouth count is: " + SimpleActorMouth.getNumberOfObjects());
        System.out.println("ConditionFlag count is: " + ConditionFlag.getNumberOfObjects());
        System.out.println("Reactor count is: " + AGTEventReactor.getNumberOfObjects());
        System.out.println("");
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void parseGMLFile(String string) {
        System.out.println("");
        System.out.println("Before parsing file: " + string + " status of AGT objects is:");
        System.out.println("");
        System.out.println("StateController count is: " + StateController.getCount());
        System.out.println("Scene count is: " + Scene.getNumberOfObjects());
        System.out.println("Terrain count is: " + Terrain.getNumberOfObjects());
        System.out.println("Actor count is: " + Actor.getNumberOfObjects());
        System.out.println("Sequence count is: " + Sequence.getNumberOfObjects());
        System.out.println("ActorFace count is: " + ActorFace.getNumberOfObjects());
        System.out.println("ActorMouth count is: " + SimpleActorMouth.getNumberOfObjects());
        System.out.println("ConditionFlag count is: " + ConditionFlag.getNumberOfObjects());
        System.out.println("Reactor count is: " + AGTEventReactor.getNumberOfObjects());
        System.out.println("");
        System.out.println("Active Threads are: " + Thread.activeCount());
        System.out.println("");
        this.stopParsing = false;
        try {
            this.is = new FileInputStream(this.gmlRoot + string + ".gml");
        }
        catch (IOException iOException) {
            System.out.println("GMLParserError while reading file: " + this.gmlRoot + string + ".gml" + " Returning without parsing");
            return;
        }
        TXDocument tXDocument = new Parser(this.gmlRoot + string + ".gml").readStream((InputStream)this.is);
        this.parseDoc(tXDocument);
        System.out.println("");
        System.out.println("After parsing file: " + string + " status of AGT objects is:");
        System.out.println("");
        System.out.println("StateController count is: " + StateController.getCount());
        System.out.println("Scene count is: " + Scene.getNumberOfObjects());
        System.out.println("Terrain count is: " + Terrain.getNumberOfObjects());
        System.out.println("Actor count is: " + Actor.getNumberOfObjects());
        System.out.println("Sequence count is: " + Sequence.getNumberOfObjects());
        System.out.println("ActorFace count is: " + ActorFace.getNumberOfObjects());
        System.out.println("ActorMouth count is: " + SimpleActorMouth.getNumberOfObjects());
        System.out.println("ConditionFlag count is: " + ConditionFlag.getNumberOfObjects());
        System.out.println("Reactor count is: " + AGTEventReactor.getNumberOfObjects());
        System.out.println("");
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void parseDoc(TXDocument tXDocument) {
        long l = System.currentTimeMillis();
        TXElement tXElement = (TXElement)tXDocument.getDocumentElement();
        Enumeration enumeration = tXElement.elements();
        while (enumeration.hasMoreElements()) {
            if (this.stopParsing) {
                return;
            }
            Node node = (Node)enumeration.nextElement();
            if (!(node instanceof TXElement)) continue;
            TXElement tXElement2 = (TXElement)node;
            String string = tXElement2.getTagName();
            if (string.equals("Scene")) {
                this.createScene(tXElement2);
                continue;
            }
            if (string.equals("ScrollingScene")) {
                this.createScrollingScene(tXElement2);
                continue;
            }
            if (string.equals("Polygon")) {
                this.createPolygon(tXElement2);
                continue;
            }
            if (string.equals("SimplePseudo3DTerrain")) {
                this.createSimplePseudo3DTerrain(tXElement2);
                continue;
            }
            if (string.equals("Pseudo3DCollisionBox")) {
                this.createPseudo3DCollisionBox(tXElement2);
                continue;
            }
            if (string.equals("TransparentActorFace")) {
                this.createTransparentActorFace(tXElement2);
                continue;
            }
            if (string.equals("StaticActorFace")) {
                this.createStaticActorFace(tXElement2);
                continue;
            }
            if (string.equals("CelledAnimated2DActorFace")) {
                this.createCelledAnimated2DActorFace(tXElement2);
                continue;
            }
            if (string.equals("JMFActorMouth")) {
                this.createJMFActorMouth(tXElement2);
                continue;
            }
            if (string.equals("SpeechActorMouth")) {
                this.createSpeechActorMouth(tXElement2);
                continue;
            }
            if (string.equals("StaticActor")) {
                this.createStaticActor(tXElement2);
                continue;
            }
            if (string.equals("MovingActor")) {
                this.createMovingActor(tXElement2);
                continue;
            }
            if (string.equals("Text")) {
                this.createTextActor(tXElement2);
                continue;
            }
            if (string.equals("ActorMoused")) {
                this.createActorMoused(tXElement2);
                continue;
            }
            if (string.equals("UseText")) {
                this.createUseText(tXElement2);
                continue;
            }
            if (string.equals("Sequence")) {
                this.createSequence(tXElement2);
                continue;
            }
            if (string.equals("Reaction")) {
                this.createReaction(tXElement2);
                continue;
            }
            if (string.equals("SwitchStateQuantum")) {
                this.createSwitchStateQuantum(tXElement2);
                continue;
            }
            if (string.equals("SwitchSceneQuantum")) {
                this.createSwitchSceneQuantum(tXElement2);
                continue;
            }
            if (string.equals("PauseQuantum")) {
                this.createPauseQuantum(tXElement2);
                continue;
            }
            if (string.equals("StateQuantum")) {
                this.createStateQuantum(tXElement2);
                continue;
            }
            if (string.equals("UpdateQuantum")) {
                this.createUpdateQuantum(tXElement2);
                continue;
            }
            if (string.equals("MoveActorQuantum")) {
                this.createMoveActorQuantum(tXElement2);
                continue;
            }
            if (string.equals("SetDestinationQuantum")) {
                this.createSetDestinationQuantum(tXElement2);
                continue;
            }
            if (string.equals("ConditionFlag")) {
                this.createConditionFlag(tXElement2);
                continue;
            }
            if (string.equals("CheckConditionQuantum")) {
                this.createCheckConditionQuantum(tXElement2);
                continue;
            }
            if (string.equals("SetFlagQuantum")) {
                this.createSetFlagQuantum(tXElement2);
                continue;
            }
            if (string.equals("SetSpeedQuantum")) {
                this.createSetSpeedQuantum(tXElement2);
                continue;
            }
            if (string.equals("IncrementFlagQuantum")) {
                this.createIncrementFlagQuantum(tXElement2);
                continue;
            }
            if (string.equals("StopActorQuantum")) {
                this.createStopActorQuantum(tXElement2);
                continue;
            }
            if (string.equals("Inventory")) {
                this.createInventory(tXElement2);
                continue;
            }
            if (string.equals("SentenceContainer")) {
                this.createSentenceContainer(tXElement2);
                continue;
            }
            if (string.equals("PrepareQuantum")) {
                this.createPrepareQuantum(tXElement2);
                continue;
            }
            if (string.equals("DecrementFlagQuantum")) {
                this.createDecrementFlagQuantum(tXElement2);
                continue;
            }
            if (string.equals("MoveTerrainQuantum")) {
                this.createMoveTerrainQuantum(tXElement2);
                continue;
            }
            if (string.equals("RandomSetFlagQuantum")) {
                this.createRandomSetFlagQuantum(tXElement2);
                continue;
            }
            if (string.equals("SetPlayer")) {
                this.createSetPlayer(tXElement2);
                continue;
            }
            if (string.equals("StateController")) {
                this.createStateController(tXElement2);
                continue;
            }
            if (string.equals("ThemeFinishedQuantum")) {
                this.createThemeFinishedQuantum(tXElement2);
                continue;
            }
            if (string.equals("GuessQuantum")) {
                this.createGuessQuantum(tXElement2);
                continue;
            }
            if (!string.equals("FadeQuantum")) continue;
            this.createFadeQuantum(tXElement2);
        }
        try {
            this.is.close();
        }
        catch (IOException iOException) {
            System.out.println("ERROR   TTParser::parseFile : Error while trying to close file");
        }
        System.out.println("Finished parsing file! Elapsed time is: " + (System.currentTimeMillis() - l));
    }

    protected Object get(String string) {
        return this.container.get(string);
    }

    protected void put(Object object, Object object2) {
        this.container.put(object, object2);
    }

    protected void createScene(TXElement tXElement) {
        Scene scene = new Scene(this.world);
        String string = tXElement.getAttribute("name");
        if (string.equals("s_Black")) {
            scene.setBackgroundColor(new Color24(0, 0, 0));
        }
        scene.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), scene);
        }
        this.put(string, scene);
    }

    protected void createScrollingScene(TXElement tXElement) {
        ScrollingScene scrollingScene = new ScrollingScene(this.timaflakkarinn.getWorld(), Integer.parseInt(tXElement.getAttribute("width")), Integer.parseInt(tXElement.getAttribute("height")));
        scrollingScene.setScrollingDistances(325, 475, 300, 450);
        String string = tXElement.getAttribute("name");
        scrollingScene.setName(string);
        this.put(string, scrollingScene);
    }

    protected void createPolygon(TXElement tXElement) {
        Polygon polygon = new Polygon();
        NodeList nodeList = tXElement.getElementsNamed("Point");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            polygon.addPoint(Integer.parseInt(tXElement2.getAttribute("x")), Integer.parseInt(tXElement2.getAttribute("y")));
            ++n;
        }
        this.put(tXElement.getAttribute("name"), polygon);
    }

    private void createSimplePseudo3DTerrain(TXElement tXElement) {
        SimplePseudo3DTerrain simplePseudo3DTerrain = new SimplePseudo3DTerrain((Scene)this.get(tXElement.getAttribute("scene")), (Polygon)this.get(tXElement.getAttribute("polygon")), Integer.parseInt(tXElement.getAttribute("zmin")), Integer.parseInt(tXElement.getAttribute("zmax")));
        if (!tXElement.getAttribute("defaultscaling").equals("")) {
            simplePseudo3DTerrain.setDefaultScaling(Float.valueOf(tXElement.getAttribute("defaultscaling")).floatValue());
        }
        if (!(tXElement.getAttribute("scanline1").equals("") || tXElement.getAttribute("scaling2").equals("") || tXElement.getAttribute("scanline2").equals(""))) {
            simplePseudo3DTerrain.setScalingParameters(Float.valueOf(tXElement.getAttribute("scanline1")).floatValue(), Float.valueOf(tXElement.getAttribute("scanline2")).floatValue(), Float.valueOf(tXElement.getAttribute("scaling2")).floatValue());
        }
        if (tXElement.getAttribute("scrolling").equals("true")) {
            simplePseudo3DTerrain.setScrolling(true);
        } else {
            simplePseudo3DTerrain.setScrolling(false);
        }
        String string = tXElement.getAttribute("name");
        simplePseudo3DTerrain.setName(string);
        this.put(string, simplePseudo3DTerrain);
    }

    private void createInventory(TXElement tXElement) {
        Inventory inventory = new Inventory((Scene)this.get(tXElement.getAttribute("scene")), (Polygon)this.get(tXElement.getAttribute("polygon")), Integer.parseInt(tXElement.getAttribute("zmin")), Integer.parseInt(tXElement.getAttribute("zmax")));
        String string = tXElement.getAttribute("name");
        inventory.setName(string);
        this.put(string, inventory);
    }

    private void createSentenceContainer(TXElement tXElement) {
        SentenceContainer sentenceContainer = new SentenceContainer((Scene)this.get(tXElement.getAttribute("scene")), (Polygon)this.get(tXElement.getAttribute("polygon")), Integer.parseInt(tXElement.getAttribute("zmin")), Integer.parseInt(tXElement.getAttribute("zmax")));
        sentenceContainer.setScrolling(false);
        if (tXElement.getAttribute("save").equals("true")) {
            this.mySaver.addTerrain(sentenceContainer);
        }
        String string = tXElement.getAttribute("name");
        sentenceContainer.setName(string);
        this.put(string, sentenceContainer);
    }

    private void createPseudo3DCollisionBox(TXElement tXElement) {
        int n = Integer.parseInt(tXElement.getAttribute("x"));
        int n2 = Integer.parseInt(tXElement.getAttribute("y"));
        int n3 = Integer.parseInt(tXElement.getAttribute("z"));
        Pseudo3DCollisionBox pseudo3DCollisionBox = new Pseudo3DCollisionBox(n, n2, n3);
        this.put(tXElement.getAttribute("name"), pseudo3DCollisionBox);
    }

    private void createTransparentActorFace(TXElement tXElement) {
        StaticActorFace staticActorFace = new StaticActorFace();
        staticActorFace.setImageSize(Integer.parseInt(tXElement.getAttribute("width")), Integer.parseInt(tXElement.getAttribute("height")));
        if (!tXElement.getAttribute("xoffset").equals("") && !tXElement.getAttribute("yoffset").equals("")) {
            staticActorFace.setOffset(Integer.parseInt(tXElement.getAttribute("xoffset")), Integer.parseInt(tXElement.getAttribute("yoffset")));
        }
        staticActorFace.setName(tXElement.getAttribute("name"));
        staticActorFace.setTransparent(true);
        this.put(tXElement.getAttribute("name"), staticActorFace);
    }

    protected void createStaticActorFace(TXElement tXElement) {
        StaticActorFace staticActorFace = new StaticActorFace();
        if (!tXElement.getAttribute("file").equals("")) {
            staticActorFace.setBaseImage(this.adaptPath(this.resourceRoot + tXElement.getAttribute("file") + ".png"));
        }
        if (tXElement.getAttribute("prepare").equals("true")) {
            staticActorFace.prepare();
        }
        if (!tXElement.getAttribute("xoffset").equals("") && !tXElement.getAttribute("yoffset").equals("")) {
            staticActorFace.setOffset(Integer.parseInt(tXElement.getAttribute("xoffset")), Integer.parseInt(tXElement.getAttribute("yoffset")));
        }
        staticActorFace.setName(tXElement.getAttribute("name"));
        this.put(tXElement.getAttribute("name"), staticActorFace);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    private void createTextActor(TXElement tXElement) {
        StaticActor staticActor = new StaticActor();
        TextActorFace textActorFace = new TextActorFace();
        textActorFace.setFontSize(20.0f);
        if (tXElement.getAttribute("color").equals("")) {
            textActorFace.setColor(new Color24(Integer.parseInt(tXElement.getAttribute("r")), Integer.parseInt(tXElement.getAttribute("g")), Integer.parseInt(tXElement.getAttribute("b"))));
        } else {
            int n = 0;
            int n2 = 0;
            int n3 = 0;
            if (tXElement.getAttribute("color").equals("white")) {
                n = 255;
                n2 = 255;
                n3 = 255;
            }
            if (tXElement.getAttribute("color").equals("red")) {
                n = 255;
                n2 = 0;
                n3 = 0;
            }
            if (tXElement.getAttribute("color").equals("green")) {
                n = 0;
                n2 = 255;
                n3 = 0;
            }
            if (tXElement.getAttribute("color").equals("blue")) {
                n = 0;
                n2 = 0;
                n3 = 255;
            }
            if (tXElement.getAttribute("color").equals("yellow")) {
                n = 255;
                n2 = 255;
                n3 = 0;
            }
            textActorFace.setColor(new Color24(n, n2, n3));
        }
        textActorFace.setText(tXElement.getAttribute("text"));
        staticActor.setFace(textActorFace, "text");
        if (tXElement.getAttribute("save").equals("true")) {
            this.mySaver.addTextActor(staticActor);
        }
        if (!tXElement.getAttribute("terrain").equals("")) {
            staticActor.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        } else {
            staticActor.setTerrain(null);
        }
        try {
            staticActor.setLocation(0.0f, -1000.0f, 0.0f);
        }
        catch (InvalidPositionException invalidPositionException) {
        }
        staticActor.setState("text");
        if (tXElement.getAttribute("hilite").equals("true")) {
            textActorFace.setHighlighted(true);
            if (!tXElement.getAttribute("terrain").equals("")) {
                ((SentenceContainer)this.get(tXElement.getAttribute("terrain"))).hideAll();
            }
        }
        textActorFace.setName(tXElement.getAttribute("name") + "_face");
        staticActor.setName(tXElement.getAttribute("name"));
        this.put(tXElement.getAttribute("name"), staticActor);
    }

    protected void createCelledAnimated2DActorFace(TXElement tXElement) {
        CelledAnimated2DActorFace celledAnimated2DActorFace = null;
        celledAnimated2DActorFace = new CelledAnimated2DActorFace(this.pulser);
        celledAnimated2DActorFace.setFrameCount(Integer.parseInt(tXElement.getAttribute("count")));
        celledAnimated2DActorFace.setName(tXElement.getAttribute("name"));
        celledAnimated2DActorFace.setBaseImage(this.adaptPath(this.resourceRoot + tXElement.getAttribute("file") + ".png"));
        celledAnimated2DActorFace.setRepeatCount(Integer.parseInt(tXElement.getAttribute("repeat")));
        if (!tXElement.getAttribute("speed").equals("")) {
            celledAnimated2DActorFace.setAnimationSpeed(Integer.parseInt(tXElement.getAttribute("speed")));
        }
        if (tXElement.getAttribute("prepare").equals("true")) {
            celledAnimated2DActorFace.prepare();
        }
        if (!tXElement.getAttribute("xoffset").equals("") && !tXElement.getAttribute("yoffset").equals("")) {
            celledAnimated2DActorFace.setOffset(Integer.parseInt(tXElement.getAttribute("xoffset")), Integer.parseInt(tXElement.getAttribute("yoffset")));
        }
        if (tXElement.getAttribute("random").equals("true")) {
            celledAnimated2DActorFace.setRandom(true);
        } else {
            celledAnimated2DActorFace.setRandom(false);
        }
        this.put(tXElement.getAttribute("name"), celledAnimated2DActorFace);
    }

    protected void createJMFActorMouth(TXElement tXElement) {
        SimpleActorMouth simpleActorMouth = new SimpleActorMouth();
        simpleActorMouth.setSoundFilePath(this.adaptPath(this.resourceRoot + tXElement.getAttribute("file")));
        if (tXElement.getAttribute("repeat").equals("true")) {
            simpleActorMouth.setLoop(true);
        }
        simpleActorMouth.setName(tXElement.getAttribute("name"));
        this.put(tXElement.getAttribute("name"), simpleActorMouth);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createSpeechActorMouth(TXElement tXElement) {
        try {
            SpeechActorMouth speechActorMouth = new SpeechActorMouth(this.pulser);
            speechActorMouth.setSoundFilePath(this.adaptPath(this.resourceRoot + tXElement.getAttribute("file")));
            speechActorMouth.setName(tXElement.getAttribute("name"));
            NodeList nodeList = tXElement.getElementsNamed("Sentence");
            long l = 0L;
            int n = 0;
            while (true) {
                if (n >= nodeList.getLength()) {
                    Actor actor = (Actor)this.get(tXElement.getAttribute("acc"));
                    speechActorMouth.setTextActorFace((TextActorFace)actor.getFace(actor.getState()));
                    speechActorMouth.setTextMiddle(new Float3DPoint(400.0f, 2030.0f, 2000.0f));
                    this.put(tXElement.getAttribute("name"), speechActorMouth);
                    return;
                }
                TXElement tXElement2 = (TXElement)nodeList.item(n);
                speechActorMouth.addSentence(tXElement2.getAttribute("text"), Long.parseLong(tXElement2.getAttribute("time")));
                ++n;
            }
        }
        catch (Exception exception) {
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createStaticActor(TXElement tXElement) {
        StaticActor staticActor = new StaticActor();
        NodeList nodeList = tXElement.getElementsNamed("State");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            String string = tXElement2.getAttribute("name");
            if (!tXElement2.getAttribute("face").equals("")) {
                staticActor.setFace((ActorFace)this.get(tXElement2.getAttribute("face")), string);
            }
            if (!tXElement2.getAttribute("collisionbox").equals("")) {
                staticActor.setCollisionBox((Pseudo3DCollisionBox)this.get(tXElement2.getAttribute("collisionbox")), string);
            }
            if (!tXElement2.getAttribute("mouth").equals("")) {
                staticActor.setMouth((ActorMouth)this.get(tXElement2.getAttribute("mouth")), string);
            }
            ++n;
        }
        if (tXElement.getAttribute("scaling").equals("no")) {
            staticActor.setScalingType(0);
        } else if (tXElement.getAttribute("scaling").equals("static")) {
            staticActor.setScalingType(1);
        } else {
            staticActor.setScalingType(2);
        }
        if (tXElement.getAttribute("save").equals("true")) {
            this.mySaver.addActor(staticActor);
        }
        try {
            staticActor.setLocation(Integer.parseInt(tXElement.getAttribute("x")), Integer.parseInt(tXElement.getAttribute("y")), Integer.parseInt(tXElement.getAttribute("z")));
        }
        catch (InvalidPositionException invalidPositionException) {
            System.out.println("InvalidPositionException caught\t: " + tXElement.getAttribute("name"));
            System.exit(0);
        }
        if (!tXElement.getAttribute("terrain").equals("")) {
            staticActor.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        } else {
            staticActor.setTerrain(null);
        }
        staticActor.setState(tXElement.getAttribute("state"));
        if (!tXElement.getAttribute("collision").equals("")) {
            ActionCollision actionCollision = new ActionCollision();
            staticActor.addActorCollisionListener(actionCollision);
            this.put(tXElement.getAttribute("collision"), actionCollision);
        }
        if (tXElement.getAttribute("random").equals("true")) {
            staticActor.setRandom(true);
        }
        staticActor.setName(tXElement.getAttribute("name"));
        this.put(tXElement.getAttribute("name"), staticActor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createMovingActor(TXElement tXElement) {
        Object object;
        MovingActor movingActor = new MovingActor(this.pulser);
        NodeList nodeList = tXElement.getElementsNamed("State");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            String string = tXElement2.getAttribute("name");
            if (!tXElement2.getAttribute("face").equals("")) {
                movingActor.setFace((ActorFace)this.get(tXElement2.getAttribute("face")), string);
            }
            if (!tXElement2.getAttribute("collisionbox").equals("")) {
                movingActor.setCollisionBox((Pseudo3DCollisionBox)this.get(tXElement2.getAttribute("collisionbox")), string);
            }
            if (!tXElement2.getAttribute("mouth").equals("")) {
                movingActor.setMouth((ActorMouth)this.get(tXElement2.getAttribute("mouth")), string);
            }
            ++n;
        }
        if (tXElement.getAttribute("scaling").equals("no")) {
            movingActor.setScalingType(0);
        } else if (tXElement.getAttribute("scaling").equals("static")) {
            movingActor.setScalingType(1);
        } else {
            movingActor.setScalingType(2);
        }
        if (!tXElement.getAttribute("speed").equals("")) {
            float f = Float.valueOf(tXElement.getAttribute("speed")).floatValue();
            movingActor.setSpeed(f);
        }
        if (tXElement.getAttribute("save").equals("true")) {
            this.mySaver.addActor(movingActor);
        }
        try {
            movingActor.setLocation(Float.valueOf(tXElement.getAttribute("x")).floatValue(), Float.valueOf(tXElement.getAttribute("y")).floatValue(), Float.valueOf(tXElement.getAttribute("z")).floatValue());
        }
        catch (InvalidPositionException invalidPositionException) {
            System.out.println("InvalidPositionException caught\t: " + tXElement.getAttribute("name"));
            System.exit(0);
        }
        if (!tXElement.getAttribute("terrain").equals("")) {
            movingActor.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        } else {
            movingActor.setTerrain(null);
        }
        movingActor.setState(tXElement.getAttribute("state"));
        Walker walker = new Walker();
        movingActor.setFaceSwitcher(walker);
        if (!tXElement.getAttribute("collision").equals("")) {
            object = new ActionCollision();
            movingActor.addActorCollisionListener((ActorCollisionListener)object);
            this.put(tXElement.getAttribute("collision"), object);
        }
        if (tXElement.getAttribute("random").equals("true")) {
            movingActor.setRandom(true);
        }
        object = tXElement.getAttribute("name");
        movingActor.setName((String)object);
        this.put(object, movingActor);
    }

    private void createStateController(TXElement tXElement) {
        StateController stateController = new StateController(this.world, (StaticActor)this.get(tXElement.getAttribute("stateactor")), (StaticActor)this.get(tXElement.getAttribute("inventoryactor")), (StaticActor)this.get(tXElement.getAttribute("textactor")));
        stateController.setInventoryScene((Scene)this.get(tXElement.getAttribute("inventory")));
        this.put(tXElement.getAttribute("name"), stateController);
        this.currentSC = stateController;
        ActionTalk actionTalk = new ActionTalk();
        stateController.setTalker(actionTalk);
        this.put("action_talk", actionTalk);
        ActionTake actionTake = new ActionTake();
        stateController.setTaker(actionTake);
        this.put("action_take", actionTake);
        ActionLook actionLook = new ActionLook();
        stateController.setLooker(actionLook);
        this.put("action_look", actionLook);
        ActionUse actionUse = new ActionUse();
        stateController.setUser(actionUse);
        this.put("action_use", actionUse);
    }

    private void createActorMoused(TXElement tXElement) {
        ((Actor)this.get(tXElement.getAttribute("actor"))).addActorMouseListener((ActorMouseListener)this.get(tXElement.getAttribute("listener")));
        if (!tXElement.getAttribute("moving").equals("")) {
            ((StateController)this.get(tXElement.getAttribute("listener"))).setMovingDescription((Actor)this.get(tXElement.getAttribute("actor")), tXElement.getAttribute("moving"));
        }
        if (!tXElement.getAttribute("thf").equals("")) {
            ((StateController)this.get(tXElement.getAttribute("listener"))).setTholfall((Actor)this.get(tXElement.getAttribute("actor")), tXElement.getAttribute("thf"));
        }
        if (!tXElement.getAttribute("looking").equals("")) {
            ((StateController)this.get(tXElement.getAttribute("listener"))).setLookingDescription((Actor)this.get(tXElement.getAttribute("actor")), tXElement.getAttribute("looking"));
        }
        if (!tXElement.getAttribute("talking").equals("")) {
            ((StateController)this.get(tXElement.getAttribute("listener"))).setTalkingDescription((Actor)this.get(tXElement.getAttribute("actor")), tXElement.getAttribute("talking"));
        }
        if (!tXElement.getAttribute("taking").equals("")) {
            ((StateController)this.get(tXElement.getAttribute("listener"))).setTakingDescription((Actor)this.get(tXElement.getAttribute("actor")), tXElement.getAttribute("taking"));
        }
    }

    private void createUseText(TXElement tXElement) {
        ((StateController)this.get(tXElement.getAttribute("listener"))).setUsingDescription((Actor)this.get(tXElement.getAttribute("actor")), (Actor)this.get(tXElement.getAttribute("actor2")), tXElement.getAttribute("text"));
    }

    private void createSequence(TXElement tXElement) {
        Sequence sequence = new Sequence();
        NodeList nodeList = tXElement.getElementsNamed("Quantum");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            sequence.add((Quantum)this.get(tXElement2.getAttribute("name")));
            ++n;
        }
        sequence.setName(tXElement.getAttribute("name"));
        this.put(tXElement.getAttribute("name"), sequence);
    }

    private void createReaction(TXElement tXElement) {
        if (tXElement.getAttribute("actor2").equals("")) {
            ((ActionReactor)this.get(tXElement.getAttribute("reactor"))).setReaction((Actor)this.get(tXElement.getAttribute("actor")), (Sequence)this.get(tXElement.getAttribute("seq")));
        } else {
            ((ActionDoubleReactor)this.get(tXElement.getAttribute("reactor"))).setReaction((Actor)this.get(tXElement.getAttribute("actor")), (Actor)this.get(tXElement.getAttribute("actor2")), (Sequence)this.get(tXElement.getAttribute("seq")));
        }
    }

    private void createPrepareQuantum(TXElement tXElement) {
        PrepareQuantum prepareQuantum = new PrepareQuantum();
        prepareQuantum.setPreparable((Preparable)this.get(tXElement.getAttribute("object")));
        if (tXElement.getAttribute("prepare").equals("true")) {
            prepareQuantum.setPrepare(true);
        } else {
            prepareQuantum.setPrepare(false);
        }
        this.put(tXElement.getAttribute("name"), prepareQuantum);
    }

    private void createSwitchSceneQuantum(TXElement tXElement) {
        SwitchSceneQuantum switchSceneQuantum = new SwitchSceneQuantum();
        switchSceneQuantum.setWorld(this.timaflakkarinn.getWorld());
        switchSceneQuantum.setScene((Scene)this.get(tXElement.getAttribute("scene")));
        this.put(tXElement.getAttribute("name"), switchSceneQuantum);
    }

    private void createSwitchStateQuantum(TXElement tXElement) {
        SwitchStateQuantum switchStateQuantum = new SwitchStateQuantum();
        StateController stateController = (StateController)this.get(tXElement.getAttribute("controller"));
        switchStateQuantum.setStateController(stateController);
        String string = tXElement.getAttribute("state");
        if (string.equals("Moving")) {
            switchStateQuantum.setState(0);
        }
        if (string.equals("Taking")) {
            switchStateQuantum.setState(1);
        }
        if (string.equals("Looking")) {
            switchStateQuantum.setState(2);
        }
        if (string.equals("Talking")) {
            switchStateQuantum.setState(3);
        }
        if (string.equals("Freeze")) {
            switchStateQuantum.setState(4);
        }
        if (string.equals("Using")) {
            switchStateQuantum.setState(5);
        }
        if (string.equals("Conversating")) {
            switchStateQuantum.setState(6);
        }
        this.put(tXElement.getAttribute("name"), switchStateQuantum);
    }

    private void createStateQuantum(TXElement tXElement) {
        StateQuantum stateQuantum = new StateQuantum();
        stateQuantum.setState(tXElement.getAttribute("state"));
        stateQuantum.setActor((Actor)this.get(tXElement.getAttribute("actor")));
        if (tXElement.getAttribute("wait").equals("true")) {
            stateQuantum.setWait(true);
        } else {
            stateQuantum.setWait(false);
        }
        this.put(tXElement.getAttribute("name"), stateQuantum);
    }

    private void createUpdateQuantum(TXElement tXElement) {
        UpdateQuantum updateQuantum = new UpdateQuantum();
        updateQuantum.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        if (tXElement.getAttribute("show").equals("true")) {
            updateQuantum.setShow(true);
        } else {
            updateQuantum.setShow(false);
        }
        this.put(tXElement.getAttribute("name"), updateQuantum);
    }

    private void createMoveTerrainQuantum(TXElement tXElement) {
        MoveTerrainQuantum moveTerrainQuantum = new MoveTerrainQuantum();
        moveTerrainQuantum.setScene((Scene)this.get(tXElement.getAttribute("scene")));
        moveTerrainQuantum.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        this.put(tXElement.getAttribute("name"), moveTerrainQuantum);
    }

    private void createStopActorQuantum(TXElement tXElement) {
        StopActorQuantum stopActorQuantum = new StopActorQuantum();
        stopActorQuantum.setActor((MovingActor)this.get(tXElement.getAttribute("actor")));
        this.put(tXElement.getAttribute("name"), stopActorQuantum);
    }

    private void createMoveActorQuantum(TXElement tXElement) {
        MoveActorQuantum moveActorQuantum = new MoveActorQuantum();
        moveActorQuantum.setActor((Actor)this.get(tXElement.getAttribute("actor")));
        if (!tXElement.getAttribute("terrain").equals("")) {
            moveActorQuantum.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        } else {
            moveActorQuantum.setTerrain(null);
        }
        TXElement tXElement2 = tXElement.getElementNamed("Location");
        if (tXElement2 != null) {
            moveActorQuantum.setLocation(new Float3DPoint(Float.valueOf(tXElement2.getAttribute("x")).floatValue(), Float.valueOf(tXElement2.getAttribute("y")).floatValue(), Float.valueOf(tXElement2.getAttribute("z")).floatValue()));
        } else {
            moveActorQuantum.setLocation(null);
        }
        this.put(tXElement.getAttribute("name"), moveActorQuantum);
    }

    private void createSetDestinationQuantum(TXElement tXElement) {
        SetDestinationQuantum setDestinationQuantum = new SetDestinationQuantum();
        setDestinationQuantum.setActor((MovingActor)this.get(tXElement.getAttribute("actor")));
        setDestinationQuantum.setDestination(new Float3DPoint(Float.valueOf(tXElement.getAttribute("x")).floatValue(), Float.valueOf(tXElement.getAttribute("y")).floatValue(), 0.0f));
        if (!tXElement.getAttribute("speed").equals("")) {
            setDestinationQuantum.setSpeed(Float.valueOf(tXElement.getAttribute("speed")).floatValue());
        }
        if (tXElement.getAttribute("wait").equals("true")) {
            setDestinationQuantum.setWait(true);
        } else {
            setDestinationQuantum.setWait(false);
        }
        this.put(tXElement.getAttribute("name"), setDestinationQuantum);
    }

    private void createSetSpeedQuantum(TXElement tXElement) {
        SetSpeedQuantum setSpeedQuantum = new SetSpeedQuantum();
        setSpeedQuantum.setActor((MovingActor)this.get(tXElement.getAttribute("actor")));
        setSpeedQuantum.setSpeed(Float.valueOf(tXElement.getAttribute("speed")).floatValue());
        this.put(tXElement.getAttribute("name"), setSpeedQuantum);
    }

    private void createThemeFinishedQuantum(TXElement tXElement) {
        ThemeFinishedQuantum themeFinishedQuantum = new ThemeFinishedQuantum();
        themeFinishedQuantum.setFinishingReactor(this.timaflakkarinn);
        this.put(tXElement.getAttribute("name"), themeFinishedQuantum);
    }

    private void createGuessQuantum(TXElement tXElement) {
        GuessQuantum guessQuantum = new GuessQuantum(this.timaflakkarinn);
        this.put(tXElement.getAttribute("name"), guessQuantum);
    }

    private void createFadeQuantum(TXElement tXElement) {
        FadeQuantum fadeQuantum = new FadeQuantum();
        fadeQuantum.setMouth((ActorMouth)this.get(tXElement.getAttribute("mouth")));
        fadeQuantum.setGoalVolume(Float.valueOf(tXElement.getAttribute("goal")).floatValue() * 100.0f);
        if (!tXElement.getAttribute("speed").equals("")) {
            fadeQuantum.setSpeed(Integer.parseInt(tXElement.getAttribute("speed")));
        }
        this.put(tXElement.getAttribute("name"), fadeQuantum);
    }

    private void createPauseQuantum(TXElement tXElement) {
        PauseQuantum pauseQuantum = new PauseQuantum();
        if (!tXElement.getAttribute("time").equals("")) {
            pauseQuantum.setPauseTime(Long.parseLong(tXElement.getAttribute("time")));
        }
        this.put(tXElement.getAttribute("name"), pauseQuantum);
    }

    private void createConditionFlag(TXElement tXElement) {
        ConditionFlag conditionFlag = new ConditionFlag();
        conditionFlag.value = new Integer(0);
        if (tXElement.getAttribute("save").equals("true")) {
            this.mySaver.addFlag(conditionFlag);
        }
        String string = tXElement.getAttribute("name");
        conditionFlag.setName(string);
        this.put(string, conditionFlag);
    }

    private void createCheckConditionQuantum(TXElement tXElement) {
        CheckConditionQuantum checkConditionQuantum = new CheckConditionQuantum();
        checkConditionQuantum.setFlag((ConditionFlag)this.get(tXElement.getAttribute("flag")));
        NodeList nodeList = tXElement.getElementsNamed("Trigger");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            checkConditionQuantum.setReaction(Integer.valueOf(tXElement2.getAttribute("value")), (Sequence)this.get(tXElement2.getAttribute("seq")));
            ++n;
        }
        if (tXElement.getAttribute("wait").equals("true")) {
            checkConditionQuantum.setWait(true);
        } else {
            checkConditionQuantum.setWait(false);
        }
        this.put(tXElement.getAttribute("name"), checkConditionQuantum);
    }

    private void createIncrementFlagQuantum(TXElement tXElement) {
        IncrementFlagQuantum incrementFlagQuantum = new IncrementFlagQuantum();
        incrementFlagQuantum.setFlag((ConditionFlag)this.get(tXElement.getAttribute("flag")));
        this.put(tXElement.getAttribute("name"), incrementFlagQuantum);
    }

    private void createRandomSetFlagQuantum(TXElement tXElement) {
        RandomSetFlagQuantum randomSetFlagQuantum = new RandomSetFlagQuantum();
        randomSetFlagQuantum.setFlag((ConditionFlag)this.get(tXElement.getAttribute("flag")));
        randomSetFlagQuantum.setLowHigh(Integer.parseInt(tXElement.getAttribute("low")), Integer.parseInt(tXElement.getAttribute("high")));
        this.put(tXElement.getAttribute("name"), randomSetFlagQuantum);
    }

    private void createDecrementFlagQuantum(TXElement tXElement) {
        DecrementFlagQuantum decrementFlagQuantum = new DecrementFlagQuantum();
        decrementFlagQuantum.setFlag((ConditionFlag)this.get(tXElement.getAttribute("flag")));
        this.put(tXElement.getAttribute("name"), decrementFlagQuantum);
    }

    private void createSetFlagQuantum(TXElement tXElement) {
        SetFlagQuantum setFlagQuantum = new SetFlagQuantum();
        setFlagQuantum.setFlag((ConditionFlag)this.get(tXElement.getAttribute("flag")));
        setFlagQuantum.setValue(Integer.valueOf(tXElement.getAttribute("value")));
        this.put(tXElement.getAttribute("name"), setFlagQuantum);
    }

    private void createSetPlayer(TXElement tXElement) {
        Object object = this.get(tXElement.getAttribute("object"));
        if (object instanceof StateController) {
            ((StateController)object).setPlayer((MovingActor)this.get(tXElement.getAttribute("player")));
        }
        if (object instanceof ScrollingScene) {
            ((ScrollingScene)object).setMainActor((MovingActor)this.get(tXElement.getAttribute("player")));
        }
    }

    public TTParser(Pulser pulser) {
        this.pulser = pulser;
    }

    public TTParser(World world, Pulser pulser) {
        this(pulser);
        this.world = world;
    }

    public TTParser(World world, String string, String string2, Pulser pulser, Saver saver) {
        this(world, pulser);
        this.gmlRoot = string;
        this.resourceRoot = string2;
        this.mySaver = saver;
    }

    public TTParser(World world, String string, String string2, Hashtable hashtable, Pulser pulser, Saver saver) {
        this(world, string, string2, pulser, saver);
        this.container = hashtable;
    }
}
