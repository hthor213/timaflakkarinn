/** Centralized game log — captures events for the debug log panel. */

export interface LogEntry {
  time: number;   // pulser elapsed ms
  tag: string;    // e.g. 'SEQ', 'AUDIO', 'PULSE'
  msg: string;
}

const MAX_ENTRIES = 200;
const entries: LogEntry[] = [];
let listeners: (() => void)[] = [];

export function gameLog(tag: string, msg: string, time = 0): void {
  entries.push({ time, tag, msg });
  if (entries.length > MAX_ENTRIES) entries.shift();
  for (const fn of listeners) fn();
}

export function getLogEntries(): readonly LogEntry[] {
  return entries;
}

export function onLogUpdate(fn: () => void): void {
  listeners.push(fn);
}

export function removeLogListener(fn: () => void): void {
  listeners = listeners.filter(l => l !== fn);
}

export function formatTime(ms: number): string {
  const s = Math.floor(ms / 1000);
  const m = Math.floor(s / 60);
  const ss = s % 60;
  const mmm = Math.floor(ms % 1000);
  return `${m}:${String(ss).padStart(2, '0')}.${String(mmm).padStart(3, '0')}`;
}
