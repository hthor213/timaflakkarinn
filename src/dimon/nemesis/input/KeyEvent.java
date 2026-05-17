/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.input;

import is.dimon.nemesis.common.Nemesis;
import is.dimon.nemesis.input.InputEvent;

public class KeyEvent
extends InputEvent {
    public static final int KEY_FIRST = 400;
    public static final int KEY_LAST = 402;
    public static final int KEY_TYPED = 400;
    public static final int KEY_PRESSED = 401;
    public static final int KEY_RELEASED = 402;
    public static final int VK_ENTER = 10;
    public static final int VK_BACK_SPACE = 8;
    public static final int VK_TAB = 9;
    public static final int VK_CANCEL = 3;
    public static final int VK_CLEAR = 12;
    public static final int VK_SHIFT = 16;
    public static final int VK_CONTROL = 17;
    public static final int VK_ALT = 18;
    public static final int VK_PAUSE = 19;
    public static final int VK_CAPS_LOCK = 20;
    public static final int VK_ESCAPE = 27;
    public static final int VK_SPACE = 32;
    public static final int VK_PAGE_UP = 33;
    public static final int VK_PAGE_DOWN = 34;
    public static final int VK_END = 35;
    public static final int VK_HOME = 36;
    public static final int VK_LEFT = 37;
    public static final int VK_UP = 38;
    public static final int VK_RIGHT = 39;
    public static final int VK_DOWN = 40;
    public static final int VK_COMMA = 44;
    public static final int VK_PERIOD = 46;
    public static final int VK_SLASH = 47;
    public static final int VK_0 = 48;
    public static final int VK_1 = 49;
    public static final int VK_2 = 50;
    public static final int VK_3 = 51;
    public static final int VK_4 = 52;
    public static final int VK_5 = 53;
    public static final int VK_6 = 54;
    public static final int VK_7 = 55;
    public static final int VK_8 = 56;
    public static final int VK_9 = 57;
    public static final int VK_SEMICOLON = 59;
    public static final int VK_EQUALS = 61;
    public static final int VK_A = 65;
    public static final int VK_B = 66;
    public static final int VK_C = 67;
    public static final int VK_D = 68;
    public static final int VK_E = 69;
    public static final int VK_F = 70;
    public static final int VK_G = 71;
    public static final int VK_H = 72;
    public static final int VK_I = 73;
    public static final int VK_J = 74;
    public static final int VK_K = 75;
    public static final int VK_L = 76;
    public static final int VK_M = 77;
    public static final int VK_N = 78;
    public static final int VK_O = 79;
    public static final int VK_P = 80;
    public static final int VK_Q = 81;
    public static final int VK_R = 82;
    public static final int VK_S = 83;
    public static final int VK_T = 84;
    public static final int VK_U = 85;
    public static final int VK_V = 86;
    public static final int VK_W = 87;
    public static final int VK_X = 88;
    public static final int VK_Y = 89;
    public static final int VK_Z = 90;
    public static final int VK_OPEN_BRACKET = 91;
    public static final int VK_BACK_SLASH = 92;
    public static final int VK_CLOSE_BRACKET = 93;
    public static final int VK_NUMPAD0 = 96;
    public static final int VK_NUMPAD1 = 97;
    public static final int VK_NUMPAD2 = 98;
    public static final int VK_NUMPAD3 = 99;
    public static final int VK_NUMPAD4 = 100;
    public static final int VK_NUMPAD5 = 101;
    public static final int VK_NUMPAD6 = 102;
    public static final int VK_NUMPAD7 = 103;
    public static final int VK_NUMPAD8 = 104;
    public static final int VK_NUMPAD9 = 105;
    public static final int VK_MULTIPLY = 106;
    public static final int VK_ADD = 107;
    public static final int VK_SEPARATER = 108;
    public static final int VK_SUBTRACT = 109;
    public static final int VK_DECIMAL = 110;
    public static final int VK_DIVIDE = 111;
    public static final int VK_F1 = 112;
    public static final int VK_F2 = 113;
    public static final int VK_F3 = 114;
    public static final int VK_F4 = 115;
    public static final int VK_F5 = 116;
    public static final int VK_F6 = 117;
    public static final int VK_F7 = 118;
    public static final int VK_F8 = 119;
    public static final int VK_F9 = 120;
    public static final int VK_F10 = 121;
    public static final int VK_F11 = 122;
    public static final int VK_F12 = 123;
    public static final int VK_DELETE = 127;
    public static final int VK_NUM_LOCK = 144;
    public static final int VK_SCROLL_LOCK = 145;
    public static final int VK_PRINTSCREEN = 154;
    public static final int VK_INSERT = 155;
    public static final int VK_HELP = 156;
    public static final int VK_META = 157;
    public static final int VK_BACK_QUOTE = 192;
    public static final int VK_QUOTE = 222;
    public static final int VK_FINAL = 24;
    public static final int VK_CONVERT = 28;
    public static final int VK_NONCONVERT = 29;
    public static final int VK_ACCEPT = 30;
    public static final int VK_MODECHANGE = 31;
    public static final int VK_KANA = 21;
    public static final int VK_KANJI = 25;
    public static final int VK_UNDEFINED = 0;
    public static final char CHAR_UNDEFINED = '\u0000';
    int keyCode;
    char keyChar;

    public KeyEvent(int n, int n2, int n3, char c) {
        super(n, n2);
        if (n == 400 && c == '\u0000') {
            throw new IllegalArgumentException("invalid keyChar");
        }
        if (n == 400 && n3 != 0) {
            throw new IllegalArgumentException("invalid keyCode");
        }
        this.keyCode = n3;
        this.keyChar = c;
    }

    public int getKeyCode() {
        return this.keyCode;
    }

    public void setKeyCode(int n) {
        this.keyCode = n;
    }

    public void setKeyChar(char c) {
        this.keyChar = c;
    }

    public char getKeyChar() {
        return this.keyChar;
    }

    public static String getKeyText(int n) {
        if (n >= 48 && n <= 57 || n >= 65 && n <= 90) {
            return String.valueOf((char)n);
        }
        int n2 = ",./;=[\\]".indexOf(n);
        if (n2 >= 0) {
            return String.valueOf((char)n);
        }
        switch (n) {
            case 10: {
                return Nemesis.getProperty("AWT.enter", "Enter");
            }
            case 8: {
                return Nemesis.getProperty("AWT.backSpace", "Backspace");
            }
            case 9: {
                return Nemesis.getProperty("AWT.tab", "Tab");
            }
            case 3: {
                return Nemesis.getProperty("AWT.cancel", "Cancel");
            }
            case 12: {
                return Nemesis.getProperty("AWT.clear", "Clear");
            }
            case 16: {
                return Nemesis.getProperty("AWT.shift", "Shift");
            }
            case 17: {
                return Nemesis.getProperty("AWT.control", "Control");
            }
            case 18: {
                return Nemesis.getProperty("AWT.alt", "Alt");
            }
            case 19: {
                return Nemesis.getProperty("AWT.pause", "Pause");
            }
            case 20: {
                return Nemesis.getProperty("AWT.capsLock", "Caps Lock");
            }
            case 27: {
                return Nemesis.getProperty("AWT.escape", "Escape");
            }
            case 32: {
                return Nemesis.getProperty("AWT.space", "Space");
            }
            case 33: {
                return Nemesis.getProperty("AWT.pgup", "Page Up");
            }
            case 34: {
                return Nemesis.getProperty("AWT.pgdn", "Page Down");
            }
            case 35: {
                return Nemesis.getProperty("AWT.end", "End");
            }
            case 36: {
                return Nemesis.getProperty("AWT.home", "Home");
            }
            case 37: {
                return Nemesis.getProperty("AWT.left", "Left");
            }
            case 38: {
                return Nemesis.getProperty("AWT.up", "Up");
            }
            case 39: {
                return Nemesis.getProperty("AWT.right", "Right");
            }
            case 40: {
                return Nemesis.getProperty("AWT.down", "Down");
            }
            case 106: {
                return Nemesis.getProperty("AWT.multiply", "NumPad *");
            }
            case 107: {
                return Nemesis.getProperty("AWT.add", "NumPad +");
            }
            case 108: {
                return Nemesis.getProperty("AWT.separater", "NumPad ,");
            }
            case 109: {
                return Nemesis.getProperty("AWT.subtract", "NumPad -");
            }
            case 110: {
                return Nemesis.getProperty("AWT.decimal", "NumPad .");
            }
            case 111: {
                return Nemesis.getProperty("AWT.divide", "NumPad /");
            }
            case 112: {
                return Nemesis.getProperty("AWT.f1", "F1");
            }
            case 113: {
                return Nemesis.getProperty("AWT.f2", "F2");
            }
            case 114: {
                return Nemesis.getProperty("AWT.f3", "F3");
            }
            case 115: {
                return Nemesis.getProperty("AWT.f4", "F4");
            }
            case 116: {
                return Nemesis.getProperty("AWT.f5", "F5");
            }
            case 117: {
                return Nemesis.getProperty("AWT.f6", "F6");
            }
            case 118: {
                return Nemesis.getProperty("AWT.f7", "F7");
            }
            case 119: {
                return Nemesis.getProperty("AWT.f8", "F8");
            }
            case 120: {
                return Nemesis.getProperty("AWT.f9", "F9");
            }
            case 121: {
                return Nemesis.getProperty("AWT.f10", "F10");
            }
            case 122: {
                return Nemesis.getProperty("AWT.f11", "F11");
            }
            case 123: {
                return Nemesis.getProperty("AWT.f12", "F12");
            }
            case 127: {
                return Nemesis.getProperty("AWT.delete", "Delete");
            }
            case 144: {
                return Nemesis.getProperty("AWT.numLock", "Num Lock");
            }
            case 145: {
                return Nemesis.getProperty("AWT.scrollLock", "Scroll Lock");
            }
            case 154: {
                return Nemesis.getProperty("AWT.printScreen", "Print Screen");
            }
            case 155: {
                return Nemesis.getProperty("AWT.insert", "Insert");
            }
            case 156: {
                return Nemesis.getProperty("AWT.help", "Help");
            }
            case 157: {
                return Nemesis.getProperty("AWT.meta", "Meta");
            }
            case 192: {
                return Nemesis.getProperty("AWT.backQuote", "Back Quote");
            }
            case 222: {
                return Nemesis.getProperty("AWT.quote", "Quote");
            }
            case 24: {
                return Nemesis.getProperty("AWT.final", "Final");
            }
            case 28: {
                return Nemesis.getProperty("AWT.convert", "Convert");
            }
            case 29: {
                return Nemesis.getProperty("AWT.noconvert", "No Convert");
            }
            case 30: {
                return Nemesis.getProperty("AWT.accept", "Accept");
            }
            case 31: {
                return Nemesis.getProperty("AWT.modechange", "Mode Change");
            }
            case 21: {
                return Nemesis.getProperty("AWT.kana", "Kana");
            }
            case 25: {
                return Nemesis.getProperty("AWT.kanji", "Kanji");
            }
        }
        if (n >= 96 && n <= 105) {
            String string = Nemesis.getProperty("AWT.numpad", "NumPad");
            char c = (char)(n - 96 + 48);
            return String.valueOf(string) + "-" + c;
        }
        String string = Nemesis.getProperty("AWT.unknown", "Unknown keyCode");
        return String.valueOf(string) + ": 0x" + Integer.toString(n, 16);
    }

    public static String getKeyModifiersText(int n) {
        StringBuffer stringBuffer = new StringBuffer();
        if ((n & 4) != 0) {
            stringBuffer.append(Nemesis.getProperty("AWT.meta", "Meta"));
            stringBuffer.append("+");
        }
        if ((n & 2) != 0) {
            stringBuffer.append(Nemesis.getProperty("AWT.control", "Ctrl"));
            stringBuffer.append("+");
        }
        if ((n & 8) != 0) {
            stringBuffer.append(Nemesis.getProperty("AWT.alt", "Alt"));
            stringBuffer.append("+");
        }
        if ((n & 1) != 0) {
            stringBuffer.append(Nemesis.getProperty("AWT.shift", "Shift"));
            stringBuffer.append("+");
        }
        if (stringBuffer.length() > 0) {
            stringBuffer.setLength(stringBuffer.length() - 1);
        }
        return stringBuffer.toString();
    }

    public boolean isActionKey() {
        switch (this.keyCode) {
            case 19: 
            case 20: 
            case 33: 
            case 34: 
            case 35: 
            case 36: 
            case 37: 
            case 38: 
            case 39: 
            case 40: 
            case 112: 
            case 113: 
            case 114: 
            case 115: 
            case 116: 
            case 117: 
            case 118: 
            case 119: 
            case 120: 
            case 121: 
            case 122: 
            case 123: 
            case 144: 
            case 145: 
            case 154: 
            case 155: {
                return true;
            }
        }
        return false;
    }

    public String paramString() {
        String string;
        switch (this.id) {
            case 401: {
                string = "KEY_PRESSED";
                break;
            }
            case 402: {
                string = "KEY_RELEASED";
                break;
            }
            case 400: {
                string = "KEY_TYPED";
                break;
            }
            default: {
                string = "unknown type";
            }
        }
        String string2 = String.valueOf(string) + ",keyCode=" + this.keyCode;
        string2 = this.isActionKey() || this.keyCode == 10 || this.keyCode == 8 || this.keyCode == 9 || this.keyCode == 27 || this.keyCode == 127 || this.keyCode >= 96 && this.keyCode <= 105 ? String.valueOf(string2) + "," + KeyEvent.getKeyText(this.keyCode) : (this.keyChar == '\n' || this.keyChar == '\b' || this.keyChar == '\t' || this.keyChar == '\u001b' || this.keyChar == '\u007f' ? String.valueOf(string2) + "," + KeyEvent.getKeyText(this.keyChar) : String.valueOf(string2) + ",keyChar='" + this.keyChar + "'");
        if (this.modifiers > 0) {
            string2 = String.valueOf(string2) + ",modifiers=" + KeyEvent.getKeyModifiersText(this.modifiers);
        }
        return string2;
    }
}
