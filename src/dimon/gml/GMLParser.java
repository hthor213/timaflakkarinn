/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.ibm.xml.parser.Parser
 *  com.ibm.xml.parser.TXDocument
 *  com.ibm.xml.parser.TXElement
 *  is.dimon.talnapukinn.ScreenFinishedQuantum
 *  is.dimon.talnapukinn.Talnapukinn
 */
package is.dimon.gml;

import com.ibm.xml.parser.Parser;
import com.ibm.xml.parser.TXDocument;
import com.ibm.xml.parser.TXElement;
import is.dimon.agt.Actor;
import is.dimon.agt.ActorFace;
import is.dimon.agt.ActorMouth;
import is.dimon.agt.AnimatedActorFace;
import is.dimon.agt.CelledAnimated2DActorFace;
import is.dimon.agt.CollisionBox;
import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.MovingActor;
import is.dimon.agt.Preparable;
import is.dimon.agt.Pulser;
import is.dimon.agt.Scene;
import is.dimon.agt.SimpleActorMouth;
import is.dimon.agt.SimplePseudo3DTerrain;
import is.dimon.agt.SpeechActorMouth;
import is.dimon.agt.StaticActor;
import is.dimon.agt.StaticActorFace;
import is.dimon.agt.Terrain;
import is.dimon.agt.TextActorFace;
import is.dimon.agt.World;
import is.dimon.agt.action.ActorCollisionReactor;
import is.dimon.agt.action.ActorMouseReactor;
import is.dimon.agt.action.ActorMovementReactor;
import is.dimon.agt.action.ActorStateChangeReactor;
import is.dimon.agt.action.ActorTerrainChangeReactor;
import is.dimon.agt.action.AnimationFinishedReactor;
import is.dimon.agt.action.CheckConditionQuantum;
import is.dimon.agt.action.ConditionFlag;
import is.dimon.agt.action.CursorQuantum;
import is.dimon.agt.action.DecrementFlagQuantum;
import is.dimon.agt.action.ExitQuantum;
import is.dimon.agt.action.FadeQuantum;
import is.dimon.agt.action.FastForwardSequenceQuantum;
import is.dimon.agt.action.FreezeSequenceQuantum;
import is.dimon.agt.action.GroupObjectQuantum;
import is.dimon.agt.action.Groups;
import is.dimon.agt.action.IncrementFlagQuantum;
import is.dimon.agt.action.MouthFinishedReactor;
import is.dimon.agt.action.MoveActorQuantum;
import is.dimon.agt.action.MoveTerrainQuantum;
import is.dimon.agt.action.MovingActorDestinationReachedReactor;
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
import is.dimon.agt.action.StopSequenceQuantum;
import is.dimon.agt.action.SubSequenceQuantum;
import is.dimon.agt.action.SwitchSceneQuantum;
import is.dimon.agt.action.WorldSceneChangeReactor;
import is.dimon.nemesis.draw.Color24;
import is.dimon.talnapukinn.ScreenFinishedQuantum;
import is.dimon.talnapukinn.Talnapukinn;
import is.dimon.util.Hashtable;
import java.awt.Polygon;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class GMLParser {
    protected String gmlRoot;
    protected String resourceRoot;
    protected Talnapukinn talnapukinn;
    protected Hashtable container;
    private FileInputStream is;
    private boolean stopParsing = false;
    protected World world;
    protected Pulser pulser;
    private char sep;
    private char backSlash;

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

    public void setTalnapukinn(Talnapukinn talnapukinn) {
        this.talnapukinn = talnapukinn;
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
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void parseGMLFile(String string) {
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
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void parseDoc(TXDocument tXDocument) {
        TXElement tXElement = (TXElement)tXDocument.getDocumentElement();
        Enumeration enumeration = tXElement.elements();
        while (enumeration.hasMoreElements()) {
            String string;
            if (this.stopParsing) {
                return;
            }
            Node node = (Node)enumeration.nextElement();
            if (!(node instanceof TXElement)) continue;
            TXElement tXElement2 = (TXElement)node;
            String string2 = tXElement2.getTagName();
            if (string2.equals("Scene")) {
                string = tXElement2.getAttribute("type");
                if (string.equals("standard")) {
                    this.createScene(tXElement2);
                    continue;
                }
                if (string.equals("scrolling")) continue;
                continue;
            }
            if (string2.equals("Terrain")) {
                this.createTerrain(tXElement2);
                continue;
            }
            if (string2.equals("ActorFace")) {
                string = tXElement2.getAttribute("type");
                if (string.equals("static")) {
                    this.createStaticActorFace(tXElement2);
                    continue;
                }
                if (string.equals("celledAnimated2D")) {
                    this.createCelledAnimated2DActorFace(tXElement2);
                    continue;
                }
                if (!string.equals("text")) continue;
                this.createTextActorFace(tXElement2);
                continue;
            }
            if (string2.equals("Actor")) {
                string = tXElement2.getAttribute("type");
                if (string.equals("static")) {
                    this.createStaticActor(tXElement2);
                    continue;
                }
                if (!string.equals("moving")) continue;
                this.createMovingActor(tXElement2);
                continue;
            }
            if (string2.equals("ActorMouth")) {
                string = tXElement2.getAttribute("type");
                if (string.equals("simple")) {
                    this.createSimpleActorMouth(tXElement2);
                    continue;
                }
                if (!string.equals("speech")) continue;
                this.createSpeechActorMouth(tXElement2);
                continue;
            }
            if (string2.equals("CollisionBox")) continue;
            if (string2.equals("Quantum")) {
                string = tXElement2.getAttribute("type");
                if (string.equals("prepare")) {
                    this.createPrepareQuantum(tXElement2);
                    continue;
                }
                if (string.equals("state")) {
                    this.createStateQuantum(tXElement2);
                    continue;
                }
                if (string.equals("switchScene")) {
                    this.createSwitchSceneQuantum(tXElement2);
                    continue;
                }
                if (string.equals("moveActor")) {
                    this.createMoveActorQuantum(tXElement2);
                    continue;
                }
                if (string.equals("setDestination")) {
                    this.createSetDestinationQuantum(tXElement2);
                    continue;
                }
                if (string.equals("setActorSpeed")) {
                    this.createSetSpeedQuantum(tXElement2);
                    continue;
                }
                if (string.equals("groupObject")) {
                    this.createGroupObjectQuantum(tXElement2);
                    continue;
                }
                if (string.equals("moveTerrain")) {
                    this.createMoveTerrainQuantum(tXElement2);
                    continue;
                }
                if (string.equals("incrementFlag")) {
                    this.createIncrementFlagQuantum(tXElement2);
                    continue;
                }
                if (string.equals("decrementFlag")) {
                    this.createDecrementFlagQuantum(tXElement2);
                    continue;
                }
                if (string.equals("setFlagValue")) {
                    this.createSetFlagQuantum(tXElement2);
                    continue;
                }
                if (string.equals("randomSetFlagValue")) {
                    this.createRandomSetFlagQuantum(tXElement2);
                    continue;
                }
                if (string.equals("fadeMouth")) {
                    this.createFadeQuantum(tXElement2);
                    continue;
                }
                if (string.equals("subSequence")) {
                    this.createSubSequenceQuantum(tXElement2);
                    continue;
                }
                if (string.equals("method")) continue;
                if (string.equals("cursor")) {
                    this.createCursorQuantum(tXElement2);
                    continue;
                }
                if (string.equals("checkCondition")) {
                    this.createCheckConditionQuantum(tXElement2);
                    continue;
                }
                if (string.equals("exit")) {
                    this.createExitQuantum(tXElement2);
                    continue;
                }
                if (string.equals("pause")) {
                    this.createPauseQuantum(tXElement2);
                    continue;
                }
                if (string.equals("freezeSequence")) {
                    this.createFreezeSequenceQuantum(tXElement2);
                    continue;
                }
                if (string.equals("fastForwardSequence")) {
                    this.createFastForwardSequenceQuantum(tXElement2);
                    continue;
                }
                if (string.equals("stopSequence")) {
                    this.createStopSequenceQuantum(tXElement2);
                    continue;
                }
                if (!string.equals("stopActor")) continue;
                this.createStopActorQuantum(tXElement2);
                continue;
            }
            if (string2.equals("Sequence")) {
                this.createSequence(tXElement2);
                continue;
            }
            if (string2.equals("ConditionFlag")) {
                this.createConditionFlag(tXElement2);
                continue;
            }
            if (!string2.equals("Reactor")) continue;
            string = tXElement2.getAttribute("type");
            if (string.equals("actorMouse")) {
                this.createActorMouseReactor(tXElement2);
                continue;
            }
            if (string.equals("actorMovement")) {
                this.createActorMovementReactor(tXElement2);
                continue;
            }
            if (string.equals("actorCollision")) {
                this.createActorCollisionReactor(tXElement2);
                continue;
            }
            if (string.equals("actorTerrainChange")) {
                this.createActorTerrainChangeReactor(tXElement2);
                continue;
            }
            if (string.equals("animationFinished")) {
                this.createAnimationFinishedReactor(tXElement2);
                continue;
            }
            if (string.equals("actorStateChange")) {
                this.createActorStateChangeReactor(tXElement2);
                continue;
            }
            if (string.equals("mouthFinished")) {
                this.createMouthFinishedReactor(tXElement2);
                continue;
            }
            if (string.equals("movingActorDestinationReached")) {
                this.createMovingActorDestinationReachedReactor(tXElement2);
                continue;
            }
            if (!string.equals("worldSceneChange")) continue;
            this.createWorldSceneChangeReactor(tXElement2);
        }
        try {
            this.is.close();
            return;
        }
        catch (IOException iOException) {
            System.out.println("Error while\ttrying to close\tfile: ");
        }
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
        scene.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), scene);
        }
        this.put(string, scene);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createTerrain(TXElement tXElement) {
        try {
            Object object;
            String string;
            Object object2;
            String string2;
            String string3;
            String string4;
            Polygon polygon = new Polygon();
            NodeList nodeList = tXElement.getElementsNamed("Object");
            int n = 0;
            while (n < nodeList.getLength()) {
                string4 = (TXElement)nodeList.item(n);
                string3 = null;
                string2 = null;
                object2 = string4.getElementsNamed("Attribute");
                int n2 = 0;
                while (n2 < object2.getLength()) {
                    string = (TXElement)object2.item(n2);
                    if (string.getAttribute("name").equals("x")) {
                        string3 = string.getAttribute("value");
                    } else if (string.getAttribute("name").equals("y")) {
                        string2 = string.getAttribute("value");
                    }
                    ++n2;
                }
                try {
                    polygon.addPoint(Integer.parseInt(string3), Integer.parseInt(string2));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING: NumberFormatException caught while trying to create terrain: " + tXElement.getAttribute("name"));
                }
                ++n;
            }
            String string5 = "-10";
            string4 = "-5";
            string3 = "100";
            string2 = "200";
            object2 = "1.0";
            String string6 = "1.0";
            string = "true";
            nodeList = tXElement.getElementsNamed("Attribute");
            int n3 = 0;
            while (n3 < nodeList.getLength()) {
                object = (TXElement)nodeList.item(n3);
                if (object.getAttribute("name").equals("zmin")) {
                    string5 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("zmax")) {
                    string4 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("focalY")) {
                    string3 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("referenceY")) {
                    string2 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("referenceYScaling")) {
                    object2 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("scaling")) {
                    string6 = object.getAttribute("value");
                } else if (object.getAttribute("name").equals("scrolling")) {
                    string = object.getAttribute("value");
                } else {
                    System.out.println("WARNING: Unrecognized attribute encountered while trying to create terrain: " + tXElement.getAttribute("name"));
                    System.out.println("WARNING: The alien name was: " + object.getAttribute("name") + " with value: " + object.getAttribute("value"));
                }
                ++n3;
            }
            SimplePseudo3DTerrain simplePseudo3DTerrain = new SimplePseudo3DTerrain((Scene)this.get(tXElement.getAttribute("scene")), polygon, Integer.parseInt(string5), Integer.parseInt(string4));
            if (!string6.equals("1.0")) {
                try {
                    simplePseudo3DTerrain.setDefaultScaling(Float.valueOf(string6).floatValue());
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING: NumberFormatException caught while trying to create default scaling for terrain: " + tXElement.getAttribute("name"));
                }
            }
            if (!((String)object2).equals("1.0")) {
                try {
                    simplePseudo3DTerrain.setScalingParameters(Float.valueOf(string3).floatValue(), Float.valueOf(string2).floatValue(), Float.valueOf((String)object2).floatValue());
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING: NumberFormatException caught while trying to create scaling for terrain: " + tXElement.getAttribute("name"));
                }
            }
            if (string.equals("false")) {
                simplePseudo3DTerrain.setScrolling(false);
            }
            object = tXElement.getAttribute("name");
            simplePseudo3DTerrain.setName((String)object);
            if (!tXElement.getAttribute("group").equals("")) {
                Groups.add(tXElement.getAttribute("group"), simplePseudo3DTerrain);
            }
            this.put(object, simplePseudo3DTerrain);
            return;
        }
        catch (NumberFormatException numberFormatException) {
            System.err.println("WARNING: NumberFormatException caught while trying to create terrain: " + tXElement.getAttribute("name"));
        }
    }

    protected void createStaticActorFace(TXElement tXElement) {
        StaticActorFace staticActorFace = new StaticActorFace();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        String string = "0";
        String string2 = "0";
        boolean bl = false;
        String string3 = null;
        String string4 = null;
        boolean bl2 = false;
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("file")) {
                staticActorFace.setBaseImage(this.resourceRoot + this.adaptPath(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("transparent")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    staticActorFace.setTransparent(true);
                }
            } else if (tXElement2.getAttribute("name").equals("transparency")) {
                if (tXElement2.getAttribute("value").equals("false")) {
                    staticActorFace.setTransparentColor(null);
                }
            } else if (tXElement2.getAttribute("name").equals("xOffset")) {
                string = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("yOffset")) {
                string2 = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("width")) {
                string4 = tXElement2.getAttribute("value");
                bl2 = true;
            } else if (tXElement2.getAttribute("name").equals("height")) {
                string3 = tXElement2.getAttribute("value");
                bl2 = true;
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create StaticActorFace: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        if (bl) {
            staticActorFace.setOffset(Integer.parseInt(string), Integer.parseInt(string2));
        }
        if (bl2 && staticActorFace.getTransparent()) {
            staticActorFace.setImageSize(Integer.parseInt(string4), Integer.parseInt(string3));
        }
        String string5 = tXElement.getAttribute("name");
        staticActorFace.setName(string5);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), staticActorFace);
        }
        this.put(string5, staticActorFace);
    }

    protected void createTextActorFace(TXElement tXElement) {
        TextActorFace textActorFace = new TextActorFace();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        String string = "0";
        String string2 = "0";
        String string3 = "0";
        boolean bl = false;
        String string4 = "0";
        String string5 = "0";
        String string6 = "0";
        boolean bl2 = false;
        String string7 = "0";
        String string8 = "0";
        boolean bl3 = false;
        int n = 0;
        while (n < nodeList.getLength()) {
            String string9;
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("color")) {
                string9 = tXElement2.getAttribute("value");
                if (string9.equals("yellow")) {
                    textActorFace.setColor(new Color24(255, 255, 0));
                } else if (string9.equals("red")) {
                    textActorFace.setColor(new Color24(255, 0, 0));
                } else if (string9.equals("blue")) {
                    textActorFace.setColor(new Color24(0, 0, 255));
                } else if (string9.equals("green")) {
                    textActorFace.setColor(new Color24(0, 255, 0));
                } else if (string9.equals("yellow")) {
                    textActorFace.setColor(new Color24(255, 255, 0));
                } else if (string9.equals("cyan")) {
                    textActorFace.setColor(new Color24(0, 255, 255));
                } else if (string9.equals("magenta")) {
                    textActorFace.setColor(new Color24(255, 0, 255));
                } else if (string9.equals("black")) {
                    textActorFace.setColor(new Color24(0, 0, 0));
                } else if (string9.equals("white")) {
                    textActorFace.setColor(new Color24(255, 255, 255));
                } else {
                    System.out.println("Warning: GMLParser encountered unsupported color when trying to give TextActorFace: " + tXElement.getAttribute("name") + " it's color");
                }
            } else if (tXElement2.getAttribute("name").equals("highlightColor")) {
                string9 = tXElement2.getAttribute("value");
                if (string9.equals("yellow")) {
                    textActorFace.setHighlightColor(new Color24(255, 255, 0));
                } else if (string9.equals("red")) {
                    textActorFace.setHighlightColor(new Color24(255, 0, 0));
                } else if (string9.equals("blue")) {
                    textActorFace.setHighlightColor(new Color24(0, 0, 255));
                } else if (string9.equals("red")) {
                    textActorFace.setHighlightColor(new Color24(255, 0, 0));
                } else if (string9.equals("green")) {
                    textActorFace.setHighlightColor(new Color24(0, 255, 0));
                } else if (string9.equals("cyan")) {
                    textActorFace.setHighlightColor(new Color24(0, 255, 255));
                } else if (string9.equals("magenta")) {
                    textActorFace.setHighlightColor(new Color24(255, 0, 255));
                } else if (string9.equals("black")) {
                    textActorFace.setHighlightColor(new Color24(0, 0, 0));
                } else if (string9.equals("white")) {
                    textActorFace.setHighlightColor(new Color24(255, 255, 255));
                } else {
                    System.out.println("Warning: GMLParser encountered unsupported color when trying to give TextActorFace: " + tXElement.getAttribute("name") + " it's highlightColor");
                }
            } else if (tXElement2.getAttribute("name").equals("text")) {
                textActorFace.setText(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("red")) {
                string = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("green")) {
                string2 = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("blue")) {
                string3 = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("hred")) {
                string4 = tXElement2.getAttribute("value");
                bl2 = true;
            } else if (tXElement2.getAttribute("name").equals("hgreen")) {
                string5 = tXElement2.getAttribute("value");
                bl2 = true;
            } else if (tXElement2.getAttribute("name").equals("hblue")) {
                string6 = tXElement2.getAttribute("value");
                bl2 = true;
            } else if (tXElement2.getAttribute("name").equals("highlight")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    textActorFace.setHighlighted(true);
                }
            } else if (tXElement2.getAttribute("name").equals("xOffset")) {
                string7 = tXElement2.getAttribute("value");
                bl3 = true;
            } else if (tXElement2.getAttribute("name").equals("yOffset")) {
                string8 = tXElement2.getAttribute("value");
                bl3 = true;
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create TextActorFace: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        if (bl3) {
            textActorFace.setOffset(Integer.parseInt(string7), Integer.parseInt(string8));
        }
        if (bl) {
            textActorFace.setColor(new Color24(Float.valueOf(string).floatValue(), Float.valueOf(string2).floatValue(), Float.valueOf(string3).floatValue()));
        }
        if (bl2) {
            textActorFace.setHighlightColor(new Color24(Float.valueOf(string4).floatValue(), Float.valueOf(string5).floatValue(), Float.valueOf(string6).floatValue()));
        }
        String string10 = tXElement.getAttribute("name");
        textActorFace.setName(string10);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), textActorFace);
        }
        this.put(string10, textActorFace);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createCelledAnimated2DActorFace(TXElement tXElement) {
        CelledAnimated2DActorFace celledAnimated2DActorFace = new CelledAnimated2DActorFace(this.pulser);
        this.world.addFreezeListener(celledAnimated2DActorFace);
        String string = "0";
        String string2 = "0";
        boolean bl = false;
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("file")) {
                celledAnimated2DActorFace.setBaseImage(this.resourceRoot + this.adaptPath(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("count")) {
                try {
                    celledAnimated2DActorFace.setFrameCount(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("Error while trying to set frame count while creating animatedFace: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement2.getAttribute("name").equals("xOffset")) {
                string = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("yOffset")) {
                string2 = tXElement2.getAttribute("value");
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("speed")) {
                try {
                    celledAnimated2DActorFace.setAnimationSpeed(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("Error while trying to set animation speed while creating animatedFace: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement2.getAttribute("name").equals("transparency")) {
                if (tXElement2.getAttribute("value").equals("false")) {
                    celledAnimated2DActorFace.setTransparentColor(null);
                }
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    celledAnimated2DActorFace.setRepeatCount(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("Error while trying to set repeat count while creating animatedFace: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement2.getAttribute("name").equals("random")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    celledAnimated2DActorFace.setRandom(true);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create animated face: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        if (bl) {
            celledAnimated2DActorFace.setOffset(Integer.parseInt(string), Integer.parseInt(string2));
        }
        String string3 = tXElement.getAttribute("name");
        celledAnimated2DActorFace.setName(string3);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), celledAnimated2DActorFace);
        }
        this.put(string3, celledAnimated2DActorFace);
    }

    protected void createSimpleActorMouth(TXElement tXElement) {
        SimpleActorMouth simpleActorMouth = new SimpleActorMouth();
        this.world.addFreezeListener(simpleActorMouth);
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            float f;
            String string;
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("file")) {
                simpleActorMouth.setSoundFilePath(this.resourceRoot + this.adaptPath(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("loop")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    simpleActorMouth.setLoop(true);
                }
            } else if (tXElement2.getAttribute("name").equals("volume")) {
                string = tXElement2.getAttribute("value");
                if (this.validateFloat(string) && (f = Float.valueOf(string).floatValue()) >= 0.0f && f < 100.0f) {
                    simpleActorMouth.setVolume(f);
                }
            } else if (tXElement2.getAttribute("name").equals("balance")) {
                string = tXElement2.getAttribute("value");
                if (this.validateFloat(string) && (f = Float.valueOf(string).floatValue()) >= -1.0f && f <= 1.0f) {
                    simpleActorMouth.setBalance(f);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SimpleActorMouth: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        simpleActorMouth.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), simpleActorMouth);
        }
        this.put(string, simpleActorMouth);
    }

    protected void createSpeechActorMouth(TXElement tXElement) {
        Object object;
        Object object2;
        SpeechActorMouth speechActorMouth = new SpeechActorMouth(this.pulser);
        this.world.addFreezeListener(speechActorMouth);
        NodeList nodeList = tXElement.getElementsNamed("Object");
        int n = 0;
        while (n < nodeList.getLength()) {
            object2 = (TXElement)nodeList.item(n);
            object = object2.getElementsNamed("Attribute");
            String string = null;
            long l = 0L;
            int n2 = 0;
            while (n2 < object.getLength()) {
                TXElement tXElement2 = (TXElement)object.item(n2);
                if (tXElement2.getAttribute("name").equals("text")) {
                    string = tXElement2.getAttribute("value");
                } else if (tXElement2.getAttribute("name").equals("time")) {
                    if (this.validateLong(tXElement2.getAttribute("value"))) {
                        l = Long.valueOf(tXElement2.getAttribute("value"));
                    } else {
                        System.out.println("ERROR: Invalid sentence encountered while trying to create SpeechActorMouth: " + tXElement.getAttribute("name"));
                    }
                }
                ++n2;
            }
            speechActorMouth.addSentence(string, l);
            ++n;
        }
        nodeList = tXElement.getElementsNamed("Attribute");
        String string = null;
        object2 = null;
        object = null;
        boolean bl = false;
        int n3 = 0;
        while (n3 < nodeList.getLength()) {
            TXElement tXElement3 = (TXElement)nodeList.item(n3);
            if (tXElement3.getAttribute("name").equals("file")) {
                speechActorMouth.setSoundFilePath(this.resourceRoot + this.adaptPath(tXElement3.getAttribute("value")));
            } else if (tXElement3.getAttribute("name").equals("loop")) {
                if (tXElement3.getAttribute("value").equals("true")) {
                    System.out.println("");
                    System.out.println("WARNING: Loop is set to true in SpeechActorMouth: " + tXElement.getAttribute("name"));
                    System.out.println("Note: Loop has not been changed and is still false");
                    System.out.println("");
                }
            } else if (tXElement3.getAttribute("name").equals("volume")) {
                float f;
                String string2 = tXElement3.getAttribute("value");
                if (this.validateFloat(string2) && (f = Float.valueOf(string2).floatValue()) >= 0.0f && f < 100.0f) {
                    speechActorMouth.setVolume(f);
                }
            } else if (tXElement3.getAttribute("name").equals("balance")) {
                float f;
                String string3 = tXElement3.getAttribute("value");
                if (this.validateFloat(string3) && (f = Float.valueOf(string3).floatValue()) >= -1.0f && f <= 1.0f) {
                    speechActorMouth.setBalance(f);
                }
            } else if (tXElement3.getAttribute("name").equals("updateInterval")) {
                long l;
                String string4 = tXElement3.getAttribute("value");
                if (this.validateLong(string4) && (l = Long.valueOf(string4).longValue()) >= 1L) {
                    speechActorMouth.setPulseInterval(l);
                }
            } else if (tXElement3.getAttribute("name").equals("textFace")) {
                TextActorFace textActorFace = (TextActorFace)this.get(tXElement3.getAttribute("value"));
                if (textActorFace != null) {
                    speechActorMouth.setTextActorFace(textActorFace);
                } else {
                    System.out.println("WARNING: Invalid TextActorFace encountered while trying to create SpeechActorMouth: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement3.getAttribute("name").equals("x")) {
                string = tXElement3.getAttribute("value");
                bl = true;
            } else if (tXElement3.getAttribute("name").equals("y")) {
                object2 = tXElement3.getAttribute("value");
                bl = true;
            } else if (tXElement3.getAttribute("name").equals("z")) {
                object = tXElement3.getAttribute("value");
                bl = true;
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SpeechActorMouth: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement3.getAttribute("name") + " with value: " + tXElement3.getAttribute("value"));
            }
            ++n3;
        }
        if (bl && this.validateFloat(string) && this.validateFloat((String)object2) && this.validateFloat((String)object)) {
            speechActorMouth.setTextMiddle(new Float3DPoint(Float.valueOf(string).floatValue(), Float.valueOf((String)object2).floatValue(), Float.valueOf((String)object).floatValue()));
        }
        String string5 = tXElement.getAttribute("name");
        speechActorMouth.setName(string5);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), speechActorMouth);
        }
        this.put(string5, speechActorMouth);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createStaticActor(TXElement tXElement) {
        Object object;
        String string;
        Object object2;
        StaticActor staticActor = new StaticActor();
        NodeList nodeList = tXElement.getElementsNamed("State");
        int n = 0;
        while (n < nodeList.getLength()) {
            object2 = (TXElement)nodeList.item(n);
            string = object2.getAttribute("name");
            if (!object2.getAttribute("face").equals("")) {
                staticActor.setFace((ActorFace)this.get(object2.getAttribute("face")), string);
            }
            if (!object2.getAttribute("mouth").equals("")) {
                staticActor.setMouth((ActorMouth)this.get(object2.getAttribute("mouth")), string);
            }
            if (!object2.getAttribute("collisionBox").equals("")) {
                staticActor.setCollisionBox((CollisionBox)this.get(object2.getAttribute("collisionBox")), string);
            }
            ++n;
        }
        nodeList = tXElement.getElementsNamed("Attribute");
        String string2 = "0";
        object2 = "0";
        string = "0";
        int n2 = 0;
        while (n2 < nodeList.getLength()) {
            object = (TXElement)nodeList.item(n2);
            if (object.getAttribute("name").equals("x")) {
                string2 = object.getAttribute("value");
            } else if (object.getAttribute("name").equals("y")) {
                object2 = object.getAttribute("value");
            } else if (object.getAttribute("name").equals("z")) {
                string = object.getAttribute("value");
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create animated face: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + object.getAttribute("name") + " with value: " + object.getAttribute("value"));
            }
            ++n2;
        }
        if (!tXElement.getAttribute("terrain").equals("")) {
            staticActor.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        }
        if (!tXElement.getAttribute("state").equals("")) {
            staticActor.setState(tXElement.getAttribute("state"));
        }
        Float3DPoint float3DPoint = new Float3DPoint();
        float3DPoint.x = Float.valueOf(string2).floatValue();
        float3DPoint.y = Float.valueOf((String)object2).floatValue();
        float3DPoint.z = Float.valueOf(string).floatValue();
        try {
            staticActor.setLocation(float3DPoint);
        }
        catch (InvalidPositionException invalidPositionException) {
            System.err.println("WARNING: GMLParser got InvalidPositionException while trying to position StaticActor: " + tXElement.getAttribute("name"));
        }
        object = tXElement.getAttribute("name");
        staticActor.setName((String)object);
        if (!tXElement.getAttribute("group").equals("")) {
            boolean bl = Groups.add(tXElement.getAttribute("group"), staticActor);
        }
        this.put(object, staticActor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createMovingActor(TXElement tXElement) {
        Object object;
        String string;
        Object object2;
        MovingActor movingActor = new MovingActor(this.pulser);
        this.world.addFreezeListener(movingActor);
        NodeList nodeList = tXElement.getElementsNamed("State");
        int n = 0;
        while (n < nodeList.getLength()) {
            object2 = (TXElement)nodeList.item(n);
            string = object2.getAttribute("name");
            if (!object2.getAttribute("face").equals("")) {
                movingActor.setFace((ActorFace)this.get(object2.getAttribute("face")), string);
            }
            if (!object2.getAttribute("mouth").equals("")) {
                movingActor.setMouth((ActorMouth)this.get(object2.getAttribute("mouth")), string);
            }
            if (!object2.getAttribute("collisionBox").equals("")) {
                movingActor.setCollisionBox((CollisionBox)this.get(object2.getAttribute("collisionBox")), string);
            }
            ++n;
        }
        nodeList = tXElement.getElementsNamed("Attribute");
        String string2 = "0";
        object2 = "0";
        string = "0";
        int n2 = 0;
        while (n2 < nodeList.getLength()) {
            block16: {
                block20: {
                    block21: {
                        block19: {
                            block18: {
                                block17: {
                                    block15: {
                                        object = (TXElement)nodeList.item(n2);
                                        if (!object.getAttribute("name").equals("x")) break block15;
                                        string2 = object.getAttribute("value");
                                        break block16;
                                    }
                                    if (!object.getAttribute("name").equals("y")) break block17;
                                    object2 = object.getAttribute("value");
                                    break block16;
                                }
                                if (!object.getAttribute("name").equals("z")) break block18;
                                string = object.getAttribute("value");
                                break block16;
                            }
                            if (!object.getAttribute("name").equals("speed")) break block19;
                            try {
                                movingActor.setSpeed(Float.valueOf(object.getAttribute("value")).floatValue());
                            }
                            catch (NumberFormatException numberFormatException) {
                                System.err.println("Error while trying to set speed while creating MovingActor: " + tXElement.getAttribute("name"));
                            }
                            break block16;
                        }
                        if (!object.getAttribute("name").equals("offStageBehavior")) break block20;
                        if (!object.getAttribute("value").equals("stop")) break block21;
                        movingActor.setOffStageBehavior(0);
                        break block16;
                    }
                    if (object.getAttribute("value").equals("freeze")) {
                        movingActor.setOffStageBehavior(1);
                        break block16;
                    } else if (object.getAttribute("value").equals("move")) {
                        movingActor.setOffStageBehavior(2);
                    }
                    break block16;
                }
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create MovingActor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + object.getAttribute("name") + " with value: " + object.getAttribute("value"));
            }
            ++n2;
        }
        if (!tXElement.getAttribute("terrain").equals("")) {
            movingActor.setTerrain((Terrain)this.get(tXElement.getAttribute("terrain")));
        }
        if (!tXElement.getAttribute("state").equals("")) {
            movingActor.setState(tXElement.getAttribute("state"));
        }
        Float3DPoint float3DPoint = new Float3DPoint();
        float3DPoint.x = Float.valueOf(string2).floatValue();
        float3DPoint.y = Float.valueOf((String)object2).floatValue();
        float3DPoint.z = Float.valueOf(string).floatValue();
        try {
            movingActor.setLocation(float3DPoint);
        }
        catch (InvalidPositionException invalidPositionException) {
            System.err.println("WARNING: GMLParser got InvalidPositionException while trying to position StaticActor: " + tXElement.getAttribute("name"));
        }
        object = tXElement.getAttribute("name");
        movingActor.setName((String)object);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), movingActor);
        }
        this.put(object, movingActor);
    }

    protected void createPrepareQuantum(TXElement tXElement) {
        PrepareQuantum prepareQuantum = new PrepareQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("preparable")) {
                prepareQuantum.setPreparable((Preparable)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("prepare")) {
                if (tXElement2.getAttribute("value").equals("false")) {
                    prepareQuantum.setPrepare(false);
                }
            } else if (tXElement2.getAttribute("name").equals("group")) {
                prepareQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create PrepareQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), prepareQuantum);
        }
        this.put(string, prepareQuantum);
    }

    protected void createIncrementFlagQuantum(TXElement tXElement) {
        IncrementFlagQuantum incrementFlagQuantum = new IncrementFlagQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("flag")) {
                incrementFlagQuantum.setFlag((ConditionFlag)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                incrementFlagQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create IncrementFlagQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), incrementFlagQuantum);
        }
        this.put(string, incrementFlagQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createCheckConditionQuantum(TXElement tXElement) {
        TXElement tXElement2;
        CheckConditionQuantum checkConditionQuantum = new CheckConditionQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Object");
        int n = 0;
        while (n < nodeList.getLength()) {
            tXElement2 = (TXElement)nodeList.item(n);
            NodeList nodeList2 = tXElement2.getElementsNamed("Attribute");
            Sequence sequence = null;
            Integer n2 = new Integer(0);
            int n3 = 0;
            while (n3 < nodeList2.getLength()) {
                block13: {
                    TXElement tXElement3 = (TXElement)nodeList2.item(n3);
                    try {
                        if (tXElement3.getAttribute("name").equals("sequence")) {
                            sequence = (Sequence)this.get(tXElement3.getAttribute("value"));
                            break block13;
                        }
                        if (tXElement3.getAttribute("name").equals("value")) {
                            n2 = Integer.decode(tXElement3.getAttribute("value"));
                        }
                    }
                    catch (NumberFormatException numberFormatException) {
                        System.err.println("Error! GMLParser caught a NumberFormatException while setting trigger in CheckConditionQuantum: " + tXElement.getAttribute("name"));
                    }
                }
                ++n3;
            }
            checkConditionQuantum.setReaction(n2, sequence);
            ++n;
        }
        nodeList = tXElement.getElementsNamed("Attribute");
        n = 0;
        while (n < nodeList.getLength()) {
            tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("flag")) {
                checkConditionQuantum.setFlag((ConditionFlag)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    checkConditionQuantum.setWait(true);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create CheckConditionQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), checkConditionQuantum);
        }
        this.put(string, checkConditionQuantum);
    }

    protected void createDecrementFlagQuantum(TXElement tXElement) {
        DecrementFlagQuantum decrementFlagQuantum = new DecrementFlagQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("flag")) {
                decrementFlagQuantum.setFlag((ConditionFlag)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                decrementFlagQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create DecrementFlagQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), decrementFlagQuantum);
        }
        this.put(string, decrementFlagQuantum);
    }

    protected void createExitQuantum(TXElement tXElement) {
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        if (nodeList.getLength() > 0) {
            ScreenFinishedQuantum screenFinishedQuantum = new ScreenFinishedQuantum();
            screenFinishedQuantum.setTalnapukinn(this.talnapukinn);
            int n = 0;
            while (n < nodeList.getLength()) {
                TXElement tXElement2 = (TXElement)nodeList.item(n);
                if (tXElement2.getAttribute("name").equals("screen")) {
                    screenFinishedQuantum.setScreen(Integer.parseInt(tXElement2.getAttribute("value")));
                } else {
                    System.out.println("WARNING: Unrecognized attribute encountered while trying to create ExitQuantum: " + tXElement.getAttribute("name"));
                    System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
                }
                ++n;
            }
            String string = tXElement.getAttribute("name");
            this.put(string, screenFinishedQuantum);
        } else {
            ExitQuantum exitQuantum = new ExitQuantum();
            exitQuantum.setWorld(this.world);
            this.put(tXElement.getAttribute("name"), exitQuantum);
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createCursorQuantum(TXElement tXElement) {
        CursorQuantum cursorQuantum = new CursorQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("xOffset")) {
                try {
                    cursorQuantum.setXOffset(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.out.println("ERROR: GMLParser caught a NumberFormatException while trying to set xOffset in CursorQuantum with name: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement2.getAttribute("name").equals("yOffset")) {
                try {
                    cursorQuantum.setYOffset(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.out.println("ERROR: GMLParser caught a NumberFormatException while trying to set yOffset in CursorQuantum with name: " + tXElement.getAttribute("name"));
                }
            } else if (tXElement2.getAttribute("name").equals("cursorFileName")) {
                cursorQuantum.setCursorImagePath(this.resourceRoot + this.adaptPath(tXElement2.getAttribute("value")));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create CursorQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), cursorQuantum);
        }
        this.put(string, cursorQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createSetFlagQuantum(TXElement tXElement) {
        SetFlagQuantum setFlagQuantum = new SetFlagQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("flag")) {
                setFlagQuantum.setFlag((ConditionFlag)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                setFlagQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("value")) {
                try {
                    setFlagQuantum.setValue(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.out.println("ERROR: GMLParser caught a NumberFormatException while trying to set flag value in SetFlagQuantum with name: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SetFlagQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), setFlagQuantum);
        }
        this.put(string, setFlagQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createPauseQuantum(TXElement tXElement) {
        PauseQuantum pauseQuantum = new PauseQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("time")) {
                try {
                    pauseQuantum.setPauseTime(Long.valueOf(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.out.println("ERROR: GMLParser caught a NumberFormatException while trying to set pause time in PauseQuantum with name: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create PauseQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), pauseQuantum);
        }
        this.put(string, pauseQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createRandomSetFlagQuantum(TXElement tXElement) {
        RandomSetFlagQuantum randomSetFlagQuantum = new RandomSetFlagQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        String string = "0";
        String string2 = "0";
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("flag")) {
                randomSetFlagQuantum.setFlag((ConditionFlag)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                randomSetFlagQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("low")) {
                string = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("high")) {
                string2 = tXElement2.getAttribute("value");
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create RandomSetFlagQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        try {
            randomSetFlagQuantum.setLowHigh(Integer.parseInt(string), Integer.parseInt(string2));
        }
        catch (NumberFormatException numberFormatException) {
            System.out.println("ERROR: GMLParser caught a NumberFormatException while trying to set high and low value in RandomSetFlagQuantum with name: " + tXElement.getAttribute("name"));
        }
        String string3 = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), randomSetFlagQuantum);
        }
        this.put(string3, randomSetFlagQuantum);
    }

    protected void createGroupObjectQuantum(TXElement tXElement) {
        GroupObjectQuantum groupObjectQuantum = new GroupObjectQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("destinationGroup")) {
                groupObjectQuantum.setDestinationGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("add")) {
                if (tXElement2.getAttribute("value").equals("false")) {
                    groupObjectQuantum.setAdd(false);
                }
            } else if (tXElement2.getAttribute("name").equals("group")) {
                groupObjectQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("object")) {
                groupObjectQuantum.setObject(this.get(tXElement2.getAttribute("value")));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create GroupObjectQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), groupObjectQuantum);
        }
        this.put(string, groupObjectQuantum);
    }

    protected void createSwitchSceneQuantum(TXElement tXElement) {
        SwitchSceneQuantum switchSceneQuantum = new SwitchSceneQuantum();
        switchSceneQuantum.setWorld(this.world);
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("scene")) {
                switchSceneQuantum.setScene((Scene)this.get(tXElement2.getAttribute("value")));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SwitchSceneQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), switchSceneQuantum);
        }
        this.put(string, switchSceneQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createMoveActorQuantum(TXElement tXElement) {
        MoveActorQuantum moveActorQuantum = new MoveActorQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        String string = "0";
        String string2 = "0";
        String string3 = "0";
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                moveActorQuantum.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("terrain")) {
                moveActorQuantum.setTerrain((Terrain)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("x")) {
                string = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("y")) {
                string2 = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("z")) {
                string3 = tXElement2.getAttribute("value");
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create MoveActorQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        try {
            moveActorQuantum.setLocation(new Float3DPoint(Float.valueOf(string).floatValue(), Float.valueOf(string2).floatValue(), Float.valueOf(string3).floatValue()));
        }
        catch (NumberFormatException numberFormatException) {
            System.err.println("ERROR! GMLParser got NumberformatException while trying to create MoveActorQuantum with name: " + tXElement.getAttribute("name"));
        }
        String string4 = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), moveActorQuantum);
        }
        this.put(string4, moveActorQuantum);
    }

    protected void createMoveTerrainQuantum(TXElement tXElement) {
        MoveTerrainQuantum moveTerrainQuantum = new MoveTerrainQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("terrain")) {
                moveTerrainQuantum.setTerrain((Terrain)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("scene")) {
                moveTerrainQuantum.setScene((Scene)this.get(tXElement2.getAttribute("value")));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create MoveTerrainQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), moveTerrainQuantum);
        }
        this.put(string, moveTerrainQuantum);
    }

    protected void createSubSequenceQuantum(TXElement tXElement) {
        SubSequenceQuantum subSequenceQuantum = new SubSequenceQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("sequence")) {
                subSequenceQuantum.setSequence((Sequence)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    subSequenceQuantum.setWait(true);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SubSequenceQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), subSequenceQuantum);
        }
        this.put(string, subSequenceQuantum);
    }

    protected void createFastForwardSequenceQuantum(TXElement tXElement) {
        FastForwardSequenceQuantum fastForwardSequenceQuantum = new FastForwardSequenceQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("sequence")) {
                fastForwardSequenceQuantum.setSequence((Sequence)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    fastForwardSequenceQuantum.setWait(true);
                }
            } else if (tXElement2.getAttribute("name").equals("fastForwardIfIdle")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    fastForwardSequenceQuantum.setFastForwardIfIdle(true);
                }
            } else if (tXElement2.getAttribute("name").equals("group")) {
                fastForwardSequenceQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create FastForwardSequenceQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), fastForwardSequenceQuantum);
        }
        this.put(string, fastForwardSequenceQuantum);
    }

    protected void createFreezeSequenceQuantum(TXElement tXElement) {
        FreezeSequenceQuantum freezeSequenceQuantum = new FreezeSequenceQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("sequence")) {
                freezeSequenceQuantum.setSequence((Sequence)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("freeze")) {
                if (tXElement2.getAttribute("value").equals("false")) {
                    freezeSequenceQuantum.setFreeze(false);
                }
            } else if (tXElement2.getAttribute("name").equals("group")) {
                freezeSequenceQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create FreezeSequenceQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), freezeSequenceQuantum);
        }
        this.put(string, freezeSequenceQuantum);
    }

    protected void createStopSequenceQuantum(TXElement tXElement) {
        StopSequenceQuantum stopSequenceQuantum = new StopSequenceQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("sequence")) {
                stopSequenceQuantum.setSequence((Sequence)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                stopSequenceQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create StopSequenceQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), stopSequenceQuantum);
        }
        this.put(string, stopSequenceQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createSetSpeedQuantum(TXElement tXElement) {
        SetSpeedQuantum setSpeedQuantum = new SetSpeedQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                setSpeedQuantum.setActor((MovingActor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("speed")) {
                try {
                    setSpeedQuantum.setSpeed(Float.valueOf(tXElement2.getAttribute("value")).floatValue());
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING! GMLParser got a numberformatException while trying to give SetSpeedQuantum: " + tXElement.getAttribute("name") + " its speed!");
                }
            } else if (tXElement2.getAttribute("name").equals("group")) {
                setSpeedQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SetSpeedQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), setSpeedQuantum);
        }
        this.put(string, setSpeedQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createSetDestinationQuantum(TXElement tXElement) {
        SetDestinationQuantum setDestinationQuantum = new SetDestinationQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        String string = "0";
        String string2 = "0";
        String string3 = "0";
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                setDestinationQuantum.setActor((MovingActor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("speed")) {
                try {
                    setDestinationQuantum.setSpeed(Float.valueOf(tXElement2.getAttribute("value")).floatValue());
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING! GMLParser got a numberformatException while trying to give SetDestinationQuantum: " + tXElement.getAttribute("name") + " its speed!");
                }
            } else if (tXElement2.getAttribute("name").equals("x")) {
                string = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("y")) {
                string2 = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("z")) {
                string3 = tXElement2.getAttribute("value");
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    setDestinationQuantum.setWait(true);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create SetDestinationQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        try {
            setDestinationQuantum.setDestination(new Float3DPoint(Float.valueOf(string).floatValue(), Float.valueOf(string2).floatValue(), Float.valueOf(string3).floatValue()));
        }
        catch (NumberFormatException numberFormatException) {
            System.err.println("ERROR! GMLParser got NumberformatException while trying to create SetDestinationQuantum with name: " + tXElement.getAttribute("name"));
        }
        String string4 = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), setDestinationQuantum);
        }
        this.put(string4, setDestinationQuantum);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createFadeQuantum(TXElement tXElement) {
        FadeQuantum fadeQuantum = new FadeQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("updateInterval")) {
                try {
                    fadeQuantum.setSpeed(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("WARNING! GMLParser got a numberformatException while trying to give FadeQuantum: " + tXElement.getAttribute("name") + " its speed!");
                }
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (!tXElement2.getAttribute("value").equals("true")) {
                    // empty if block
                }
            } else if (!tXElement2.getAttribute("name").equals("group")) {
                Object object;
                if (tXElement2.getAttribute("name").equals("goalVolume")) {
                    float f;
                    object = tXElement2.getAttribute("value");
                    if (this.validateFloat((String)object) && (f = Float.valueOf((String)object).floatValue()) > 0.0f && f <= 100.0f) {
                        fadeQuantum.setGoalVolume(f);
                    }
                } else if (tXElement2.getAttribute("name").equals("mouth")) {
                    object = (ActorMouth)this.get(tXElement2.getAttribute("value"));
                    if (object != null) {
                        fadeQuantum.setMouth((ActorMouth)object);
                    } else {
                        System.out.println("WARNING: Invalid ActorMouth encountered while trying to create FadeQuantum: " + tXElement.getAttribute("name"));
                    }
                } else {
                    System.out.println("WARNING: Unrecognized attribute encountered while trying to create FadeQuantum: " + tXElement.getAttribute("name"));
                    System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
                }
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), fadeQuantum);
        }
        this.put(string, fadeQuantum);
    }

    protected void createStopActorQuantum(TXElement tXElement) {
        StopActorQuantum stopActorQuantum = new StopActorQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                stopActorQuantum.setActor((MovingActor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                stopActorQuantum.setGroupName(tXElement2.getAttribute("value"));
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create StopActorQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), stopActorQuantum);
        }
        this.put(string, stopActorQuantum);
    }

    protected void createStateQuantum(TXElement tXElement) {
        StateQuantum stateQuantum = new StateQuantum();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                stateQuantum.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("state")) {
                stateQuantum.setState(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("wait")) {
                if (tXElement2.getAttribute("value").equals("true")) {
                    stateQuantum.setWait(true);
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create StateQuantum: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), stateQuantum);
        }
        this.put(string, stateQuantum);
    }

    protected void createSequence(TXElement tXElement) {
        Sequence sequence = new Sequence();
        if (!tXElement.getAttribute("name").equals("s_end")) {
            this.world.addFreezeListener(sequence);
        }
        NodeList nodeList = tXElement.getElementsNamed("QuantumRef");
        int n = 0;
        while (n < nodeList.getLength()) {
            Quantum quantum = (Quantum)this.get(((TXElement)nodeList.item(n)).getAttribute("name"));
            if (quantum != null) {
                sequence.add(quantum);
            } else {
                System.out.println("WARNING! GMLParser found a null QuantumRef while trying to create Sequence: " + tXElement.getAttribute("name"));
            }
            ++n;
        }
        String string = tXElement.getAttribute("name");
        sequence.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), sequence);
        }
        this.put(string, sequence);
    }

    protected void createConditionFlag(TXElement tXElement) {
        ConditionFlag conditionFlag = new ConditionFlag();
        conditionFlag.value = new Integer(0);
        String string = tXElement.getAttribute("name");
        conditionFlag.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), conditionFlag);
        }
        this.put(string, conditionFlag);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createActorMouseReactor(TXElement tXElement) {
        ActorMouseReactor actorMouseReactor = new ActorMouseReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        boolean bl = true;
        boolean bl2 = false;
        boolean bl3 = true;
        int n = 0;
        while (n < nodeList.getLength()) {
            block17: {
                TXElement tXElement2;
                block20: {
                    block21: {
                        block19: {
                            block18: {
                                block16: {
                                    tXElement2 = (TXElement)nodeList.item(n);
                                    if (!tXElement2.getAttribute("name").equals("actor")) break block16;
                                    actorMouseReactor.setActor((Actor)this.get(tXElement2.getAttribute("value")));
                                    break block17;
                                }
                                if (!tXElement2.getAttribute("name").equals("group")) break block18;
                                actorMouseReactor.setGroupName(tXElement2.getAttribute("value"));
                                break block17;
                            }
                            if (!tXElement2.getAttribute("name").equals("repeats")) break block19;
                            try {
                                actorMouseReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                            }
                            catch (NumberFormatException numberFormatException) {
                                System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for ActorMouseReactor: " + tXElement.getAttribute("name"));
                            }
                            break block17;
                        }
                        if (!tXElement2.getAttribute("name").equals("event")) break block20;
                        if (!tXElement2.getAttribute("value").equals("clicked")) break block21;
                        actorMouseReactor.setEvent(500);
                        break block17;
                    }
                    if (tXElement2.getAttribute("value").equals("entered")) {
                        actorMouseReactor.setEvent(504);
                        break block17;
                    } else if (tXElement2.getAttribute("value").equals("exited")) {
                        actorMouseReactor.setEvent(505);
                    }
                    break block17;
                }
                if (tXElement2.getAttribute("name").equals("left")) {
                    if (tXElement2.getAttribute("value").equals("false")) {
                        bl = false;
                    }
                } else if (tXElement2.getAttribute("name").equals("right")) {
                    if (tXElement2.getAttribute("value").equals("false")) {
                        bl3 = false;
                    }
                } else if (tXElement2.getAttribute("name").equals("middle")) {
                    if (tXElement2.getAttribute("value").equals("true")) {
                        bl2 = true;
                    }
                } else {
                    System.out.println("WARNING: Unrecognized attribute encountered while trying to create ActorMouseReactor: " + tXElement.getAttribute("name"));
                    System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
                }
            }
            ++n;
        }
        actorMouseReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        actorMouseReactor.setClickMask(bl, bl2, bl3);
        String string = tXElement.getAttribute("name");
        actorMouseReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), actorMouseReactor);
        }
        this.put(string, actorMouseReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createActorCollisionReactor(TXElement tXElement) {
        ActorCollisionReactor actorCollisionReactor = new ActorCollisionReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                actorCollisionReactor.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                actorCollisionReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("collider")) {
                actorCollisionReactor.setCollider((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    actorCollisionReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for ActorCollisionReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create ActorCollisionReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        actorCollisionReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        actorCollisionReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), actorCollisionReactor);
        }
        this.put(string, actorCollisionReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createActorTerrainChangeReactor(TXElement tXElement) {
        ActorTerrainChangeReactor actorTerrainChangeReactor = new ActorTerrainChangeReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                actorTerrainChangeReactor.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                actorTerrainChangeReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("terrain")) {
                actorTerrainChangeReactor.setTerrain((Terrain)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    actorTerrainChangeReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for ActorTerrainChangeReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create ActorTerrainChangeReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        actorTerrainChangeReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        actorTerrainChangeReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), actorTerrainChangeReactor);
        }
        this.put(string, actorTerrainChangeReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createWorldSceneChangeReactor(TXElement tXElement) {
        WorldSceneChangeReactor worldSceneChangeReactor = new WorldSceneChangeReactor();
        worldSceneChangeReactor.setWorld(this.world);
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("group")) {
                worldSceneChangeReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("scene")) {
                worldSceneChangeReactor.setScene((Scene)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    worldSceneChangeReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for WorldSceneChangeReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create WorldSceneChangeReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        worldSceneChangeReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        worldSceneChangeReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), worldSceneChangeReactor);
        }
        this.put(string, worldSceneChangeReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createActorStateChangeReactor(TXElement tXElement) {
        ActorStateChangeReactor actorStateChangeReactor = new ActorStateChangeReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                actorStateChangeReactor.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                actorStateChangeReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("state")) {
                actorStateChangeReactor.setState(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    actorStateChangeReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for ActorStateChangeReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create ActorStateChangeReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        actorStateChangeReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        actorStateChangeReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), actorStateChangeReactor);
        }
        this.put(string, actorStateChangeReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createAnimationFinishedReactor(TXElement tXElement) {
        AnimationFinishedReactor animationFinishedReactor = new AnimationFinishedReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("animation")) {
                animationFinishedReactor.setAnimation((AnimatedActorFace)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                animationFinishedReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    animationFinishedReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for AnimationFinishedReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create AnimationFinishedReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        animationFinishedReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        animationFinishedReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), animationFinishedReactor);
        }
        this.put(string, animationFinishedReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createMouthFinishedReactor(TXElement tXElement) {
        MouthFinishedReactor mouthFinishedReactor = new MouthFinishedReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("mouth")) {
                mouthFinishedReactor.setMouth((ActorMouth)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                mouthFinishedReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    mouthFinishedReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for MouthFinishedReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create MouthFinishedReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        mouthFinishedReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        mouthFinishedReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), mouthFinishedReactor);
        }
        this.put(string, mouthFinishedReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createMovingActorDestinationReachedReactor(TXElement tXElement) {
        MovingActorDestinationReachedReactor movingActorDestinationReachedReactor = new MovingActorDestinationReachedReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                movingActorDestinationReachedReactor.setMovingActor((MovingActor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                movingActorDestinationReachedReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    movingActorDestinationReachedReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for MovingActorDestinationReachedReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create MovingActorDestinationReachedReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        movingActorDestinationReachedReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        String string = tXElement.getAttribute("name");
        movingActorDestinationReachedReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), movingActorDestinationReachedReactor);
        }
        this.put(string, movingActorDestinationReachedReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    protected void createActorMovementReactor(TXElement tXElement) {
        ActorMovementReactor actorMovementReactor = new ActorMovementReactor();
        NodeList nodeList = tXElement.getElementsNamed("Attribute");
        float f = 0.0f;
        float f2 = 0.0f;
        float f3 = 0.0f;
        float f4 = 0.0f;
        float f5 = 0.0f;
        float f6 = 0.0f;
        boolean bl = false;
        int n = 0;
        while (n < nodeList.getLength()) {
            TXElement tXElement2 = (TXElement)nodeList.item(n);
            if (tXElement2.getAttribute("name").equals("actor")) {
                actorMovementReactor.setActor((Actor)this.get(tXElement2.getAttribute("value")));
            } else if (tXElement2.getAttribute("name").equals("group")) {
                actorMovementReactor.setGroupName(tXElement2.getAttribute("value"));
            } else if (tXElement2.getAttribute("name").equals("xmin")) {
                f = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("xmax")) {
                f2 = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("ymin")) {
                f3 = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("ymax")) {
                f4 = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("zmin")) {
                f5 = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("zmax")) {
                f6 = Float.valueOf(tXElement2.getAttribute("value")).floatValue();
                bl = true;
            } else if (tXElement2.getAttribute("name").equals("repeats")) {
                try {
                    actorMovementReactor.setNumRepitions(Integer.parseInt(tXElement2.getAttribute("value")));
                }
                catch (NumberFormatException numberFormatException) {
                    System.err.println("ERROR: GMLParser Caught NumberformatException while trying to set repeats for ActorMovementReactor: " + tXElement.getAttribute("name"));
                }
            } else {
                System.out.println("WARNING: Unrecognized attribute encountered while trying to create ActorMovementReactor: " + tXElement.getAttribute("name"));
                System.out.println("WARNING: The alien name was: " + tXElement2.getAttribute("name") + " with value: " + tXElement2.getAttribute("value"));
            }
            ++n;
        }
        actorMovementReactor.setReaction((Sequence)this.get(tXElement.getAttribute("reaction")));
        if (bl) {
            actorMovementReactor.setCondition(f, f2, f3, f4, f5, f6);
        }
        String string = tXElement.getAttribute("name");
        actorMovementReactor.setName(string);
        if (!tXElement.getAttribute("group").equals("")) {
            Groups.add(tXElement.getAttribute("group"), actorMovementReactor);
        }
        this.put(string, actorMovementReactor);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public boolean validateFloat(String string) {
        if (string == null) {
            return false;
        }
        try {
            float f = Float.valueOf(string).floatValue();
            return true;
        }
        catch (NumberFormatException numberFormatException) {
            return false;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public boolean validateLong(String string) {
        if (string == null) {
            return false;
        }
        try {
            long l = Long.valueOf(string);
            return true;
        }
        catch (NumberFormatException numberFormatException) {
            return false;
        }
    }

    public GMLParser(Pulser pulser) {
        this.gmlRoot = new String("");
        this.resourceRoot = new String("");
        this.container = new Hashtable();
        this.sep = File.separatorChar;
        this.backSlash = (char)92;
        this.pulser = pulser;
    }

    public GMLParser(World world, Pulser pulser) {
        this(pulser);
        this.world = world;
    }

    public GMLParser(World world, String string, String string2, Pulser pulser) {
        this.world = world;
        this.gmlRoot = string;
        this.resourceRoot = string2;
        this.pulser = pulser;
        this.sep = File.separatorChar;
        this.backSlash = (char)92;
    }

    public GMLParser(World world, String string, String string2, Hashtable hashtable, Pulser pulser) {
        this(world, string, string2, pulser);
        this.container = hashtable;
    }
}
