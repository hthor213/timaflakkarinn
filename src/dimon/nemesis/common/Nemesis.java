/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.common;

import is.dimon.nemesis.common.AlreadyExistsException;
import is.dimon.nemesis.common.EventThread;
import is.dimon.nemesis.common.Volume;
import is.dimon.nemesis.input.Keyboard;
import is.dimon.nemesis.input.Mouse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

public class Nemesis {
    private static int refCount;
    private static Mouse mouse;
    private static Keyboard keyboard;
    public static long pollingPeriod;
    private static Properties properties;

    public static Mouse getMouse() {
        return mouse;
    }

    public static Keyboard getKeyboard() {
        return keyboard;
    }

    public static synchronized boolean init() throws AlreadyExistsException {
        if (refCount != 0) {
            throw new AlreadyExistsException("Nemesis already initialized.");
        }
        ++refCount;
        System.runFinalizersOnExit(true);
        System.loadLibrary("Nemesis");
        if (Nemesis.nativeInit() < 0) {
            System.err.println("Nemesis::init : nativeInit failed.");
            return false;
        }
        System.err.println("Nemesis::init : ok after nativeInit");
        while (!Nemesis.isInitFinished()) {
            System.err.println("still not finished");
            try {
                Thread.currentThread();
                Thread.sleep(10L);
            }
            catch (InterruptedException interruptedException) {}
        }
        System.err.println("Nemesis::init : nativeinit is finished");
        if (!Nemesis.wasInitSuccessful()) {
            System.err.println("Native initialization failed.\n");
            return false;
        }
        System.err.println("Nemesis::init : Starting event polling thread if necessary");
        if (Nemesis.isPollingNeeded()) {
            EventThread et = new EventThread();
            et.setDaemon(true);
            et.setName("NemesisEventThread");
            et.start();
        }
        System.err.println("Nemesis::init : comin' outta here ok.");
        return true;
    }

    private static native int nativeInit();

    private static native boolean isInitFinished();

    private static native boolean wasInitSuccessful();

    public static String getProperty(String key, String defaultValue) {
        String val = properties.getProperty(key);
        return val == null ? defaultValue : val;
    }

    public static void stop() {
        if (refCount >= 0) {
            --refCount;
        }
        Nemesis.nativeStop();
    }

    private static native void nativeStop();

    public static native boolean isPollingNeeded();

    public static native boolean pollSystemEvents();

    public static native void exit();

    public static native Volume[] getVolumes();

    public static native String getPathToNemesis();

    static {
        mouse = new Mouse();
        keyboard = new Keyboard();
        pollingPeriod = 30L;
        String sep = File.separator;
        File propsFile = new File(String.valueOf(System.getProperty("java.home")) + sep + "lib" + sep + "awt.properties");
        properties = new Properties();
        try {
            FileInputStream in = new FileInputStream(propsFile);
            properties.load(new BufferedInputStream(in));
            in.close();
        }
        catch (Exception exception) {}
    }
}
