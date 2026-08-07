import { ConditionFlag } from '../engine/Sequence';
import { Actor } from '../engine/Actor';
import type { Terrain } from '../engine/Terrain';
import type { SaveData } from './SaveStore';
import type { Timaflakkarinn } from './Timaflakkarinn';

const CHAPTER_NAMES = ['intro', 'mainmenu', 'landnam', 'kristnit', 'sidaskip', 'tyrkran', 'extro'];

/** Tekur snapshot af öllu vistanlegu state — flögum, actor-stöðum, núverandi sviði. */
export function serialize(t: Timaflakkarinn, name: string): SaveData {
  const flags: Record<string, number> = {};
  const actors: SaveData['actors'] = [];

  // The chapter's own objects, not every chapter ever parsed. A global walk
  // saved another chapter's a_Player position under the same name, and saved
  // flags belonging to chapters this save has nothing to do with.
  for (const obj of t.scopes.values()) {
    if (obj instanceof ConditionFlag && obj.saveable) {
      flags[obj.name] = obj.value;
    } else if (obj instanceof Actor && obj.saveable) {
      actors.push({
        name: obj.name,
        x: obj.location.x,
        y: obj.location.y,
        z: obj.location.z,
        state: obj.currentStateName,
        terrain: obj.currentTerrain?.name ?? null,
      });
    }
  }

  return {
    version: 1,
    name,
    chapter: t.currentScreen,
    chapterName: CHAPTER_NAMES[t.currentScreen] ?? `chapter${t.currentScreen}`,
    currentScene: t.world.currentScene?.name ?? '',
    flags,
    actors,
    timestamp: Date.now(),
  };
}

/** Endurheimtir leik af `data`. Forsenda: engin virk sekvens. */
export async function restore(t: Timaflakkarinn, data: SaveData): Promise<void> {
  // 1) Tryggja að réttur kafli sé hlaðinn (parsar GML ef ekki nú þegar).
  //    setCurrentChapter, ekki bein úthlutun: hún færir líka nafnaupplausnina
  //    og StateController kaflans — annars var leikurinn endurheimtur með
  //    stýringu síðasta kafla sem var þáttaður.
  if (t.currentScreen !== data.chapter) {
    await t.parseStoryPage(data.chapter);
    t.setCurrentChapter(data.chapter);
  }

  // 2) Beita save: flög og actorar fyrst, svo s_always og s_prepare keyra á réttu state
  for (const [name, value] of Object.entries(data.flags)) {
    const flag = t.scopes.lookup(name);
    if (flag instanceof ConditionFlag) {
      flag.value = value;
    }
  }

  for (const a of data.actors) {
    const actor = t.scopes.lookup(a.name);
    if (!(actor instanceof Actor)) continue;
    if (a.terrain) {
      const terrain = t.scopes.lookup<Terrain>(a.terrain);
      if (terrain) actor.setTerrain(terrain);
    } else {
      actor.setTerrain(null);
    }
    actor.setLocation(a.x, a.y, a.z);
    if (a.state && actor.states.has(a.state)) {
      actor.setState(a.state);
    }
  }

  // 3) Hoppa á rétt svið — sér um stopAll, s_always, s_prepare, MOVING
  await t.jumpToScene(data.currentScene);
}
