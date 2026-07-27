# Provenance — web mirror capture

## Status — canonical repository, derivative files

**This repository is the canonical home of the project.** That is a statement about
where the work lives and continues, and it is not in question.

The files *in this directory* are a different matter: they are a **derivative capture
of a deployed website**, produced by downloading the public Cloudflare Pages deployment
of the prototype over HTTP. They are not original masters. Everything here has been
through a build and deployment pipeline and may have been re-encoded, renamed or
path-normalised along the way, and the capture is known to be incomplete — see
*Known gaps* below.

Two primary sources sit upstream of this capture and take precedence where they
disagree with it:

1. the original CD-ROM ISO of the game, and
2. material still outstanding from Halldór — above all the engine source, which this
   repository currently holds only as a minified build artifact.

Neither of those displaces this repository. They are inputs to it: as they arrive, they
should be committed here and this file updated.

## Capture parameters

| Field | Value |
|---|---|
| Source URL | `https://835c0363.timaflakkarinn.pages.dev` |
| Deployment hostname | `835c0363.timaflakkarinn.pages.dev` (Cloudflare Pages) |
| Capture start (UTC) | `2026-07-25T07:41:06Z` |
| Capture end (UTC) | `2026-07-25T07:52:56Z` |
| Captured by | homeserver (`git.spliffdonk.com`), sequential requests, 0.3 s delay between each |
| Application shell | `index.html` — sha256 `d7e54ff6722123bc6290b4f417f65cda16c3711f52de3fe9d9eb7ec81d9b3171` |
| Bundle filename | `assets/index-CXa83YST.js` |
| Bundle sha256 | `ea6f65dd3d80bfb55547570d4090830bc646ab1c9fe4a3bf7e01f24689a79746` |

The bundle filename is content-hashed by the build and **changes on every redeploy**. It was
read from the live `index.html` at capture time rather than assumed, so it pins the exact
deployment this snapshot came from.

## Contents

| Group | Files | Notes |
|---|---:|---|
| Game assets under `GAME/` | 1211 | 543 PNG, 668 WAV |
| Game logic (`gml/`) | 7 | 6 chapter `.gml` files + `scene.dtd` |
| Shell + bundle | 2 | `index.html`, `assets/index-CXa83YST.js` |
| **Total** | **1220** | **198,773,254 bytes (189.6 MiB)** |

## Asset path derivation

Asset paths were not guessed. They were derived from the `file="..."` attributes in the six
`.gml` files and passed through the engine's own resolver, read out of the deployed bundle:

```js
resolvePath(t){ let e=t.replace(/\\/g,"/"); e.startsWith("/")&&(e=e.substring(1));
                 e=e.toUpperCase(); e.match(/\.\w+$/)||(e+=".PNG");
                 return `${this.basePath}/${e}` }   // basePath = "/GAME"
```

1,333 raw `file=` attributes resolved to **1,215 unique asset paths** (544 images, 671 WAV).

## Validation method

Cloudflare Pages SPA-routes every unknown path to an **HTTP 200 carrying `index.html`**, so a
200 response does not mean a file exists. Every downloaded file was therefore checked against:

- byte-identity with `index.html` (the SPA fallback), and
- magic bytes — PNG `\x89PNG\r\n\x1a\n`, WAV `RIFF....WAVE`, JPEG `\xff\xd8\xff`.

Failures were retried once. Files that failed validation were **not** written to disk, so no
HTML masquerading as a `.PNG`/`.WAV` is present in this mirror.

## Known gaps — 4 assets referenced by the game but absent from the deployment

| Asset | Response | Diagnosis |
|---|---|---|
| `/GAME/LANDNAM/ANIMATIA/INGOLFUR/STOP2RIA.PNG` | HTTP 200 | SPA fallback (1675 B, byte-identical to index.html) |
| `/GAME/LANDNAM/MEDIA/VIFILL/AFSAKDUA.WAV` | HTTP 200 | SPA fallback (1675 B, byte-identical to index.html) |
| `/GAME/LANDNAM/MEDIA/VIFILL/GODRADDA.WAV` | HTTP 200 | SPA fallback (1675 B, byte-identical to index.html) |
| `/GAME/TYRKJARA/MEDIA/HALLDORA/DETTUREA.WAV` | HTTP 200 | SPA fallback (1675 B, byte-identical to index.html) |

These are missing **upstream**, not failures of this capture: they returned the SPA fallback on
both the initial request and the retry, every case and extension variant was probed and also
returned the fallback, and sibling files in the same directories downloaded normally. They must
be recovered from the CD ISO or from Halldór.

## Reproducing / verifying

`SHA256SUMS` in this directory covers every mirrored file. Verify with:

```bash
cd web_import && sha256sum -c SHA256SUMS
```

## Addendum — 2026-07-26: two files added after the original capture

The capture above derived its file list solely from `file="..."` attributes in the
`.gml` files. That method cannot see paths the **engine itself** hardcodes, and the
engine hardcodes two: the mouse cursors, in its constructor —

```js
this.normalCursor = new Q("bendill_normal", "\\common\\bendill1");
this.hiliteCursor = new Q("bendill_hilite", "\\common\\bendill2");
```

Both were therefore absent from the original mirror. The omission was found by
running the game locally and observing 404s for `GAME/COMMON/BENDILL1.PNG` and
`BENDILL2.PNG`; because `index.html` sets `cursor: none`, the game had no visible
pointer at all.

The two files were **still present on the same Cloudflare deployment** and were
fetched from it on 2026-07-26, validated by magic bytes (both 30×30 PNG), and
appended to `SHA256SUMS`:

| Asset | Bytes | sha256 |
|---|---:|---|
| `GAME/COMMON/BENDILL1.PNG` | 3 084 | `db201eb95aad2c2eb81f57936b18c428b00a9e73dacb697e4d1a03c8580969be` |
| `GAME/COMMON/BENDILL2.PNG` | 3 062 | `2fca5d4b65f601d24edcabf79469ced10f5ed439a3686776c5580b59a7f7a0f3` |

Contents total **1 222** files. The four *Known gaps* above are unaffected — they
remain missing upstream.
