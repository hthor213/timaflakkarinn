/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Component;
import java.awt.Font;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;

class TextViewer
extends Frame
implements ActionListener {
    private TextArea ta = new TextArea();

    public void actionPerformed(ActionEvent actionEvent) {
        if (actionEvent.getActionCommand().equals("close")) {
            ((Component)this).setVisible(false);
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public TextViewer(String string) {
        super("LestuMig");
        Object object;
        this.ta.setEditable(false);
        try {
            object = new FileInputStream(string);
            int n = ((FileInputStream)object).available();
            byte[] byArray = new byte[n];
            ((FileInputStream)object).read(byArray);
            this.ta.setText(new String(byArray));
            this.ta.setFont(new Font("monospaced", 0, 12));
        }
        catch (Exception exception) {
            return;
        }
        try {
            this.setIconImage(Toolkit.getDefaultToolkit().getImage("data" + File.separator + "tp32.gif"));
        }
        catch (Exception exception) {
        }
        ((Component)this).setSize(500, 400);
        this.setLayout(new BorderLayout());
        this.add((Component)this.ta, "Center");
        object = new Button("Loka glugga");
        ((Component)object).setFont(new Font("Serif", 1, 14));
        ((Button)object).setActionCommand("close");
        ((Button)object).addActionListener(this);
        this.add((Component)object, "South");
    }
}
