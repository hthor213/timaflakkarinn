/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  com.ibm.xml.parser.DTD
 *  com.ibm.xml.parser.TXDocument
 *  com.ibm.xml.parser.TXElement
 */
package is.dimon.timaflakkarinn;

import com.ibm.xml.parser.DTD;
import com.ibm.xml.parser.TXDocument;
import com.ibm.xml.parser.TXElement;
import is.dimon.agt.Actor;
import is.dimon.agt.StaticActor;
import is.dimon.agt.Terrain;
import is.dimon.agt.action.ConditionFlag;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Vector;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public class Saver
implements FilenameFilter {
    private Vector actors = new Vector(50, 5);
    private Vector textActors;
    private Vector flags = new Vector(50, 5);
    private Vector terrains = new Vector(50, 5);
    private FileWriter fw;
    private String prefix;
    private String separator;
    private int currentTheme;
    private FileReader fr;

    public void addActor(Actor actor) {
        this.actors.addElement(actor);
    }

    public void addTextActor(StaticActor staticActor) {
        this.textActors.addElement(staticActor);
    }

    public void addTerrain(Terrain terrain) {
        this.terrains.addElement(terrain);
    }

    public void addFlag(ConditionFlag conditionFlag) {
        this.flags.addElement(conditionFlag);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void save(String string, String string2, String string3, int n) {
        Object object;
        Object object2;
        TXElement tXElement;
        TXElement tXElement2;
        TXElement tXElement3;
        Object object3;
        if (n > 10) {
            return;
        }
        String string4 = string2 + "\n";
        string4 = string4 + string;
        try {
            object3 = new File(this.prefix + this.separator + "save" + n + ".sav");
            this.fw = new FileWriter((File)object3);
            this.fw.write(string4);
            this.fw.close();
        }
        catch (IOException iOException) {
            System.out.println("Caught\tIOException");
        }
        object3 = new TXDocument();
        object3.setVersion("1.0");
        object3.setEncoding("ISO-8859-1");
        DTD dTD = object3.createDTD("Body SYSTEM \"scene.dtd\" []", null);
        object3.appendChild((Node)dTD);
        Element element = object3.createElement("Body");
        int n2 = 1;
        while (n2 <= this.actors.size()) {
            Actor actor = (Actor)this.actors.elementAt(n2 - 1);
            TXElement tXElement4 = new TXElement("MoveActorQuantum");
            tXElement3 = new TXElement("Location");
            tXElement3.setAttribute("x", new Float(actor.getLocation().x).toString());
            tXElement3.setAttribute("y", new Float(actor.getLocation().y).toString());
            tXElement3.setAttribute("z", new Float(actor.getLocation().z).toString());
            tXElement4.setAttribute("name", "q_MoveActorQuantum" + n2);
            tXElement4.setAttribute("actor", actor.getName());
            if (actor.getTerrain() != null) {
                tXElement4.setAttribute("terrain", actor.getTerrain().getName());
            }
            tXElement4.appendChild((Node)tXElement3);
            tXElement2 = new TXElement("StateQuantum");
            tXElement2.setAttribute("name", "q_StateQuantum" + n2);
            tXElement2.setAttribute("state", actor.getState());
            tXElement2.setAttribute("actor", actor.getName());
            tXElement2.setAttribute("wait", "false");
            element.appendChild((Node)tXElement2);
            element.appendChild((Node)tXElement4);
            ++n2;
        }
        int n3 = 1;
        while (n3 <= this.flags.size()) {
            ConditionFlag conditionFlag = (ConditionFlag)this.flags.elementAt(n3 - 1);
            tXElement3 = new TXElement("SetFlagQuantum");
            tXElement3.setAttribute("name", "q_SetFlagQuantum" + n3);
            tXElement3.setAttribute("flag", conditionFlag.getName());
            tXElement3.setAttribute("value", conditionFlag.value.toString());
            element.appendChild((Node)tXElement3);
            ++n3;
        }
        int n4 = 1;
        while (n4 <= this.textActors.size()) {
            StaticActor staticActor = (StaticActor)this.textActors.elementAt(n4 - 1);
            tXElement2 = new TXElement("MoveActorQuantum");
            tXElement = new TXElement("Location");
            tXElement.setAttribute("x", new Float(staticActor.getLocation().x).toString());
            tXElement.setAttribute("y", new Float(staticActor.getLocation().y).toString());
            tXElement.setAttribute("z", new Float(staticActor.getLocation().z).toString());
            tXElement2.setAttribute("name", "q_TextMoveQuantum" + n4);
            tXElement2.setAttribute("actor", staticActor.getName());
            if (staticActor.getTerrain() != null) {
                tXElement2.setAttribute("terrain", staticActor.getTerrain().getName());
            }
            tXElement2.appendChild((Node)tXElement);
            element.appendChild((Node)tXElement2);
            ++n4;
        }
        int n5 = 1;
        while (n5 <= this.terrains.size()) {
            Terrain terrain = (Terrain)this.terrains.elementAt(n5 - 1);
            tXElement = new TXElement("MoveTerrainQuantum");
            tXElement.setAttribute("name", "q_MoveTerrainQuantum" + n5);
            tXElement.setAttribute("terrain", terrain.getName());
            if (terrain.getScene() != null) {
                tXElement.setAttribute("scene", terrain.getScene().getName());
            }
            element.appendChild((Node)tXElement);
            ++n5;
        }
        TXElement tXElement5 = new TXElement("Sequence");
        tXElement5.setAttribute("name", "s_save" + n);
        int n6 = 1;
        while (n6 <= this.actors.size()) {
            object2 = new TXElement("Quantum");
            object2.setAttribute("name", "q_MoveActorQuantum" + n6);
            object = new TXElement("Quantum");
            object.setAttribute("name", "q_StateQuantum" + n6);
            tXElement5.appendChild((Node)object);
            tXElement5.appendChild((Node)object2);
            ++n6;
        }
        n6 = 1;
        while (n6 <= this.flags.size()) {
            object2 = new TXElement("Quantum");
            object2.setAttribute("name", "q_SetFlagQuantum" + n6);
            tXElement5.appendChild((Node)object2);
            ++n6;
        }
        n6 = 1;
        while (n6 <= this.textActors.size()) {
            object2 = new TXElement("Quantum");
            object2.setAttribute("name", "q_TextMoveQuantum" + n6);
            tXElement5.appendChild((Node)object2);
            ++n6;
        }
        n6 = 1;
        while (n6 <= this.terrains.size()) {
            object2 = new TXElement("Quantum");
            object2.setAttribute("name", "q_MoveTerrainQuantum" + n6);
            tXElement5.appendChild((Node)object2);
            ++n6;
        }
        TXElement tXElement6 = new TXElement("Quantum");
        tXElement6.setAttribute("name", "q_UpdateInventory");
        tXElement5.appendChild((Node)tXElement6);
        element.appendChild((Node)tXElement5);
        object3.appendChild((Node)element);
        object2 = new File(this.prefix + this.separator + "save" + n + ".gml");
        try {
            object = new FileWriter((File)object2);
            object3.printWithFormat((Writer)object);
            ((OutputStreamWriter)object).close();
            return;
        }
        catch (IOException iOException) {
            System.out.println("IOException caught");
        }
    }

    public int getSaveCount() {
        File file = new File(this.prefix);
        return file.list(this).length;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public String[] getSaveNames() {
        File file = new File(this.prefix);
        String[] stringArray = file.list(this);
        String[] stringArray2 = new String[stringArray.length];
        int n = 0;
        while (n < stringArray.length) {
            stringArray2[n] = new String();
            try {
                this.fr = new FileReader(this.prefix + this.separator + stringArray[n]);
                while (true) {
                    int n2;
                    if ((char)(n2 = this.fr.read()) == '\n') {
                        this.fr.close();
                        break;
                    }
                    stringArray2[n] = stringArray2[n] + (char)n2;
                }
            }
            catch (IOException iOException) {
                System.out.println("IO-error while reading save\tnames");
            }
            ++n;
        }
        return stringArray2;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public String[] getSaveInfo(String string) {
        File file = new File(this.prefix);
        String[] stringArray = file.list(this);
        String[] stringArray2 = new String[3];
        stringArray2[0] = new String();
        String string2 = new String();
        int n = 0;
        while (n < stringArray.length) {
            try {
                int n2;
                this.fr = new FileReader(this.prefix + this.separator + stringArray[n]);
                while ((char)(n2 = this.fr.read()) != '\n') {
                    string2 = string2 + (char)n2;
                }
                if (string2.equals(string)) {
                    while ((n2 = this.fr.read()) != -1) {
                        stringArray2[0] = stringArray2[0] + (char)n2;
                    }
                    stringArray2[1] = "Beta" + this.separator + "save" + this.separator + "save" + (n + 1);
                    stringArray2[2] = "s_save" + (n + 1);
                    return stringArray2;
                }
            }
            catch (IOException iOException) {
                System.out.println("IO-error while reading save\tnames");
            }
            string2 = "";
            ++n;
        }
        return null;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public String[] getSaveInfo(int n) {
        if (n > 10) {
            return null;
        }
        File file = new File(this.prefix);
        String[] stringArray = file.list(this);
        String[] stringArray2 = new String[4];
        stringArray2[0] = new String();
        String string = new String();
        try {
            int n2;
            this.fr = new FileReader(this.prefix + this.separator + "save" + n + ".sav");
            while ((char)(n2 = this.fr.read()) != '\n') {
                string = string + (char)n2;
            }
            stringArray2[3] = string;
            while ((n2 = this.fr.read()) != -1) {
                stringArray2[0] = stringArray2[0] + (char)n2;
            }
            stringArray2[1] = "Beta" + this.separator + "save" + this.separator + "save" + n;
            stringArray2[2] = "s_save" + n;
            if (stringArray2[0].equals("landnam")) {
                stringArray2[0] = "1";
            }
            if (stringArray2[0].equals("kristnitaka")) {
                stringArray2[0] = "2";
            }
            if (stringArray2[0].equals("sidaskipti")) {
                stringArray2[0] = "3";
            }
            if (stringArray2[0].equals("tyrkjaran")) {
                stringArray2[0] = "4";
            }
            return stringArray2;
        }
        catch (IOException iOException) {
            System.out.println("ERROR   Saver::getSaveInfo(int) : IO error reading " + this.prefix + this.separator + "save" + n + ".sav");
            return null;
        }
    }

    public void clear() {
        this.actors.removeAllElements();
        this.textActors.removeAllElements();
        this.flags.removeAllElements();
        this.terrains.removeAllElements();
    }

    public boolean accept(File file, String string) {
        return string.endsWith(".sav");
    }

    public Saver(String string) {
        this.textActors = new Vector(50, 5);
        this.separator = File.separator;
        this.prefix = string + "Beta" + this.separator + "save";
    }
}
