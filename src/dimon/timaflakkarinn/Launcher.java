/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.common.Volume;
import is.dimon.timaflakkarinn.ImageCanvas;
import is.dimon.timaflakkarinn.TextViewer;
import is.dimon.timaflakkarinn.Timaflakkarinn;
import java.awt.Button;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Label;
import java.awt.SystemColor;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.Serializable;

public class Launcher
extends Frame
implements Runnable,
ActionListener {
    private boolean cdCheck = true;
    private long sleepTime = 1000L;
    private Thread myThread;
    private String cdPath = null;
    private String appPath = null;
    private Button play;
    private Label messageLabel;
    GridBagLayout layout;
    GridBagConstraints constraints;
    TextViewer viewer = new TextViewer("lestumig.txt");

    private void addComponent(Component component, int n, int n2, int n3, int n4, int n5, int n6) {
        this.constraints.gridx = n2;
        this.constraints.gridy = n;
        this.constraints.gridwidth = n3;
        this.constraints.gridheight = n4;
        this.constraints.weightx = n5;
        this.constraints.weighty = n6;
        this.layout.setConstraints(component, this.constraints);
        this.add(component);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void run() {
        Object object;
        while (this.cdCheck) {
            this.cdPath = null;
            object = Nemesis.getVolumes();
            int n = 0;
            while (n < ((Volume[])object).length) {
                try {
                    String string = object[n].getName().toLowerCase();
                    if (string.equals("flakkari") && (object[n].getType() == 3 || ((Volume)object[n]).getType() == 0)) {
                        this.cdPath = ((Volume)object[n]).getPath();
                    }
                }
                catch (NullPointerException nullPointerException) {
                }
                ++n;
            }
            if (this.cdPath == null) {
                this.messageLabel.setText("Ekki er r\u00e9ttur diskur \u00ed geisladrifi");
                this.messageLabel.setForeground(Color.red);
                this.play.setEnabled(false);
            } else {
                this.messageLabel.setText("R\u00e9ttur diskur er \u00ed geisladrifinu");
                this.messageLabel.setForeground(Color.black);
                this.play.setEnabled(true);
            }
            try {
                Thread.currentThread();
                Thread.sleep(this.sleepTime);
            }
            catch (Exception exception) {
            }
        }
        if (this.cdPath != null) {
            if (System.getProperty("os.name").startsWith("Windows")) {
                object = new Timaflakkarinn(this.appPath + "gml" + File.separator, this.cdPath + "game");
            }
            if (System.getProperty("os.name").startsWith("Mac")) {
                object = Runtime.getRuntime();
                try {
                    ((Runtime)object).exec("data" + File.separator + "Launch");
                }
                catch (Exception exception) {
                    System.err.println("Cannot launch launch : " + exception);
                }
                System.exit(0);
            }
        }
    }

    public void actionPerformed(ActionEvent actionEvent) {
        if (actionEvent.getActionCommand().equals("play")) {
            this.cdCheck = false;
            ((Component)this).setVisible(false);
            this.viewer.dispose();
            this.viewer = null;
            this.dispose();
        }
        if (actionEvent.getActionCommand().equals("read")) {
            this.viewer.show();
        }
        if (actionEvent.getActionCommand().equals("exit")) {
            System.exit(0);
        }
    }

    public static void main(String[] stringArray) {
        Launcher launcher = new Launcher("T\u00edmaflakkarinn");
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public Launcher(String string) {
        super(string);
        Serializable serializable;
        ((Component)this).setLocation(50, 50);
        ((Component)this).setSize(276, 375);
        this.setResizable(false);
        try {
            this.setIconImage(Toolkit.getDefaultToolkit().getImage("data" + File.separator + "tt32.gif"));
        }
        catch (Exception exception) {
        }
        this.layout = new GridBagLayout();
        this.setLayout(this.layout);
        this.constraints = new GridBagConstraints();
        try {
            if (!System.getProperty("os.name").toLowerCase().startsWith("mac")) {
                try {
                    serializable = new ImageCanvas(Toolkit.getDefaultToolkit().getImage("data" + File.separator + "tt.gif"));
                    ((Component)serializable).setSize(270, 200);
                    this.constraints.fill = 0;
                    this.addComponent((Component)serializable, 0, 0, 1, 1, 0, 0);
                }
                catch (Exception exception) {
                }
            } else {
                ((Component)this).setSize(276, 175);
            }
        }
        catch (Exception exception) {
            System.exit(0);
        }
        serializable = new Font("Serif", 1, 16);
        Font font = new Font("Serif", 1, 14);
        Font font2 = new Font("Serif", 0, 12);
        this.play = new Button("Spila T\u00edmaflakkarann");
        this.play.setActionCommand("play");
        this.play.addActionListener(this);
        this.play.setEnabled(false);
        this.play.setFont((Font)serializable);
        this.constraints.fill = 1;
        this.addComponent(this.play, 1, 0, 1, 1, 100, 100);
        Button button = new Button("\u00ddttu \u00e1 mig ef \u00fe\u00fa \u00e1tt \u00ed vandr\u00e6\u00f0um");
        button.setActionCommand("read");
        button.addActionListener(this);
        button.setFont(font);
        this.constraints.fill = 1;
        this.addComponent(button, 2, 0, 1, 1, 10, 10);
        Button button2 = new Button("H\u00e6tta");
        button2.setActionCommand("exit");
        button2.addActionListener(this);
        button2.setFont(font);
        this.constraints.fill = 1;
        this.addComponent(button2, 3, 0, 1, 1, 10, 10);
        this.messageLabel = new Label();
        this.messageLabel.setBackground(SystemColor.control);
        this.messageLabel.setFont(font2);
        this.constraints.fill = 2;
        this.addComponent(this.messageLabel, 4, 0, 1, 1, 0, 0);
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
        this.appPath = Nemesis.getPathToNemesis();
        Thread thread = new Thread(this);
        thread.start();
        this.show();
    }
}
