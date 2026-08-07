/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.Scene;
import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.ImageReader;
import is.dimon.nemesis.draw.ImageReaderPNG;
import is.dimon.nemesis.input.Mouse;
import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;
import java.io.FileNotFoundException;

public class CursorFace {
    protected Rectangle bounds;
    protected int frameWidth;
    protected int frameHeight;
    protected BitBuffer cursorImageBuffer;
    protected int xOffset;
    protected int yOffset;

    public void finalize() {
        this.cursorImageBuffer.purge();
        this.cursorImageBuffer = null;
    }

    public Dimension getSize() {
        return new Dimension(this.bounds.width, this.bounds.height);
    }

    public Rectangle getBounds() {
        return this.bounds;
    }

    public void setOffset(int n, int n2) {
        this.xOffset = n;
        this.yOffset = n2;
    }

    public void setLocation(int n, int n2, Scene scene) {
        scene.invalidateRectangle(this.bounds);
        this.bounds.x = n - this.xOffset;
        this.bounds.y = n2 - this.yOffset;
        scene.invalidateRectangle(this.bounds);
    }

    public void paint(Rectangle rectangle, BitBuffer bitBuffer) {
        if (this.cursorImageBuffer == null) {
            return;
        }
        Rectangle rectangle2 = rectangle.intersection(this.bounds);
        if (rectangle2.isEmpty()) {
            return;
        }
        Point point = rectangle2.getLocation();
        rectangle2.translate(-this.bounds.x, -this.bounds.y);
        bitBuffer.blit(this.cursorImageBuffer, rectangle2, point);
    }

    public void paint(int n, int n2, int n3, int n4, BitBuffer bitBuffer) {
        this.paint(new Rectangle(n, n2, n3, n4), bitBuffer);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     * Enabled aggressive exception aggregation
     */
    public CursorFace(String string) {
        Object object;
        if (string == null) {
            this.cursorImageBuffer = null;
            this.xOffset = 0;
            this.yOffset = 0;
            this.bounds = new Rectangle();
            return;
        }
        try {
            object = new ImageReaderPNG(string);
            this.cursorImageBuffer = ((ImageReader)object).getBitBuffer();
        }
        catch (FileNotFoundException fileNotFoundException) {
            System.err.println("Can't find file.\n" + fileNotFoundException.toString());
            return;
        }
        catch (BogusFileFormatException bogusFileFormatException) {
            System.err.println("Can't understand file.\n" + bogusFileFormatException.toString());
            return;
        }
        catch (Exception exception) {
            System.err.println("Caught misterious exception.\n" + exception.toString());
        }
        object = new Mouse().getPosition();
        this.bounds = new Rectangle(((Point)object).x, ((Point)object).y, this.cursorImageBuffer.getSize().width, this.cursorImageBuffer.getSize().height);
        this.xOffset = this.bounds.width / 2;
        this.yOffset = this.bounds.height / 2;
    }
}
