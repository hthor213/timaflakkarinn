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

/**
 * The subtitle currently on screen, if any.
 *
 * 1998 wrote subtitles for every voiced line and the port already renders them:
 * each SpeechActorMouth carries <Sentence text time> children and steps through
 * them on the audio's clock. 1,315 of them across the four chapters. They are
 * drawn into the canvas, though, which on a phone means a 22px line inside an
 * 800x600 frame scaled to a handset — legible on a laptop, not on a phone held
 * at arm's length, and unreadable is the same as absent if the reason you want
 * subtitles is that the sound is off.
 *
 * The text lives only while the line is playing: stop() and the end of the
 * timeline both clear it, so a non-empty face here means "being spoken now".
 */
export function getCurrentSubtitle(): string | null {
  return getCurrentSubtitleState()?.text ?? null;
}

export interface SubtitleState {
  text: string;
  /** Index of the word being spoken, ESTIMATED. -1 before the first. */
  word: number;
}

export function getCurrentSubtitleState(): SubtitleState | null {
  for (const mouth of activeMouths) {
    if (!(mouth instanceof SpeechActorMouth)) continue;
    const state = mouth.getSubtitleState();
    if (state) return state;
  }
  return null;
}

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

  /**
   * No audio for this line. Base behaviour is to finish at once; SpeechActorMouth
   * overrides it, because in 1999 a line with no recording still displayed its
   * subtitle.
   */
  protected onNoAudio(): void {
    this.finished = true;
    this.onFinished?.();
  }

  protected playNow(): void {
    if (!this.audioBuffer || !this.loader) {
      this.onNoAudio();
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

  /**
   * True when this line has no recording. Three lines shipped that way in 1999 —
   * the voice edit was unfinished when the master had to leave for Sony's UK
   * pressing plant, and the team accepted "displayed but not spoken". See
   * docs/known-issues.md #0.
   *
   * The port used to clear the text as soon as `finished` went true, which it
   * does immediately when there is no buffer — turning that decision into
   * "neither displayed nor spoken". Here the timeline runs on its own clock
   * instead, so the subtitle shows and a wait="true" sequence still waits.
   */
  private silent = false;
  private silentDuration = 0;

  addSentence(text: string, time: number): void {
    this.sentences.push({ text, time });
  }

  setTextActorFace(face: TextActorFace): void {
    this.textFace = face;
    this.textFace.alignment = 'center';
  }

  protected onNoAudio(): void {
    this.silent = true;
    this.finished = false;
    const last = this.sentences[this.sentences.length - 1];
    // Hold the closing line long enough to read: the timing data only says when
    // each sentence *starts*, because the recording used to say when it ended.
    this.silentDuration = last
      ? last.time + Math.max(1500, last.text.length * 60)
      : 1500;
  }

  start(): void {
    this.silent = false;
    this.silentDuration = 0;
    // Resolve these BEFORE super.start(), because it may run playNow()
    // synchronously and playNow is what starts the subtitle timeline.
    if (!this.pulser) {
      this.pulser = (this as any)._pulser ?? null;
    }
    if (!this.textActor && this.textFace?.owner) {
      this.textActor = this.textFace.owner;
    }
    super.start();
  }

  /**
   * Start the subtitle timeline when the sound actually starts, not when start()
   * is called.
   *
   * This is the whole of known-issues #24. SimpleActorMouth.start() returns
   * EARLY the first time a line is played -- it kicks off an async prepare() and
   * defers playNow() to the promise -- and playNow() begins with this.stop(),
   * which for a speech mouth unregisters the pulser and clears the text. The old
   * code set the text and registered the timeline in start(), i.e. before that
   * stop(), so the sequence was:
   *
   *   start()      -> subtitle appears
   *   ...load...
   *   playNow()    -> stop() wipes the text and unregisters the timeline
   *   audio plays  -> nothing re-establishes either
   *
   * The subtitle was destroyed at the exact moment the sound began, and nothing
   * brought it back. A line with no recording returns from playNow() BEFORE that
   * stop(), which is why the three silent lines of #0 always displayed correctly
   * and everything else appeared to have no subtitles at all. Only a replayed
   * line -- already prepared, so playNow runs synchronously inside start() --
   * would show one.
   *
   * Anchoring the timeline here fixes a second thing for free: the sentence
   * clock now starts with the audio rather than with the request to load it, so
   * the lines no longer run ahead of the voice by however long the fetch took.
   */
  protected playNow(): void {
    super.playNow();
    // Runs for both paths on purpose: onNoAudio() has set up silent mode by
    // now, and updateSpeech() branches on it.
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

  /**
   * The line being spoken and, ESTIMATED, which word is being said.
   *
   * The estimate is the honest part. 1998 timed the content per SENTENCE --
   * <Sentence text time> says when a line starts and nothing about the words
   * inside it -- so a word index has to be inferred. This spreads the sentence's
   * own window across its words by length, one character being roughly one unit
   * of speaking time, which is a decent proxy in Icelandic and wrong wherever
   * the actor pauses, breathes or leans on a word.
   *
   * The window is measured from this sentence's time to the next one's, and for
   * the last sentence to the end of the recording. Both come from data we
   * actually have, so the highlight cannot drift past the end of the line.
   *
   * Real per-word timing would need forced alignment of the 668 recordings
   * against their known text. That is a pipeline job, not a rendering one, and
   * it would replace only the fraction-to-word step below.
   */
  getSubtitleState(): { text: string; word: number } | null {
    const text = this.textFace?.text?.trim();
    if (!text) return null;

    const i = this.position - 1;          // position points at the NEXT sentence
    if (i < 0 || i >= this.sentences.length) return { text, word: -1 };

    const start = this.sentences[i].time;
    const next = this.sentences[i + 1]?.time;
    const durationMs = this.getDuration() * 1000;
    const end = next
      ?? (durationMs > 0 ? durationMs : start + Math.max(1500, text.length * 60));
    const span = Math.max(1, end - start);

    const elapsed = performance.now() - this.startTime;
    const fraction = Math.max(0, Math.min(1, (elapsed - start) / span));

    const words = text.split(/\s+/);
    const weights = words.map(w => w.length + 1);
    const total = weights.reduce((a, b) => a + b, 0);
    let acc = 0;
    for (let w = 0; w < words.length; w++) {
      acc += weights[w];
      if (fraction <= acc / total) return { text, word: w };
    }
    return { text, word: words.length - 1 };
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

    // A silent line drives itself: show the sentences on schedule, then finish
    // once the last one has been up long enough to read.
    if (this.silent) {
      const elapsed = performance.now() - this.startTime;
      while (this.position < this.sentences.length &&
             elapsed >= this.sentences[this.position].time) {
        this.textFace.setText(this.sentences[this.position].text);
        if (this.textActor) {
          this.textActor.setLocation(this.textMiddle.x, this.textMiddle.y, this.textMiddle.z);
        }
        this.position++;
      }
      if (elapsed >= this.silentDuration) {
        this.silent = false;
        this.finished = true;
        this.pulser?.unregister(this);
        this.textFace.setText('');
        this.onFinished?.();
      }
      return;
    }

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
