/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

import is.dimon.util.AbstractList;
import is.dimon.util.Comparable;
import is.dimon.util.Comparator;
import is.dimon.util.List;

public class Arrays {
    public static void sort(long[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(int[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(short[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(char[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(byte[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(double[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    public static void sort(float[] a) {
        Arrays.sort1(a, 0, a.length);
    }

    private static void sort1(long[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        long v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(long[] x, int a, int b) {
        long t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(long[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(long[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(int[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        int v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(int[] x, int a, int b) {
        int t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(int[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(int[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(short[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        short v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(short[] x, int a, int b) {
        short t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(short[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(short[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(char[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        char v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(char[] x, int a, int b) {
        char t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(char[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(char[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(byte[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        byte v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(byte[] x, int a, int b) {
        byte t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(byte[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(byte[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(double[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        double v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(double[] x, int a, int b) {
        double t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(double[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(double[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    private static void sort1(float[] x, int off, int len) {
        int c;
        int a;
        if (len < 7) {
            int i = off;
            while (i < len + off) {
                int j = i;
                while (j > off && x[j - 1] > x[j]) {
                    Arrays.swap(x, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int m = off + len / 2;
        if (len > 7) {
            int l = off;
            int n = off + len - 1;
            if (len > 40) {
                int s = len / 8;
                l = Arrays.med3(x, l, l + s, l + 2 * s);
                m = Arrays.med3(x, m - s, m, m + s);
                n = Arrays.med3(x, n - 2 * s, n - s, n);
            }
            m = Arrays.med3(x, l, m, n);
        }
        float v = x[m];
        int b = a = off;
        int d = c = off + len - 1;
        while (true) {
            if (b <= c && x[b] <= v) {
                if (x[b] == v) {
                    Arrays.swap(x, a++, b);
                }
                ++b;
                continue;
            }
            while (c >= b && x[c] >= v) {
                if (x[c] == v) {
                    Arrays.swap(x, c, d--);
                }
                --c;
            }
            if (b > c) break;
            Arrays.swap(x, b++, c--);
        }
        int n = off + len;
        int s = Math.min(a - off, b - a);
        Arrays.vecswap(x, off, b - s, s);
        s = Math.min(d - c, n - d - 1);
        Arrays.vecswap(x, b, n - s, s);
        s = b - a;
        if (s > 1) {
            Arrays.sort1(x, off, s);
        }
        if ((s = d - c) > 1) {
            Arrays.sort1(x, n - s, s);
        }
    }

    private static void swap(float[] x, int a, int b) {
        float t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    private static void vecswap(float[] x, int a, int b, int n) {
        int i = 0;
        while (i < n) {
            Arrays.swap(x, a, b);
            ++i;
            ++a;
            ++b;
        }
    }

    private static int med3(float[] x, int a, int b, int c) {
        return x[a] < x[b] ? (x[b] < x[c] ? b : (x[a] < x[c] ? c : a)) : (x[b] > x[c] ? b : (x[a] > x[c] ? c : a));
    }

    public static void sort(Object[] a) {
        Object[] aux = (Object[])a.clone();
        Arrays.mergeSort(aux, a, 0, a.length);
    }

    private static void mergeSort(Object[] src, Object[] dest, int low, int high) {
        int length = high - low;
        if (length < 7) {
            int i = low;
            while (i < high) {
                int j = i;
                while (j > low && ((Comparable)dest[j - 1]).compareTo((Comparable)dest[j]) > 0) {
                    Arrays.swap(dest, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int mid = (low + high) / 2;
        Arrays.mergeSort(dest, src, low, mid);
        Arrays.mergeSort(dest, src, mid, high);
        if (((Comparable)src[mid - 1]).compareTo((Comparable)src[mid]) <= 0) {
            System.arraycopy(src, low, dest, low, length);
            return;
        }
        int i = low;
        int p = low;
        int q = mid;
        while (i < high) {
            dest[i] = q >= high || p < mid && ((Comparable)src[p]).compareTo(src[q]) <= 0 ? src[p++] : src[q++];
            ++i;
        }
    }

    private static void swap(Object[] x, int a, int b) {
        Object t = x[a];
        x[a] = x[b];
        x[b] = t;
    }

    public static void sort(Object[] a, Comparator c) {
        Object[] aux = (Object[])a.clone();
        Arrays.mergeSort(aux, a, 0, a.length, c);
    }

    private static void mergeSort(Object[] src, Object[] dest, int low, int high, Comparator c) {
        int length = high - low;
        if (length < 7) {
            int i = low;
            while (i < high) {
                int j = i;
                while (j > low && c.compare(dest[j - 1], dest[j]) > 0) {
                    Arrays.swap(dest, j, j - 1);
                    --j;
                }
                ++i;
            }
            return;
        }
        int mid = (low + high) / 2;
        Arrays.mergeSort(dest, src, low, mid, c);
        Arrays.mergeSort(dest, src, mid, high, c);
        if (c.compare(src[mid - 1], src[mid]) <= 0) {
            System.arraycopy(src, low, dest, low, length);
            return;
        }
        int i = low;
        int p = low;
        int q = mid;
        while (i < high) {
            dest[i] = q >= high || p < mid && c.compare(src[p], src[q]) <= 0 ? src[p++] : src[q++];
            ++i;
        }
    }

    public static int binarySearch(long[] a, long key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            long midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(int[] a, int key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            int midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(short[] a, short key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            short midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(char[] a, char key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            char midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(byte[] a, byte key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            byte midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(double[] a, double key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            double midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(float[] a, float key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            float midVal = a[mid];
            if (midVal < key) {
                low = mid + 1;
                continue;
            }
            if (midVal > key) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(Object[] a, Object key) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            Object midVal = a[mid];
            int cmp = ((Comparable)midVal).compareTo(key);
            if (cmp < 0) {
                low = mid + 1;
                continue;
            }
            if (cmp > 0) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static int binarySearch(Object[] a, Object key, Comparator c) {
        int low = 0;
        int high = a.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            Object midVal = a[mid];
            int cmp = c.compare(midVal, key);
            if (cmp < 0) {
                low = mid + 1;
                continue;
            }
            if (cmp > 0) {
                high = mid - 1;
                continue;
            }
            return mid;
        }
        return -(low + 1);
    }

    public static boolean equals(long[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof long[])) {
            return false;
        }
        long[] a2 = (long[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(int[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof int[])) {
            return false;
        }
        int[] a2 = (int[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(short[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof short[])) {
            return false;
        }
        short[] a2 = (short[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(char[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof char[])) {
            return false;
        }
        char[] a2 = (char[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(byte[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof byte[])) {
            return false;
        }
        byte[] a2 = (byte[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(boolean[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof boolean[])) {
            return false;
        }
        boolean[] a2 = (boolean[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(double[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof double[])) {
            return false;
        }
        double[] a2 = (double[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(float[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof float[])) {
            return false;
        }
        float[] a2 = (float[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            if (a[i] != a2[i]) {
                return false;
            }
            ++i;
        }
        return true;
    }

    public static boolean equals(Object[] a, Object o) {
        if (a == o) {
            return true;
        }
        if (a == null || !(o instanceof Object[])) {
            return false;
        }
        Object[] a2 = (Object[])o;
        int length = a.length;
        if (a2.length != length) {
            return false;
        }
        int i = 0;
        while (i < length) {
            block6: {
                boolean bl;
                block7: {
                    Object o2;
                    Object o1;
                    block5: {
                        o1 = a[i];
                        o2 = a2[i];
                        if (o1 != null) break block5;
                        if (o2 == null) break block6;
                        bl = false;
                        break block7;
                    }
                    bl = o1.equals(o2);
                }
                if (!bl) {
                    return false;
                }
            }
            ++i;
        }
        return true;
    }

    public static void fill(long[] a, long val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(int[] a, int val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(short[] a, short val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(char[] a, char val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(byte[] a, byte val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(boolean[] a, boolean val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(double[] a, double val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(float[] a, float val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static void fill(Object[] a, Object val) {
        int length = a.length;
        int i = 0;
        while (i < length) {
            a[i] = val;
            ++i;
        }
    }

    public static List toList(Object[] a) {
        return new ArrayList(a);
    }

    private static class ArrayList
    extends AbstractList
    implements Cloneable {
        private Object[] a;

        ArrayList(Object[] array) {
            this.a = array;
        }

        public int size() {
            return this.a.length;
        }

        public Object[] toArray() {
            return (Object[])this.a.clone();
        }

        public Object get(int index) {
            return this.a[index];
        }

        public Object set(int index, Object element) {
            Object oldValue = this.a[index];
            this.a[index] = element;
            return oldValue;
        }

        public Object clone() {
            return new ArrayList(this.toArray());
        }
    }
}
