#!/usr/bin/env python3
"""Tests for calibration.py — the only writer of terrain depth numbers.

Run: python3 tools/pipeline/test_calibration.py

What these protect: the masters are ISO-8859-1 with CRLF and both are
load-bearing (deploy.sh refuses mojibake); elements are edited in place so
the one meaningful attribute change is the whole diff; and pin rounding must
match calibrate.html's Math.round, or the same pin lands on different rows
depending on which path wrote it.
"""
import tempfile
import unittest
from pathlib import Path

import calibration


ELEMENT = ('<SimplePseudo3DTerrain name="t_X" scene="s_X" polygon="p_X"\r\n'
           '\tzmin="-7" zmax="0" defaultscaling="1.0" scanline1="600"/>')
DOC = ('<?xml version="1.0" encoding="ISO-8859-1"?>\r\n'
       '<!-- sk\xfdringar \xe1 \xedslensku -->\r\n'   # Icelandic: survives latin-1 only
       + ELEMENT + '\r\n'
       '<Other name="t_X-lookalike"/>\r\n')


class PatchText(unittest.TestCase):
    def test_updates_attribute_in_place(self):
        out = calibration.patch_text(DOC, 't_X', {'scanline1': 570})
        self.assertIn('scanline1="570"', out)
        self.assertNotIn('scanline1="600"', out)
        # everything else untouched, including layout and the lookalike
        self.assertIn('zmin="-7" zmax="0"', out)
        self.assertIn('t_X-lookalike', out)

    def test_appends_missing_attributes_in_stable_order(self):
        out = calibration.patch_text(DOC, 't_X', {'scanline2': 360, 'scaling2': 0.831})
        self.assertIn('scanline2="360" scaling2="0.831"/>', out)

    def test_numerically_equal_value_leaves_authored_text_alone(self):
        # 1.0 == 1: rewriting one to the other is a diff that lies
        out = calibration.patch_text(DOC, 't_X', {'defaultscaling': 1})
        self.assertEqual(out, DOC)

    def test_missing_terrain_raises_lookup(self):
        with self.assertRaises(LookupError):
            calibration.patch_text(DOC, 't_Nope', {'scanline1': 1})

    def test_duplicate_terrain_raises_value(self):
        with self.assertRaises(ValueError):
            calibration.patch_text(DOC + ELEMENT, 't_X', {'scanline1': 1})

    def test_unknown_attribute_raises_value(self):
        with self.assertRaises(ValueError):
            calibration.patch_text(DOC, 't_X', {'zmin': -3})

    def test_scanline_must_be_integral(self):
        with self.assertRaises(ValueError):
            calibration.patch_text(DOC, 't_X', {'scanline1': 570.5})

    def test_scaling_keeps_decimal_point_when_whole(self):
        out = calibration.patch_text(DOC, 't_X', {'scaling2': 2})
        self.assertIn('scaling2="2.0"', out)


class Pins(unittest.TestCase):
    def test_rounding_matches_js_math_round(self):
        # Python's round() gives 410 for 410.5; Math.round gives 411. The
        # button and the paste must agree on the row.
        c = calibration.format_pins([(410.5, 99.5, 0.7)])
        self.assertIn('411,100,0.700', c)

    def test_pins_comment_inserted_after_element(self):
        out = calibration.patch_pins(DOC, 't_X', [(10, 20, 1.5)])
        self.assertIn(ELEMENT + '\r\n<!-- calibration pins (x,y,scale): 10,20,1.500 -->',
                      out)

    def test_existing_pins_comment_is_replaced_not_stacked(self):
        once = calibration.patch_pins(DOC, 't_X', [(1, 2, 0.5)])
        twice = calibration.patch_pins(once, 't_X', [(3, 4, 0.6)])
        self.assertEqual(twice.count('calibration pins'), 1)
        self.assertIn('3,4,0.600', twice)

    def test_empty_pins_removes_the_comment(self):
        once = calibration.patch_pins(DOC, 't_X', [(1, 2, 0.5)])
        gone = calibration.patch_pins(once, 't_X', [])
        self.assertNotIn('calibration pins', gone)


class PatchFile(unittest.TestCase):
    def _tmp(self):
        d = tempfile.mkdtemp()
        p = Path(d) / 'x.gml'
        p.write_bytes(DOC.encode('iso-8859-1'))
        return p

    def test_round_trip_preserves_latin1_and_crlf(self):
        p = self._tmp()
        before, after = calibration.patch_file(
            str(p), 't_X', {'scanline1': 570, 'scanline2': 360, 'scaling2': 0.831},
            pins=[(100, 546, 1.216)])
        self.assertIn('scanline1="600"', before)
        self.assertIn('scanline1="570"', after)
        raw = p.read_bytes()
        self.assertIn(b'sk\xfdringar \xe1 \xedslensku', raw)     # latin-1 intact
        self.assertEqual(raw.count(b'\n'), raw.count(b'\r\n'))   # CRLF intact
        self.assertIn(b'calibration pins (x,y,scale): 100,546,1.216', raw)

    def test_no_op_writes_nothing(self):
        p = self._tmp()
        stamp = p.stat().st_mtime_ns
        before, after = calibration.patch_file(str(p), 't_X',
                                               {'defaultscaling': 1.0})
        self.assertIsNone(after)
        self.assertEqual(p.stat().st_mtime_ns, stamp)


if __name__ == '__main__':
    unittest.main()
