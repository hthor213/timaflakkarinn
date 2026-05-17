/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.nemesis.sound;

public class SndFormat {
    public int sampleRate;
    public int bitsPerSample;
    public int channels;

    public SndFormat(int sampleRate, int bitsPerSample, int channels) {
        this.sampleRate = sampleRate;
        this.bitsPerSample = bitsPerSample;
        this.channels = channels;
    }

    public boolean equals(SndFormat other) {
        return this.sampleRate == other.sampleRate && this.bitsPerSample == other.bitsPerSample && this.channels == other.channels;
    }

    public String toString() {
        String result = super.toString();
        result = result.concat(" ");
        result = result.concat(String.valueOf(this.sampleRate));
        result = result.concat(" Hz, ");
        result = result.concat(String.valueOf(this.channels));
        result = result.concat(" channels, ");
        result = result.concat(String.valueOf(this.bitsPerSample));
        result = result.concat(" bits per sample");
        return result;
    }
}
