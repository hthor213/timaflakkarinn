/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.agt;

import is.dimon.agt.ActorFace;
import is.dimon.agt.event.AGTMouseEvent;
import is.dimon.agt.event.ActorMouseListener;
import is.dimon.agt.event.StageEvent;
import is.dimon.nemesis.draw.BitBuffer;
import is.dimon.nemesis.draw.Color;
import is.dimon.nemesis.draw.Color24;
import is.dimon.nemesis.draw.Font;
import java.awt.Point;
import java.awt.Rectangle;

public class TextActorFace
extends ActorFace
implements ActorMouseListener {
    public static final int CENTER = 0;
    public static final int LEFT = 1;
    public static final int RIGHT = 2;
    protected String text;
    protected Color color;
    protected Font myFont;
    protected Color boldColor = new Color24(0, 0, 0);
    protected int style = 0;
    protected int alignment = 1;
    protected Point poo;
    protected Point realLocation;
    protected boolean highlighted = false;
    protected Color highlightColor;
    protected boolean over = false;
    protected boolean prepared = false;
    protected boolean useBackgroundColor = false;
    protected Color24 backgroundColor;
    protected float fontSize = 26.0f;
    Rectangle fixRect = new Rectangle();

    public void setStyle(int n) {
        if (n == this.style) {
            return;
        }
        this.style = n;
        if (this.prepared) {
            this.unprepare();
            this.prepare();
        }
    }

    public int getStyle() {
        return this.style;
    }

    public void setHighlighted(boolean bl) {
        if (!(this.highlighted ^ bl)) {
            return;
        }
        this.highlighted = bl;
        if (bl) {
            if (this.attached && this.onStage) {
                this.getOwner().addActorMouseListener(this);
            }
        } else {
            this.over = false;
            this.getOwner().removeActorMouseListener(this);
        }
    }

    public boolean isHighlighted() {
        return this.highlighted;
    }

    public boolean hasBackgroundColor() {
        return this.useBackgroundColor;
    }

    public void setBackgroundColor(Color24 color24) {
        this.backgroundColor = color24;
        this.useBackgroundColor = color24 != null;
    }

    public Color24 getBackgroundColor() {
        return this.backgroundColor;
    }

    public int getAlignment() {
        return this.alignment;
    }

    public void setAlignment(int n) {
        if (this.alignment != 0 && n == 0) {
            this.realLocation = new Point(this.bounds.x, this.bounds.y);
            this.bounds.x -= this.bounds.width / 2;
            if (this.prepared) {
                this.myFont.setHorizAlignment(0);
            }
        }
        this.alignment = n;
    }

    public void setLocation(int n, int n2) {
        if (this.alignment == 0) {
            this.realLocation.x = n + this.xOffset;
            this.realLocation.y = n2 + this.yOffset;
            n -= this.bounds.width / 2;
        }
        super.setLocation(n, n2);
    }

    public void detach() {
        super.detach();
        if (this.highlighted) {
            this.over = false;
            this.getOwner().removeActorMouseListener(this);
        }
    }

    public void attach() {
        super.attach();
        if (this.highlighted && this.onStage) {
            this.getOwner().addActorMouseListener(this);
        }
    }

    public void offStage(StageEvent stageEvent) {
        super.offStage(stageEvent);
        if (this.highlighted) {
            this.over = false;
            this.getOwner().removeActorMouseListener(this);
        }
    }

    public void onStage(StageEvent stageEvent) {
        super.onStage(stageEvent);
        if (this.highlighted && this.attached) {
            this.getOwner().addActorMouseListener(this);
        }
    }

    public void prepare() {
        this.myFont = Font.createDefaultFont(this.fontSize, this.style);
        if (this.alignment == 0) {
            this.myFont.setHorizAlignment(0);
        } else if (this.alignment == 2) {
            this.myFont.setHorizAlignment(1);
        }
        this.myFont.setVertAlignment(1);
        if (this.text != null) {
            Rectangle rectangle = this.myFont.calcTextBounds(this.text);
            this.setImageSize(rectangle.width + 16, rectangle.height + 6);
        }
        this.prepared = true;
    }

    public void setFontSize(float f) {
        if (f == this.fontSize) {
            return;
        }
        if (f > 0.0f && f < 500.0f) {
            this.unprepare();
            this.fontSize = f;
            this.prepare();
        }
    }

    public Font getFont() {
        return this.myFont;
    }

    public void unprepare() {
        this.myFont = null;
        this.prepared = false;
    }

    public boolean isPrepared() {
        return this.prepared;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Color getHighlightColor() {
        return this.highlightColor;
    }

    public void setHighlightColor(Color color) {
        this.highlightColor = color;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String string) {
        this.text = string;
        if (this.prepared && this.text != null) {
            Rectangle rectangle = this.myFont.calcTextBounds(this.text);
            if (this.onStage && this.attached) {
                this.parent.invalidateRectangle(this.bounds);
            }
            this.setImageSize(rectangle.width + 16, rectangle.height + 6);
            if (this.onStage && this.attached) {
                this.parent.invalidateRectangle(this.bounds);
            }
        }
    }

    public void setScalingFactor(float f) {
    }

    public void setImageSize(int n, int n2) {
        this.bounds.width = n;
        this.bounds.height = n2;
        if (this.alignment == 0) {
            this.bounds.x = this.realLocation.x - n / 2;
        }
    }

    public Rectangle fixInvalidation(Rectangle rectangle) {
        this.fixRect.setBounds(this.bounds.x - 2, this.bounds.y - 2, this.bounds.width + 2, this.bounds.height + 2);
        return rectangle.union(this.fixRect);
    }

    public void paint(Rectangle rectangle, BitBuffer bitBuffer) {
        Rectangle rectangle2;
        if (!this.prepared) {
            this.prepare();
        }
        if ((rectangle2 = rectangle.intersection(this.bounds)).isEmpty()) {
            return;
        }
        if (this.text != null) {
            this.poo = this.getLocation();
            this.poo.translate(8, 3);
            if (!this.highlighted || !this.over) {
                if (!this.useBackgroundColor) {
                    if (this.alignment == 1) {
                        this.poo.translate(-1, -1);
                        bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                        this.poo.translate(2, 0);
                        bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                        this.poo.translate(0, 2);
                        bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                        this.poo.translate(-2, 0);
                        bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                        this.poo.translate(1, -1);
                        bitBuffer.renderText(this.text, this.myFont, this.poo, this.color, null);
                    } else if (this.alignment == 0) {
                        this.realLocation.translate(-1, -1);
                        bitBuffer.renderText(this.text, this.myFont, this.realLocation, this.boldColor, null);
                        this.realLocation.translate(2, 0);
                        bitBuffer.renderText(this.text, this.myFont, this.realLocation, this.boldColor, null);
                        this.realLocation.translate(0, 2);
                        bitBuffer.renderText(this.text, this.myFont, this.realLocation, this.boldColor, null);
                        this.realLocation.translate(-2, 0);
                        bitBuffer.renderText(this.text, this.myFont, this.realLocation, this.boldColor, null);
                        this.realLocation.translate(1, -1);
                        bitBuffer.renderText(this.text, this.myFont, this.realLocation, this.color, null);
                    }
                } else {
                    bitBuffer.renderText(this.text, this.myFont, this.poo, this.color, this.backgroundColor);
                }
            } else if (!this.useBackgroundColor) {
                this.poo.translate(-1, -1);
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                this.poo.translate(2, 0);
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                this.poo.translate(0, 2);
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                this.poo.translate(-2, 0);
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.boldColor, null);
                this.poo.translate(1, -1);
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.highlightColor, null);
            } else {
                bitBuffer.renderText(this.text, this.myFont, this.poo, this.highlightColor, this.backgroundColor);
            }
        }
    }

    public void paint(int n, int n2, int n3, int n4, BitBuffer bitBuffer) {
        this.paint(new Rectangle(n, n2, n3, n4), bitBuffer);
    }

    public void actorEntered(AGTMouseEvent aGTMouseEvent) {
        this.over = true;
        this.parent.invalidateRectangle(this.bounds);
    }

    public void actorExited(AGTMouseEvent aGTMouseEvent) {
        this.over = false;
        this.parent.invalidateRectangle(this.bounds);
    }

    public void actorClicked(AGTMouseEvent aGTMouseEvent) {
    }

    public void reset() {
    }

    public void kill() {
        super.kill();
        this.unprepare();
    }

    public TextActorFace() {
        this.color = new Color24(0, 0, 0);
        this.highlightColor = new Color24(255, 0, 0);
    }
}
