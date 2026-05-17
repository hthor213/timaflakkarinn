/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.timaflakkarinn;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;

class ImageCanvas
extends Canvas {
    private Image img;

    public void paint(Graphics graphics) {
        graphics.drawImage(this.img, 0, 0, Color.black, this);
    }

    public ImageCanvas(Image image) {
        this.img = image;
    }
}
