/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.draw.ImageReader;
import java.io.FileNotFoundException;

public class ImageReaderGIF
extends ImageReader {
    public ImageReaderGIF(String string) throws BogusFileFormatException, FileNotFoundException {
        int n = this.decodeFile(string);
        switch (n) {
            case 1: {
                throw new FileNotFoundException();
            }
            case 2: {
                throw new BogusFileFormatException();
            }
        }
    }

    private native int decodeFile(String var1);

    public native boolean reload();
}
