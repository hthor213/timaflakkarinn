/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

import is.dimon.nemesis.common.BogusFileFormatException;
import is.dimon.nemesis.sound.SoundReader;
import java.io.FileNotFoundException;

public class SoundReaderWAV
extends SoundReader {
    public SoundReaderWAV(String string, boolean bl) throws BogusFileFormatException, FileNotFoundException {
        int n = this.decodeFile(string, bl);
        switch (n) {
            case 1: {
                throw new FileNotFoundException();
            }
            case 2: {
                throw new BogusFileFormatException();
            }
        }
    }

    public SoundReaderWAV(String string) throws BogusFileFormatException, FileNotFoundException {
        this(string, false);
    }

    private native int decodeFile(String var1, boolean var2);

    public native void purge();
}
