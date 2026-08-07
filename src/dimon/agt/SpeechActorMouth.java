/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Float3DPoint;
import is.dimon.agt.InvalidPositionException;
import is.dimon.agt.Pulsable;
import is.dimon.agt.Pulser;
import is.dimon.agt.SimpleActorMouth;
import is.dimon.agt.StaticActor;
import is.dimon.agt.TextActorFace;
import is.dimon.agt.event.FreezeEvent;
import java.util.Vector;

public class SpeechActorMouth
extends SimpleActorMouth
implements Pulsable {
    protected long interval;
    protected Pulser pulser;
    protected StaticActor textActor;
    protected TextActorFace textFace;
    protected Vector sentences;
    protected long time;
    protected String oldText;
    protected Vector times;
    protected int position;
    protected Float3DPoint middle;

    public void kill() {
        super.kill();
        this.pulser.stopPulsing(this);
        this.pulser = null;
        this.textFace = null;
        this.textActor = null;
        this.sentences.removeAllElements();
        this.sentences = null;
        this.times.removeAllElements();
        this.times = null;
    }

    public void start() {
        super.start();
        if (this.textActor == null) {
            this.textActor = (StaticActor)this.textFace.getOwner();
        }
        if (this.middle == null) {
            this.middle = this.textActor.getLocation();
            this.middle.x += (float)(this.textFace.getSize().width / 2);
        }
        this.position = 0;
        this.time = 0L;
        this.pulse(0L);
        this.pulser.pulse(this);
    }

    public void addSentence(String string, long l) {
        this.sentences.addElement(string);
        this.times.addElement(new Long(l));
    }

    public void setTextActorFace(TextActorFace textActorFace) {
        if (textActorFace == null) {
            return;
        }
        this.textFace = textActorFace;
        this.textFace.setAlignment(0);
    }

    public void setPulseInterval(long l) {
        if (l > 0L && l != this.interval) {
            this.interval = l;
            if (!this.isFinished()) {
                this.pulser.stopPulsing(this);
                this.pulser.pulse(this);
            }
        }
    }

    public void freeze(FreezeEvent freezeEvent) {
        Object object = this.freezeLock;
        synchronized (object) {
            super.freeze(freezeEvent);
            if (this.textFace != null && !this.textFace.getText().equals("")) {
                this.oldText = new String(this.textFace.getText());
                this.textFace.setText("");
            }
        }
    }

    public void thaw(FreezeEvent freezeEvent) {
        Object object = this.freezeLock;
        synchronized (object) {
            if (this.oldText != null && this.textFace != null) {
                this.textFace.setText(new String(this.oldText));
            }
            this.oldText = null;
            super.thaw(freezeEvent);
        }
    }

    public long getPulseInterval() {
        return this.interval;
    }

    public void setTextMiddle(Float3DPoint float3DPoint) {
        this.middle = float3DPoint;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void pulse(long l) {
        if (this.frozen) {
            return;
        }
        try {
            if (this.isFinished()) {
                this.pulser.stopPulsing(this);
                this.textFace.setText("");
                this.unprepare();
                return;
            }
            this.time += l;
            if (this.position >= this.sentences.size()) return;
            if (this.time < (Long)this.times.elementAt(this.position)) return;
            this.textFace.setText((String)this.sentences.elementAt(this.position));
            try {
                this.textActor.setLocation(this.middle.x, this.middle.y, this.middle.z);
            }
            catch (InvalidPositionException invalidPositionException) {
            }
            ++this.position;
            return;
        }
        catch (NullPointerException nullPointerException) {
            System.err.println("NullPointer in speechActorMouth - Error");
        }
    }

    public SpeechActorMouth(Pulser pulser) {
        this.pulser = pulser;
        this.interval = 50L;
        this.sentences = new Vector(3, 10);
        this.times = new Vector(3, 10);
    }
}
