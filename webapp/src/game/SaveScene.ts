import { Scene } from '../engine/Scene';
import { Terrain } from '../engine/Terrain';
import { Actor } from '../engine/Actor';
import { StaticActorFace, TextActorFace } from '../engine/ActorFace';
import type { AssetLoader } from '../engine/AssetLoader';
import type { World } from '../engine/World';
import { SaveStore, type SaveData, type SlotMeta, type SlotsMeta } from './SaveStore';

export type MenuResult =
  | { kind: 'newGame' }
  | { kind: 'loadSlot'; index: number; data: SaveData }
  | { kind: 'saveSlot'; index: number; name: string }
  | { kind: 'resume' }
  | { kind: 'quit' };

type SubMode = 'idle' | 'confirmQuit' | 'overwrite' | 'nameInput' | 'message';
type Action = 'load' | 'save';

const WHITE = { r: 255, g: 255, b: 255 };
const GREEN = { r: 120, g: 190, b: 30 };
const GRAY  = { r: 100, g: 100, b: 100 };
const BUTTON_FONT = 18;
const SLOT_FONT = 16;
const PROMPT_FONT = 18;

function pad20(s: string): string {
  while (s.length < 20) s = s + ' ';
  return s;
}

function fmtTime(ts: number): string {
  const d = new Date(ts);
  const pad = (n: number) => String(n).padStart(2, '0');
  return `${pad(d.getDate())}.${pad(d.getMonth() + 1)} ${pad(d.getHours())}:${pad(d.getMinutes())}`;
}

interface ButtonSpec {
  name: string;
  text: string;
  x: number; y: number; z: number;
}

export class SaveScene {
  scene: Scene;
  terrain: Terrain;
  store: SaveStore;

  private background: Actor;
  private buttonLoad: Actor;
  private buttonSave: Actor;
  private buttonQuit: Actor;
  private buttonBack: Actor;
  private slots: Actor[] = [];
  private slotFaces: TextActorFace[] = [];

  private dialogBg: Actor;
  private prompt: Actor;
  private promptFace: TextActorFace;
  private okBtn: Actor;
  private yesBtn: Actor;
  private noBtn: Actor;
  private inputActor: Actor;
  private inputFace: TextActorFace;

  private mode: 'main' | 'pause' = 'main';
  private sub: SubMode = 'idle';
  private pending: Action = 'load';
  private pendingSlot: number = -1;
  private inputBuffer = '';
  private resolver: ((r: MenuResult) => void) | null = null;
  private slotsMeta: SlotsMeta = { slots: new Array(10).fill(null) };

  constructor(world: World, loader: AssetLoader, resourcePath: string) {
    void world;
    void resourcePath;
    void loader;
    this.store = new SaveStore();

    this.scene = new Scene('saveScene');
    this.scene.backgroundColor = { r: 0, g: 0, b: 0 };

    this.terrain = new Terrain('saveTerrain');
    this.terrain.setPolygon([[-1, 601], [801, 601], [801, -1], [-1, -1]]);
    this.terrain.zMin = 3000;
    this.terrain.zMax = 5000;
    this.terrain.defaultScaling = 1.0;
    this.scene.addTerrain(this.terrain);

    // Bakgrunnur
    const bgFace = new StaticActorFace('saveBack', '\\common\\graphic\\saveload');
    bgFace.transparent = false;
    bgFace.loader = loader;
    bgFace.pulser = world.pulser;
    this.background = this.makeActor('saveBack_actor', bgFace, 0, 3000, 3000);

    // 4 hnappar
    this.buttonLoad = this.makeButton({ name: 'btnLoad', text: 'Opna leik', x: 60,  y: 3095, z: 3000 });
    this.buttonSave = this.makeButton({ name: 'btnSave', text: 'Vista leik', x: 260, y: 3095, z: 3000 });
    this.buttonQuit = this.makeButton({ name: 'btnQuit', text: 'Hætta',     x: 460, y: 3095, z: 3000 });
    this.buttonBack = this.makeButton({ name: 'btnBack', text: 'Til baka',  x: 610, y: 3095, z: 3000 });

    // 10 hólf
    for (let i = 0; i < 10; i++) {
      const face = new TextActorFace(`slot${i}_face`);
      face.color = { ...GREEN };
      face.highlighted = true;
      face.fontSize = SLOT_FONT;
      face.setText(`Leikur ${i + 1}`);

      const actor = new Actor(`slot${i}`);
      actor.addState('default', face, null);
      actor.setLocation(100, 178 + i * 30 + 3000, 3000);
      actor.setTerrain(this.terrain);
      actor.setState('default');
      this.wireHover(actor, face);

      this.slots.push(actor);
      this.slotFaces.push(face);
    }

    // Dialog flötur (falinn í byrjun — settum í `none` state)
    const dialogFace = new StaticActorFace('dialogFace', '\\common\\graphic\\dialog');
    dialogFace.loader = loader;
    dialogFace.pulser = world.pulser;
    this.dialogBg = new Actor('dialog_bg');
    this.dialogBg.addState('default', dialogFace, null);
    this.dialogBg.addState('hide', null, null);
    this.dialogBg.setLocation(165, 4200, 4000);
    this.dialogBg.setTerrain(this.terrain);
    this.dialogBg.setState('hide');

    this.promptFace = new TextActorFace('prompt_face');
    this.promptFace.color = { ...WHITE };
    this.promptFace.fontSize = PROMPT_FONT;
    this.promptFace.alignment = 'center';
    this.promptFace.setText(' ');
    this.prompt = new Actor('prompt_actor');
    this.prompt.addState('default', this.promptFace, null);
    this.prompt.addState('hide', null, null);
    this.prompt.setLocation(400, 4720, 4500);
    this.prompt.setTerrain(this.terrain);
    this.prompt.setState('hide');

    this.okBtn  = this.makeDialogButton('okBtn',  'Í lagi!',     370, 4880, 4500);
    this.yesBtn = this.makeDialogButton('yesBtn', 'Í lagi!',     240, 4880, 4500);
    this.noBtn  = this.makeDialogButton('noBtn',  'Hætta við!',  430, 4880, 4500);

    this.inputFace = new TextActorFace('input_face');
    this.inputFace.color = { ...GREEN };
    this.inputFace.fontSize = PROMPT_FONT;
    this.inputFace.setText(' ');
    this.inputActor = new Actor('input_actor');
    this.inputActor.addState('default', this.inputFace, null);
    this.inputActor.addState('hide', null, null);
    this.inputActor.setLocation(240, 4800, 4500);
    this.inputActor.setTerrain(this.terrain);
    this.inputActor.setState('hide');
  }

  private makeActor(name: string, face: StaticActorFace, x: number, y: number, z: number): Actor {
    const a = new Actor(name);
    a.addState('default', face, null);
    a.setLocation(x, y, z);
    a.setTerrain(this.terrain);
    a.setState('default');
    return a;
  }

  private makeButton(spec: ButtonSpec): Actor {
    const face = new TextActorFace(spec.name + '_face');
    face.color = { ...WHITE };
    face.highlighted = true;
    face.fontSize = BUTTON_FONT;
    face.setText(spec.text);

    const a = new Actor(spec.name);
    a.addState('default', face, null);
    a.addState('disabled', face, null);
    a.setLocation(spec.x, spec.y, spec.z);
    a.setTerrain(this.terrain);
    a.setState('default');
    this.wireHover(a, face);
    (a as any)._face = face;
    return a;
  }

  private makeDialogButton(name: string, text: string, x: number, y: number, z: number): Actor {
    const face = new TextActorFace(name + '_face');
    face.color = { ...WHITE };
    face.highlighted = true;
    face.fontSize = PROMPT_FONT;
    face.setText(text);

    const a = new Actor(name);
    a.addState('default', face, null);
    a.addState('hide', null, null);
    a.setLocation(x, y, z);
    a.setTerrain(this.terrain);
    a.setState('hide');
    this.wireHover(a, face);
    return a;
  }

  private wireHover(actor: Actor, face: TextActorFace): void {
    actor.onEntered = () => { face.mouseOver = true; };
    actor.onExited = () => { face.mouseOver = false; };
  }

  /** Hleður inn bakgrunns-myndum (saveload.png + dialog.png) */
  async prepare(loader: AssetLoader): Promise<void> {
    const bgFace = this.background.currentFace;
    const dialogFace = this.dialogBg.states.get('default')?.face ?? null;
    await Promise.all([
      bgFace?.prepare(loader),
      dialogFace?.prepare(loader),
    ]);
  }

  /** Opnar valmyndina og bíður þar til notandi tekur ákvörðun. */
  async open(mode: 'main' | 'pause'): Promise<MenuResult> {
    this.mode = mode;
    this.sub = 'idle';
    this.pending = 'load';
    this.pendingSlot = -1;
    this.inputBuffer = '';

    // Sækja slot-meta og uppfæra texta
    this.slotsMeta = await this.store.getMeta();
    this.refreshSlotLabels();
    this.applyButtonStates();
    this.hideDialog();

    return new Promise<MenuResult>(resolve => {
      this.resolver = resolve;
    });
  }

  /** Lokar valmyndinni innanhúss og resolver promise. */
  private finish(result: MenuResult): void {
    const r = this.resolver;
    this.resolver = null;
    this.sub = 'idle';
    this.hideDialog();
    if (r) r(result);
  }

  /** Uppfærir gráma/lit hnappa eftir mode. */
  private applyButtonStates(): void {
    const isPause = this.mode === 'pause';
    const colorOf = (f: TextActorFace, on: boolean) => {
      f.color = on ? { ...WHITE } : { ...GRAY };
      f.highlighted = on;
    };
    colorOf((this.buttonLoad as any)._face, true);
    colorOf((this.buttonQuit as any)._face, true);
    colorOf((this.buttonSave as any)._face, isPause);
    colorOf((this.buttonBack as any)._face, isPause);
  }

  /** Endurskrifar slot-texta út frá slots-meta */
  private refreshSlotLabels(): void {
    for (let i = 0; i < 10; i++) {
      const meta = this.slotsMeta.slots[i];
      const face = this.slotFaces[i];
      if (meta) {
        face.setText(`Leikur ${i + 1}  ${pad20(meta.name)}  ${fmtTime(meta.timestamp)}`);
        face.color = { ...GREEN };
      } else {
        face.setText(`Leikur ${i + 1}`);
        face.color = { ...GREEN };
      }
    }
  }

  // --- Dialog hjálpartól ---

  private showDialog(prompt: string, kind: 'yesno' | 'ok' | 'name'): void {
    this.sub = kind === 'yesno' ? 'confirmQuit'
            : kind === 'name'  ? 'nameInput'
            :                    'message';
    this.dialogBg.setState('default');
    this.promptFace.setText(prompt);
    this.prompt.setState('default');
    this.prompt.setLocation(400, 4720, 4500);

    if (kind === 'yesno') {
      this.yesBtn.setState('default');
      this.noBtn.setState('default');
      this.okBtn.setState('hide');
      this.inputActor.setState('hide');
    } else if (kind === 'ok') {
      this.okBtn.setState('default');
      this.yesBtn.setState('hide');
      this.noBtn.setState('hide');
      this.inputActor.setState('hide');
    } else {
      this.okBtn.setState('default');
      this.yesBtn.setState('hide');
      this.noBtn.setState('hide');
      this.inputBuffer = '';
      this.inputFace.setText('_');
      this.inputActor.setState('default');
    }
  }

  private hideDialog(): void {
    this.sub = 'idle';
    this.dialogBg.setState('hide');
    this.prompt.setState('hide');
    this.okBtn.setState('hide');
    this.yesBtn.setState('hide');
    this.noBtn.setState('hide');
    this.inputActor.setState('hide');
  }

  // --- Atvik frá heimi ---

  /** Kallað þegar smellt er á actor í saveScene. */
  handleClick(actor: Actor, button: number): void {
    if (button !== 0) return;
    if (!this.resolver) return;

    // Dialog mode: aðeins dialog-hnappar virkir
    if (this.sub !== 'idle') {
      if (this.sub === 'confirmQuit') {
        if (actor === this.yesBtn) {
          this.finish({ kind: 'quit' });
        } else if (actor === this.noBtn) {
          this.hideDialog();
        }
      } else if (this.sub === 'overwrite') {
        if (actor === this.yesBtn) {
          this.startNameInput();
        } else if (actor === this.noBtn) {
          this.hideDialog();
        }
      } else if (this.sub === 'message') {
        if (actor === this.okBtn) this.hideDialog();
      } else if (this.sub === 'nameInput') {
        if (actor === this.okBtn) this.commitNameInput();
      }
      return;
    }

    // Idle mode: button + slot dispatch
    const isPause = this.mode === 'pause';

    if (actor === this.buttonLoad) {
      this.pending = 'load';
      return;
    }
    if (actor === this.buttonSave) {
      if (!isPause) return;
      this.pending = 'save';
      return;
    }
    if (actor === this.buttonBack) {
      if (!isPause) return;
      this.finish({ kind: 'resume' });
      return;
    }
    if (actor === this.buttonQuit) {
      if (isPause) {
        this.showDialog('Vilt þú örugglega hætta í leiknum?', 'yesno');
      } else {
        this.finish({ kind: 'quit' });
      }
      return;
    }

    // Slot click
    const slotIdx = this.slots.indexOf(actor);
    if (slotIdx >= 0) this.handleSlotClick(slotIdx);
  }

  private handleSlotClick(index: number): void {
    const meta = this.slotsMeta.slots[index];

    if (this.pending === 'save') {
      this.pendingSlot = index;
      if (meta) {
        this.showDialog('Skrifa yfir vistun?', 'yesno');
        this.sub = 'overwrite';
      } else {
        this.startNameInput();
      }
      return;
    }

    // load
    if (!meta) {
      // Tómt hólf í main mode → nýtt spil
      if (this.mode === 'main') {
        this.finish({ kind: 'newGame' });
      }
      return;
    }

    // Sækja gögn og resolve
    this.store.getSlot(index).then(data => {
      if (data) this.finish({ kind: 'loadSlot', index, data });
    });
  }

  private startNameInput(): void {
    this.inputBuffer = '';
    this.showDialog('Sláðu inn nafn fyrir vistun:', 'name');
  }

  private commitNameInput(): void {
    const name = this.inputBuffer.trim() || `Leikur ${this.pendingSlot + 1}`;
    this.finish({ kind: 'saveSlot', index: this.pendingSlot, name });
  }

  /** Lyklaborðsinngjöf — bara virk í name-input mode. */
  handleKeyDown(key: string): void {
    if (this.sub !== 'nameInput') return;
    if (key === 'Enter') {
      this.commitNameInput();
      return;
    }
    if (key === 'Escape') {
      this.hideDialog();
      return;
    }
    if (key === 'Backspace') {
      this.inputBuffer = this.inputBuffer.slice(0, -1);
    } else if (key.length === 1 && this.inputBuffer.length < 20) {
      this.inputBuffer += key;
    }
    this.inputFace.setText(this.inputBuffer + '_');
  }

  /** Síðan leikur er vistaður, getum endurnýjað slotsMeta án þess að loka valmynd. */
  async refreshAfterSave(): Promise<void> {
    this.slotsMeta = await this.store.getMeta();
    this.refreshSlotLabels();
  }
}

export type { SlotMeta, SlotsMeta, SaveData };
