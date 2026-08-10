#!/usr/bin/env python3
"""
Index every scene: its backdrop, its walkable polygon, and its perspective
calibration. Feeds the calibration page (webapp/calibrate.html).

WHAT THE ENGINE ACTUALLY CONSUMES, and therefore what calibrating means:

    <SimplePseudo3DTerrain ... defaultscaling="1.0"
                               scanline1="600" scanline2="400" scaling2="0.95"/>

    Terrain.setScalingParameters(scanline1, scanline2, scaling2)
      a = (defaultscaling - scaling2) / (scanline1 - scanline2)
      b = scaling2 - a * scanline2
      getScaling(p) = a * p.y + b        (or defaultscaling when a == 0)

So a terrain's entire perspective is two reference lines and the character's
size on each: he is `defaultscaling` at `scanline1` and `scaling2` at
`scanline2`, linear in between and beyond. 61 of 84 terrains never got a ramp
and scale by a constant, which is why characters do not shrink with depth.

CONVENTIONS READ OFF THE CONTENT, not assumed:
  - a scene's backdrop is the StaticActor at x=0 y=-1 z=-1; its state's face
    names the image file
  - the walkable terrain is a SimplePseudo3DTerrain with a polygon
  - GML paths are ISO 9660: backslashes, no extension, uppercased, .PNG

Output: JSON on stdout. Run from the repo root.
"""
import sys
import os
import re
import json
import xml.etree.ElementTree as ET

# Resolve from this file, not the working directory: it is run from the repo
# root by hand, from webapp/ by the npm prebuild hook, and from the checkout by
# the deploy. All three must find the same masters.
REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
GML_DIR = os.path.join(REPO, 'web_import', 'gml')


def png_size(served):
    """(w, h) of a served /GAME/... path, straight from the IHDR."""
    disk = os.path.join(REPO, 'web_import') + served
    try:
        with open(disk, 'rb') as f:
            head = f.read(24)
        if head[:8] != b'\x89PNG\r\n\x1a\n':
            return None
        return int.from_bytes(head[16:20], 'big'), int.from_bytes(head[20:24], 'big')
    except OSError:
        return None


def resolve(path):
    """GML asset path -> served path, matching AssetLoader.resolvePath."""
    p = path.replace('\\', '/')
    if p.startswith('/'):
        p = p[1:]
    p = p.upper()
    if not re.search(r'\.\w+$', p):
        p += '.PNG'
    return '/GAME/' + p


def parse(path):
    # The masters are ISO-8859-1 with CRLF and are not always well-formed XML
    # (no single root), so wrap them rather than "fixing" a master.
    raw = open(path, 'rb').read().decode('iso-8859-1')
    raw = re.sub(r'<\?xml[^>]*\?>', '', raw)
    raw = re.sub(r'<!DOCTYPE[^>]*>', '', raw)
    return ET.fromstring('<gml>' + raw + '</gml>')



def walkable_min_y_at(poly, x0, x1):
    """How far back the walkable area reaches within [x0, x1].

    Global min(y) says "the player can get behind SOMETHING back there"; it does
    not say he can get behind THIS object. A barrel against a side wall sits in
    front of unreachable floor. Restricting to the object's own x span is the
    difference between a headline figure and a true one.
    """
    ys = [p[1] for p in poly if x0 <= p[0] <= x1]
    return min(ys) if ys else None


def index_chapter(path):
    root = parse(path)
    chapter = os.path.basename(path).replace('.gml', '')

    faces = {}          # name -> served image path
    for el in root.iter():
        if el.tag in ('StaticActorFace', 'TransparentActorFace') and el.get('file'):
            faces[el.get('name')] = resolve(el.get('file'))

    walkable = set()
    for el in root.iter('MovingActor'):
        if el.get('terrain'):
            walkable.add(el.get('terrain'))

    polygons = {}
    for el in root.iter('Polygon'):
        polygons[el.get('name')] = [
            [int(p.get('x')), int(p.get('y'))] for p in el.iter('Point')
        ]

    rooms = {}          # scene -> (w, h)
    for el in root.iter('Scene'):
        rooms[el.get('name')] = (800, 600)
    for el in root.iter('ScrollingScene'):
        rooms[el.get('name')] = (int(el.get('width', 800)), int(el.get('height', 600)))

    # Backdrop: the StaticActor parked at the very back of a scene's terrain.
    # Its terrain tells us the scene; its state's face tells us the image.
    terrain_scene = {}
    terrains = []
    for el in root.iter('SimplePseudo3DTerrain'):
        terrain_scene[el.get('name')] = el.get('scene')
        terrains.append({
            'name': el.get('name'),
            'scene': el.get('scene'),
            'polygon': polygons.get(el.get('polygon'), []),
            'polygonName': el.get('polygon'),
            'zmin': int(el.get('zmin', 0)),
            'zmax': int(el.get('zmax', 1000)),
            'defaultscaling': float(el.get('defaultscaling', 1.0)),
            'scanline1': float(el.get('scanline1')) if el.get('scanline1') else None,
            'scanline2': float(el.get('scanline2')) if el.get('scanline2') else None,
            'scaling2': float(el.get('scaling2')) if el.get('scaling2') else None,
            'chapter': chapter,
        })
    for t in terrains:
        # A scene often has several terrains: a full-screen one for the backdrop
        # and HUD, and the actual floor. The floor is the one characters stand
        # on, which is exactly the one MovingActors name.
        t['walkable'] = t['name'] in walkable

    # Backdrop detection. There is no single convention -- Landnam parks its
    # backdrop at (0,-1,-1) and Kristnitaka at (0,0,0) -- so this goes by the
    # one thing that holds across chapters: the backdrop is the actor named
    # after its scene, and failing that the one furthest back on the scene's
    # terrain. Both are checked against the content rather than assumed.
    actors = []         # (name, scene, z, image)
    actor_y = {}
    actor_x = {}
    actor_terrain = {}
    for el in root.iter('StaticActor'):
        scene = terrain_scene.get(el.get('terrain'))
        if not scene:
            continue
        image = None
        for st in el.iter('State'):
            image = faces.get(st.get('face'))
            if image:
                break
        if image:
            actors.append((el.get('name'), scene, int(el.get('z', 0)), image))
            actor_y[el.get('name')] = int(el.get('y', 0))
            actor_x[el.get('name')] = int(el.get('x', 0))
            actor_terrain[el.get('name')] = el.get('terrain')

    # The owner's four conceptual layers, decided from data rather than by eye:
    #
    #   a) background        the backdrop plate
    #   b) scene objects the character can NEVER get behind
    #   c) scene objects the character CAN walk behind
    #   d) characters
    #
    # (c) is the only class that needs real depth: the engine z-orders by
    # Actor.getZOrder() == location.y, so an object draws in front of the player
    # exactly when its y is greater. The player can therefore get behind an
    # object only if the walkable polygon reaches further back than the object
    # sits -- min(polygon y) < object y. Everything in (b) can be baked into the
    # plate, because nothing ever passes behind it.
    for t in terrains:
        back = min((pt[1] for pt in t['polygon']), default=None)
        t['walkableMinY'] = back
    scene_polys = {}
    for t in terrains:
        if t['polygon'] and t['scene']:
            scene_polys.setdefault(t['scene'], []).extend(t['polygon'])


    backdrops = {}
    for scene in {a[1] for a in actors}:
        here = [a for a in actors if a[1] == scene]
        want = 'a_' + scene[2:] if scene.startswith('s_') else None
        named = [a for a in here if a[0] == want]
        if named:
            backdrops[scene] = named[0][3]
        else:
            backdrops[scene] = min(here, key=lambda a: a[2])[3]

    # The player, for sizing against. SetPlayer names the actor; its 'stop'
    # state names the face; the face names the file. Chapters differ (Vifill in
    # Landnam), so this is resolved per chapter rather than hard-coded.
    player_img = None
    player_names = {el.get('player') for el in root.iter('SetPlayer') if el.get('player')}
    for el in root.iter('MovingActor'):
        if el.get('name') not in player_names:
            continue
        for st in el.iter('State'):
            if st.get('name') == 'stop':
                player_img = faces.get(st.get('face'))
                break
        if player_img:
            break

    scenes = {}
    for t in terrains:
        s = t['scene']
        if not s:
            continue
        entry = scenes.setdefault(s, {
            'name': s, 'chapter': chapter,
            'background': backdrops.get(s),
            'player': player_img,
            'width': rooms.get(s, (800, 600))[0],
            'height': rooms.get(s, (800, 600))[1],
            'terrains': [],
        })
        entry['terrains'].append(t)

    # Classify every scene object once the backdrop is known.
    for name, scene, z, image in actors:
        entry = scenes.get(scene)
        if not entry or image == entry['background']:
            continue          # the plate itself is layer (a)
        y = actor_y.get(name, 0)
        x = actor_x.get(name, 0)
        size = png_size(image)
        w = size[0] if size else 0
        back = walkable_min_y_at(scene_polys.get(scene, []), x, x + w)
        walkBehind = back is not None and back < y
        entry.setdefault('objects', []).append({
            'name': name, 'x': x, 'y': y, 'z': z, 'image': image,
            'terrain': actor_terrain.get(name),
            'w': (size[0] if size else None), 'h': (size[1] if size else None),
            'layer': 'c' if walkBehind else 'b',
        })
    return scenes


def main():
    out = {}
    for f in sorted(os.listdir(GML_DIR)):
        if not f.endswith('.gml'):
            continue
        try:
            out.update(index_chapter(os.path.join(GML_DIR, f)))
        except Exception as e:
            print(f'  !! {f}: {e}', file=sys.stderr)

    # Only scenes we can actually show are useful to a calibration page.
    usable = {k: v for k, v in out.items() if v['background']}
    if '--summary' in sys.argv:
        cal = sum(1 for s in usable.values() for t in s['terrains'] if t['scanline1'])
        tot = sum(len(s['terrains']) for s in usable.values())
        print(f'scenes with a backdrop: {len(usable)} of {len(out)}')
        print(f'terrains on them: {tot}, calibrated: {cal}, uncalibrated: {tot - cal}')
        b = sum(1 for s in usable.values() for o in s.get('objects', []) if o['layer'] == 'b')
        c = sum(1 for s in usable.values() for o in s.get('objects', []) if o['layer'] == 'c')
        print(f'scene objects: {b + c}  ->  (b) never walked behind: {b}   (c) walk-behind: {c}')
        for s in sorted(usable.values(), key=lambda s: (s['chapter'], s['name']))[:8]:
            t = s['terrains'][0]
            print(f"  {s['name']:<22} {s['width']}x{s['height']}  {s['background']}")
        return 0
    json.dump(usable, sys.stdout, ensure_ascii=False, indent=1)
    return 0


if __name__ == '__main__':
    sys.exit(main())
