#!/usr/bin/env python3
"""Write terrain calibration into a .gml master, in place.

The four numbers a terrain's depth consists of are defaultscaling,
scanline1, scanline2 and scaling2; getScaling is linear in y between
them. This module is the only thing that writes them, so the encoding
rule lives in exactly one place.

THE MASTERS ARE ISO-8859-1 WITH CRLF AND BOTH ARE LOAD-BEARING. Caddy
serves /gml/* as ISO-8859-1, so a file round-tripped through UTF-8
renders as mojibake in the game, and deploy.sh refuses to publish it
(see its .gml master integrity check). Everything here reads and writes
bytes with an explicit codec and asserts the line endings survived.

Elements are edited in place rather than re-emitted: they span lines,
and attribute order differs between chapters -- landnam writes
scanline1 before scaling2, tyrkran the other way round. Rewriting them
to a canonical form would produce a diff of hundreds of lines that
changes nothing, and would bury the one edit that matters.
"""

import math
import re
import sys

ATTRS = ('defaultscaling', 'scanline1', 'scanline2', 'scaling2')


def _element_re(terrain):
    return re.compile(
        r'<SimplePseudo3DTerrain\b[^>]*\bname="' + re.escape(terrain) + r'"[^>]*/>')


def patch_text(text, terrain, values):
    """Return text with `terrain`'s calibration set to `values`.

    `values` maps any of ATTRS to a number. Attributes already present
    are updated where they stand; missing ones are appended just before
    the closing `/>`. Raises LookupError if the terrain is not there and
    ValueError if it is declared more than once.
    """
    unknown = set(values) - set(ATTRS)
    if unknown:
        raise ValueError(f'not calibration attributes: {sorted(unknown)}')

    matches = _element_re(terrain).findall(text)
    if not matches:
        raise LookupError(f'no SimplePseudo3DTerrain named {terrain!r}')
    if len(matches) > 1:
        raise ValueError(f'{terrain!r} is declared {len(matches)} times')

    element = matches[0]
    patched = element
    for attr in ATTRS:                      # ATTRS order, so appends are stable
        if attr not in values:
            continue
        literal = _format(attr, values[attr])
        existing = re.compile(r'(\b' + attr + r'=")([^"]*)(")')
        found = existing.search(patched)
        if found:
            # Leave a numerically unchanged attribute exactly as authored.
            # 1.0 and 1 are the same number; rewriting one to the other is a
            # diff that says a value changed when none did.
            if _same(found.group(2), literal):
                continue
            patched = existing.sub(lambda m: m.group(1) + literal + m.group(3),
                                   patched, count=1)
        else:
            patched = patched[:-2].rstrip() + f' {attr}="{literal}"/>'

    return text.replace(element, patched, 1)


def _format(attr, v):
    """Numbers the way the 1998 content writes them.

    Scanlines are pixel rows and are written as integers (`scanline1="600"`);
    scalings are ratios and keep a decimal point even when whole
    (`defaultscaling="1.0"`), which is what every authored terrain does.
    """
    f = float(v)
    if attr.startswith('scanline'):
        if f != int(f):
            raise ValueError(f'{attr} is a pixel row, got {v!r}')
        return str(int(f))
    return f'{f:.1f}' if f == int(f) else str(round(f, 4))


def _same(a, b):
    try:
        return float(a) == float(b)
    except ValueError:
        return False


PIN_COMMENT = '<!-- calibration pins (x,y,scale): {} -->'
_PIN_RE = re.compile(r'[ \t]*<!-- calibration pins \(x,y,scale\):[^>]*-->')


def format_pins(pins):
    """Render pins the way calibrate.html's Copy GML does.

    Pins are the primary artifact — the four numbers are only the linear
    fit through them — so they ride into the master beside the element.
    """
    # math.floor(v + 0.5), not round(): Python rounds halves to even, JS
    # Math.round rounds them up, and calibrate.html emits with Math.round.
    # A pin at y=410.5 would otherwise land on a different row depending on
    # whether the button or the paste wrote it.
    r = lambda v: math.floor(float(v) + 0.5)
    body = ' '.join(f'{r(x)},{r(y)},{float(k):.3f}' for x, y, k in pins)
    if '--' in body:                        # would close the comment early
        raise ValueError(f'pin text is not comment-safe: {body!r}')
    return PIN_COMMENT.format(body)


def patch_pins(text, terrain, pins):
    """Put (or replace) the pins comment on the line after `terrain`."""
    element = _element_re(terrain).search(text)
    if not element:
        raise LookupError(f'no SimplePseudo3DTerrain named {terrain!r}')

    end = element.end()
    trailing = _PIN_RE.match(text, end + 2 if text[end:end + 2] == '\r\n' else end)
    comment = format_pins(pins) if pins else ''

    if trailing:                            # replace the existing one
        head = text[:end] + ('\r\n' if comment else '')
        return head + comment + text[trailing.end():]
    if not comment:
        return text
    return text[:end] + '\r\n' + comment + text[end:]


def patch_file(path, terrain, values, pins=None):
    """Patch one terrain in `path`. Returns (before, after) element text.

    `pins=None` leaves any existing pins comment alone; a list replaces it,
    and an empty list removes it.
    """
    raw = open(path, 'rb').read()
    text = raw.decode('iso-8859-1')

    before = _element_re(terrain).search(text)
    out = patch_text(text, terrain, values)
    if pins is not None:
        out = patch_pins(out, terrain, pins)
    after = _element_re(terrain).search(out)

    if out == text:
        return (before.group(0) if before else None), None

    encoded = out.encode('iso-8859-1')       # raises if a non-Latin-1 char crept in
    if encoded.count(b'\n') != encoded.count(b'\r\n'):
        raise AssertionError('patch introduced a bare LF; masters are CRLF')

    open(path, 'wb').write(encoded)
    return before.group(0), after.group(0)


def main(argv):
    if len(argv) != 7:
        print('usage: calibration.py <file.gml> <terrain> '
              '<defaultscaling> <scanline1> <scanline2> <scaling2>',
              file=sys.stderr)
        return 2
    path, terrain = argv[1], argv[2]
    values = dict(zip(ATTRS, argv[3:7]))
    before, after = patch_file(path, terrain, values)
    if after is None:
        print(f'unchanged: {before}')
        return 0
    print(f'was: {before}\nnow: {after}')
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
