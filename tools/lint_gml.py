#!/usr/bin/env python3
"""Validate Tímaflakkarinn .gml chapter files.

Checks that every cross-reference resolves to a defined object, and that every
asset path referenced actually exists on disk. Mirrors the engine's own name
lookup (a flat per-chapter container keyed by `name`) and its resolvePath().
"""
import re, sys, os, glob
from collections import defaultdict

CHAPTERS = ['intro', 'landnam', 'kristnit', 'sidaskip', 'tyrkran', 'extro']

# attribute -> what kind of thing it must point at (informational only; the
# engine keeps one flat namespace per chapter, so we resolve against that)
REF_ATTRS = [
    'actor', 'actor2', 'reactor', 'listener', 'face', 'mouth', 'terrain',
    'scene', 'polygon', 'collision', 'collisionbox', 'flag', 'object',
    'controller', 'stateactor', 'inventoryactor', 'inventory', 'textactor',
    'seq', 'player',
]
# Reactor constants understood natively by the engine's <Reaction> parser --
# they are never declared in GML.
ENGINE_BUILTINS = {'action_look', 'action_take', 'action_talk', 'action_use'}

# `collision="foo"` DEFINES a collision-listener map rather than referencing one.
DEFINING_ATTRS = {'collision'}

# attributes that are free text / numbers, never references
SKIP_ATTRS = {'name', 'text', 'file', 'x', 'y', 'z', 'width', 'height', 'time',
              'value', 'count', 'repeat', 'speed', 'zmin', 'zmax', 'low', 'high',
              'xoffset', 'yoffset', 'acc', 'color', 'r', 'g', 'b', 'save',
              'hilite', 'random', 'prepare', 'transparent', 'scaling', 'wait',
              'show', 'goal', 'base', 'image', 'pre', 'post', 'scrolling',
              'defaultscaling', 'scanline1', 'scanline2', 'scaling2', 'thf',
              'moving', 'looking', 'taking', 'talking', 'state'}

def strip_comments(src):
    """Blank out <!-- ... --> bodies, keeping newlines so line numbers survive."""
    return re.sub(r'<!--.*?-->',
                  lambda m: re.sub(r'[^\n]', ' ', m.group(0)),
                  src, flags=re.S)

def parse(path):
    src = strip_comments(open(path, encoding='iso-8859-1').read())
    elems = []
    for m in re.finditer(r'<([A-Za-z0-9_]+)((?:\s+[A-Za-z0-9_]+="[^"]*")*)\s*/?>', src):
        attrs = dict(re.findall(r'([A-Za-z0-9_]+)="([^"]*)"', m.group(2)))
        line = src.count('\n', 0, m.start()) + 1
        elems.append((m.group(1), attrs, line))
    return src, elems

def lint(root):
    total = 0
    for ch in CHAPTERS:
        path = os.path.join(root, 'gml', f'{ch}.gml')
        src, elems = parse(path)
        defined = set()
        states = defaultdict(set)          # actor name -> its <State> names
        cur_actor = None
        for el, a, _ in elems:
            if el == 'State' and cur_actor:
                states[cur_actor].add(a.get('name', ''))
            if 'name' in a and el not in ('Quantum', 'State', 'Frame'):
                defined.add(a['name'])
            for da in DEFINING_ATTRS:
                if a.get(da):
                    defined.add(a[da])
            if el in ('StaticActor', 'MovingActor'):
                cur_actor = a.get('name')
        issues, notes = [], []

        # 1. <Quantum name=".."/> inside a Sequence must name a defined quantum
        for m in re.finditer(r'<Sequence name="([^"]+)"(.*?)</Sequence>', src, re.S):
            seq, body = m.group(1), m.group(2)
            for q in re.finditer(r'<Quantum name="([^"]+)"', body):
                if q.group(1) not in defined:
                    line = src.count('\n', 0, m.start(2) + q.start()) + 1
                    issues.append((line, 'dangling-quantum',
                                   f'sequence "{seq}" -> undefined quantum "{q.group(1)}"'))

        # 2. reference-bearing attributes must resolve
        for el, a, line in elems:
            for k, v in a.items():
                if k in SKIP_ATTRS or k not in REF_ATTRS or not v:
                    continue
                if v in ENGINE_BUILTINS or k in DEFINING_ATTRS:
                    continue
                if v not in defined:
                    issues.append((line, 'dangling-ref',
                                   f'<{el} {"name="+chr(34)+a.get("name","?")+chr(34)+" " if "name" in a else ""}{k}="{v}"> -> undefined'))

        # 3. state= on an actor must be one of its own <State> names
        for el, a, line in elems:
            if el in ('StaticActor', 'MovingActor') and 'state' in a:
                nm = a.get('name')
                if a['state'] not in states.get(nm, set()):
                    # The engine auto-creates an empty state here; this is the
                    # established idiom for "starts invisible/silent", so it is
                    # informational rather than an error.
                    notes.append((line, 'auto-created-state',
                                  f'actor "{nm}" starts in undeclared state "{a["state"]}" '
                                  f'(engine creates an empty one; has: {sorted(states.get(nm,[])) or "none"})'))

        # 4. asset files must exist
        for el, a, line in elems:
            if 'file' not in a:
                continue
            p = a['file'].replace('\\', '/').lstrip('/').upper()
            if not re.search(r'\.\w+$', p):
                p += '.PNG'
            if not os.path.exists(os.path.join(root, 'GAME', p)):
                issues.append((line, 'missing-asset', f'<{el} name="{a.get("name","?")}"> -> GAME/{p}'))

        issues.sort(); notes.sort()
        total += len(issues)
        print(f'\n=== {ch}.gml — {len(issues)} issue(s), {len(notes)} note(s), '
              f'{len(defined)} named objects ===')
        for line, kind, msg in issues:
            print(f'  {ch}.gml:{line}  [{kind}] {msg}')
        if notes:
            print(f'  ({len(notes)} auto-created-state note(s) suppressed'
                  f' — engine idiom, not errors)')
    print(f'\n==== TOTAL: {total} issue(s) ====')
    return total

if __name__ == '__main__':
    sys.exit(1 if lint(sys.argv[1] if len(sys.argv) > 1 else '.') else 0)
