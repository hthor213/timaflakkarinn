/** IndexedDB-vafningur fyrir vistanir Tímaflakkarans. */
export interface SaveData {
  version: 1;
  name: string;
  chapter: number;
  chapterName: string;
  currentScene: string;
  flags: Record<string, number>;
  actors: Array<{
    name: string;
    x: number; y: number; z: number;
    state: string;
    terrain: string | null;
  }>;
  timestamp: number;
}

export interface SlotMeta {
  index: number;
  name: string;
  chapterName: string;
  timestamp: number;
}

export interface SlotsMeta {
  slots: Array<SlotMeta | null>;
}

const DB_NAME = 'timaflakkarinn';
const DB_VERSION = 1;
const STORE = 'saves';
const META_KEY = 'slots-meta';
const SLOT_COUNT = 10;
const slotKey = (i: number) => `slot-${i}`;

function openDB(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const req = indexedDB.open(DB_NAME, DB_VERSION);
    req.onupgradeneeded = () => {
      const db = req.result;
      if (!db.objectStoreNames.contains(STORE)) db.createObjectStore(STORE);
    };
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

function emptyMeta(): SlotsMeta {
  return { slots: new Array(SLOT_COUNT).fill(null) };
}

export class SaveStore {
  static readonly slotCount = SLOT_COUNT;

  async getMeta(): Promise<SlotsMeta> {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx = db.transaction(STORE, 'readonly');
      const req = tx.objectStore(STORE).get(META_KEY);
      req.onsuccess = () => resolve((req.result as SlotsMeta) ?? emptyMeta());
      req.onerror = () => reject(req.error);
    });
  }

  async getSlot(index: number): Promise<SaveData | null> {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx = db.transaction(STORE, 'readonly');
      const req = tx.objectStore(STORE).get(slotKey(index));
      req.onsuccess = () => resolve((req.result as SaveData) ?? null);
      req.onerror = () => reject(req.error);
    });
  }

  async putSlot(index: number, data: SaveData): Promise<void> {
    const db = await openDB();
    const meta = await this.getMeta();
    meta.slots[index] = {
      index,
      name: data.name,
      chapterName: data.chapterName,
      timestamp: data.timestamp,
    };
    return new Promise((resolve, reject) => {
      const tx = db.transaction(STORE, 'readwrite');
      tx.objectStore(STORE).put(data, slotKey(index));
      tx.objectStore(STORE).put(meta, META_KEY);
      tx.oncomplete = () => resolve();
      tx.onerror = () => reject(tx.error);
    });
  }

  async deleteSlot(index: number): Promise<void> {
    const db = await openDB();
    const meta = await this.getMeta();
    meta.slots[index] = null;
    return new Promise((resolve, reject) => {
      const tx = db.transaction(STORE, 'readwrite');
      tx.objectStore(STORE).delete(slotKey(index));
      tx.objectStore(STORE).put(meta, META_KEY);
      tx.oncomplete = () => resolve();
      tx.onerror = () => reject(tx.error);
    });
  }

  async hasAnySave(): Promise<boolean> {
    const meta = await this.getMeta();
    return meta.slots.some(s => s !== null);
  }
}
