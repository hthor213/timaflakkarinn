# Provenance — web mirror capture

## THIS IS NOT THE CANONICAL SOURCE

This directory is a **derivative capture of a deployed website**. It was produced by
downloading the public Cloudflare Pages deployment of the collaborator's prototype over
HTTP. It is an archival snapshot for reference and continuity only.

**The canonical sources are, and remain:**

1. the original CD-ROM ISO image of the game, and
2. the developer's own source repository.

Nothing in this directory should be treated as authoritative. Where this capture and a
canonical source disagree, the canonical source wins. Assets here have been through a
deployment pipeline (possibly re-encoded, renamed, or path-normalised) and the capture is
known to be incomplete — see *Known gaps* below.

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
be recovered from the CD ISO or the developer's repository.

## Reproducing / verifying

`SHA256SUMS` in this directory covers every mirrored file. Verify with:

```bash
cd web_import && sha256sum -c SHA256SUMS
```
