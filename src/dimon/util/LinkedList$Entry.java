/*
 * Decompiled with CFR 0.152.
 */
package is.dimon.util;

private static class LinkedList.Entry {
    Object element;
    LinkedList.Entry next;
    LinkedList.Entry previous;

    LinkedList.Entry(Object element, LinkedList.Entry next, LinkedList.Entry previous) {
        this.element = element;
        this.next = next;
        this.previous = previous;
    }
}
