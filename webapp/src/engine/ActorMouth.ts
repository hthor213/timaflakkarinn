import type { AssetLoader } from './AssetLoader';
import type { TextActorFace } from './ActorFace';
import type { Actor } from './Actor';
import type { Pulser, Pulsable } from './Pulser';
import { gameLog } from './GameLog';

export interface ActorMouth {
  name: string;
  prepared: boolean;
  finished: boolean;
  loop: boolean;
  volume: number;
  balance: number;

  prepare(loader: AssetLoader): Promise<void>;
  unprepare(): void;
  start(): void;
  stop(): void;
  setVolume(vol: number): void;
  isPlaying(): boolean;
  getDuration(): number;
  onFinished?: () => void;
}

/** Track all active mouths so we can stop them all at once */
const activeMouths = new Set<SimpleActorMouth>();

export function stopAllAudio(): void {
  for (const mouth of activeMouths) {
    mouth.stop();
  }
  activeMouths.clear();
}

/** Simple sound playback mouth */
export class SimpleActorMouth implements ActorMouth {
  name: string;
  soundFilePath: string;
  prepared = false;
  finished = false;
  loop = false;
  volume = 1.0;
  balance = 0;
  onFinished?: () => void;

  private audioBuffer: AudioBuffer | null = null;
  private sourceNode: AudioBufferSourceNode | null = null;
  private gainNode: GainNode | null = null;
  private loader: AssetLoader | null = null;

  constructor(name: string, soundFilePath: string) {
    this.name = name;
    this.soundFilePath = soundFilePath;
  }

  async prepare(loader: AssetLoader): Promise<void> {
    if (this.prepared) return;
    this.loader = loader;
    this.audioBuffer = await loader.loadAudio(this.soundFilePath);
    this.prepared = true;
  }

  unprepare(): void {
    this.stop();
    this.audioBuffer = null;
    this.prepared = false;
  }

  start(): void {
    // Lazy load: if not prepared, try to get loader from _loader field set by parser
    if (!this.loader) {
      this.loader = (this as any)._loader ?? null;
    }
    if (!this.prepared && this.loader) {
      // Start loading, then play when ready
      this.prepare(this.loader).then(() => this.playNow());
      return;
    }
    this.playNow();
  }

  private playNow(): void {
    if (!this.audioBuffer || !this.loader) {
      this.finished = true;
      this.onFinished?.();
      return;
    }

    this.stop();
    this.finished = false;
    activeMouths.add(this);
    gameLog('AUDIO', `play ${this.name} (${this.loop ? 'loop' : 'once'})`);

    const ctx = this.loader.getAudioContext();
    this.gainNode = ctx.createGain();
    this.gainNode.gain.value = this.volume;
    this.gainNode.connect(ctx.destination);

    this.sourceNode = ctx.createBufferSource();
    this.sourceNode.buffer = this.audioBuffer;
    this.sourceNode.loop = this.loop;
    this.sourceNode.connect(this.gainNode);

    this.sourceNode.onended = () => {
      this.finished = true;
      this.onFinished?.();
    };

    this.sourceNode.start();
  }

  stop(): void {
    activeMouths.delete(this);
    if (this.sourceNode) {
      try { this.sourceNode.stop(); } catch {}
      this.sourceNode.disconnect();
      this.sourceNode = null;
    }
    if (this.gainNode) {
      this.gainNode.disconnect();
      this.gainNode = null;
    }
    this.finished = true;
  }

  setVolume(vol: number): void {
    this.volume = vol;
    if (this.gainNode) {
      this.gainNode.gain.value = vol;
    }
  }

  isPlaying(): boolean {
    return this.sourceNode !== null && !this.finished;
  }

  getDuration(): number {
    return this.audioBuffer ? this.audioBuffer.duration * 1000 : 0;
  }
}

/** Speech mouth - syncs text display with audio */
export class SpeechActorMouth extends SimpleActorMouth implements Pulsable {
  sentences: { text: string; time: number }[] = [];
  textFace: TextActorFace | null = null;
  textActor: Actor | null = null;
  /** Screen position for the text actor during speech */
  textMiddle = { x: 400, y: 2030, z: 2000 };

  private pulser: Pulser | null = null;
  private position = 0;
  private startTime = 0;

  addSentence(text: string, time: number): void {
    this.sentences.push({ text, time });
  }

  setTextActorFace(face: TextActorFace): void {
    this.textFace = face;
    this.textFace.alignment = 'center';
  }

  start(): void {
    super.start();
    // Resolve pulser from _pulser if not set (lazy load pattern, like _loader)
    if (!this.pulser) {
      this.pulser = (this as any)._pulser ?? null;
    }
    // Position text actor on screen
    if (!this.textActor && this.textFace?.owner) {
      this.textActor = this.textFace.owner;
    }
    if (this.textActor) {
      this.textActor.setLocation(this.textMiddle.x, this.textMiddle.y, this.textMiddle.z);
    }
    this.position = 0;
    this.startTime = performance.now();
    this.updateSpeech();
    this.pulser?.register(this);
  }

  stop(): void {
    super.stop();
    this.pulser?.unregister(this);
    if (this.textFace) {
      this.textFace.setText('');
    }
  }

  // Pulsable interface
  pulse(_delta: number): void {
    this.updateSpeech();
  }

  getPulseInterval(): number {
    return 50;
  }

  private updateSpeech(): void {
    if (!this.textFace) return;

    // Check if sound finished
    if (this.finished) {
      this.pulser?.unregister(this);
      this.textFace.setText('');
      return;
    }

    if (this.position >= this.sentences.length) {
      this.pulser?.unregister(this);
      return;
    }

    const elapsed = performance.now() - this.startTime;
    while (this.position < this.sentences.length &&
           elapsed >= this.sentences[this.position].time) {
      const sentence = this.sentences[this.position];
      this.textFace.setText(sentence.text);
      // Reposition text actor each sentence update
      if (this.textActor) {
        this.textActor.setLocation(this.textMiddle.x, this.textMiddle.y, this.textMiddle.z);
      }
      this.position++;
    }
  }
}
