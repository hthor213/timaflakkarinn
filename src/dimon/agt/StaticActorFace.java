/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.ActorFace;
import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.Color24;
import is.dimon.nemesis.draw.ImageReaderPNG;
import java.awt.Point;
import java.awt.Rectangle;
import java.io.FileNotFoundException;

public class StaticActorFace
extends ActorFace {
    protected String imagePath;
    protected boolean prepared = false;
    protected boolean noNeed = false;
    protected boolean newTransparency = false;
    protected Color24 tColor = null;
    private boolean transparent = false;
    protected Point poin;
    protected int frameWidth;
    protected int frameHeight;
    protected BitBuffer myImageBuffer;
    protected BitBuffer myScaledImageBuffer;

    public void setScalingFactor(float f) {
        if (this.parent != null) {
            this.parent.invalidateRectangle(this.bounds);
        }
        this.bounds.width = (int)((float)this.frameWidth * f);
        this.bounds.height = (int)((float)this.frameHeight * f);
        if (f != 1.0f && this.prepared && !this.noNeed && this.scaling != f) {
            this.fillScalingBuffer();
        }
        this.scaling = f;
        if (this.parent != null) {
            this.parent.invalidateRectangle(this.bounds);
        }
    }

    protected void fillScalingBuffer() {
        if (this.myScaledImageBuffer == null) {
            this.myScaledImageBuffer = new BitBuffer((int)((float)this.myImageBuffer.getSize().width * 1.8f), (int)((float)this.myImageBuffer.getSize().height * 1.8f), 16);
        }
        Rectangle rectangle = new Rectangle(0, 0, this.frameWidth, this.frameHeight);
        Rectangle rectangle2 = new Rectangle(0, 0, this.bounds.width, this.bounds.height);
        this.myScaledImageBuffer.fill(new Color24(0, 255, 0));
        this.myScaledImageBuffer.blitScaled(this.myImageBuffer, rectangle, rectangle2);
    }

    public void setBaseImage(String string) {
        this.imagePath = string;
    }

    public String getImagePath() {
        return this.imagePath;
    }

    public void setTransparent(boolean bl) {
        this.transparent = bl;
        this.unprepare();
    }

    public void setTransparentColor(Color24 color24) {
        if (this.myImageBuffer != null) {
            this.myImageBuffer.setTransparentColor(color24);
        }
        this.newTransparency = true;
        this.tColor = color24;
    }

    public void setTransparentSize(int n, int n2) {
        if (!this.transparent) {
            return;
        }
        this.setImageSize(n, n2);
    }

    public boolean isPrepared() {
        return this.prepared;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public void prepare() {
        if (this.transparent) {
            this.prepared = true;
            return;
        }
        if (this.imagePath == null) {
            System.err.println("No path set for StaticActorFace: " + this.getName());
            return;
        }
        if (this.prepared) {
            return;
        }
        try {
            ImageReaderPNG imageReaderPNG = new ImageReaderPNG(this.imagePath);
            this.myImageBuffer = imageReaderPNG.getBitBuffer();
            if (this.newTransparency) {
                this.myImageBuffer.setTransparentColor(this.tColor);
            }
        }
        catch (FileNotFoundException fileNotFoundException) {
            System.err.println("Can't find file.\n" + fileNotFoundException.toString());
            System.err.println("The bogus path is: " + this.imagePath);
            return;
        }
        catch (BogusFileFormatException bogusFileFormatException) {
            System.err.println("Can't understand file.\n" + bogusFileFormatException.toString());
            return;
        }
        catch (Exception exception) {
            System.err.println("Caught misterious exception.\n" + exception.toString());
        }
        this.noNeed = true;
        this.setImageSize(this.myImageBuffer.getSize().width, this.myImageBuffer.getSize().height);
        if (this.scaling != 1.0f) {
            this.fillScalingBuffer();
        }
        this.noNeed = false;
        this.prepared = true;
    }

    public synchronized void unprepare() {
        if (this.myImageBuffer != null) {
            this.myImageBuffer.purge();
        }
        this.myImageBuffer = null;
        if (this.myScaledImageBuffer != null) {
            this.myScaledImageBuffer.purge();
        }
        this.myScaledImageBuffer = null;
        this.prepared = false;
    }

    public boolean getTransparent() {
        return this.transparent;
    }

    public void setImageSize(int n, int n2) {
        this.frameWidth = n;
        this.frameHeight = n2;
        this.setScalingFactor(this.scaling);
    }

    public void paint(Rectangle rectangle, BitBuffer bitBuffer) {
        if (this.transparent) {
            return;
        }
        if (!this.prepared) {
            this.prepare();
        }
        if (rectangle.isEmpty()) {
            return;
        }
        this.poin = rectangle.getLocation();
        rectangle.translate(-this.bounds.x, -this.bounds.y);
        if (this.scaling != 1.0f) {
            bitBuffer.blit(this.myScaledImageBuffer, rectangle, this.poin);
        } else {
            bitBuffer.blit(this.myImageBuffer, rectangle, this.poin);
        }
    }

    public void paint(int n, int n2, int n3, int n4, BitBuffer bitBuffer) {
        this.paint(new Rectangle(n, n2, n3, n4), bitBuffer);
    }

    public void kill() {
        super.kill();
        this.unprepare();
    }
}
