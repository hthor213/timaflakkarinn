/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.draw;

import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.draw.ImageReader;
import java.io.FileNotFoundException;

public class ImageReaderBMP
extends ImageReader {
    String filename;

    public ImageReaderBMP(String string) throws BogusFileFormatException, FileNotFoundException, Exception {
        this.filename = string;
        int n = this.decodeFile(string);
        switch (n) {
            case 0: {
                return;
            }
            case 1: {
                throw new FileNotFoundException();
            }
            case 2: {
                throw new BogusFileFormatException();
            }
            case 3: {
                throw new Exception("Unknown image load error");
            }
            case 4: {
                throw new Exception("Unknown buffer creation error");
            }
        }
        throw new Exception("Unknown error");
    }

    private native int decodeFile(String var1);

    public boolean reload() {
        int n = this.recoverFile();
        return n == 0;
    }

    private native int recoverFile();
}
