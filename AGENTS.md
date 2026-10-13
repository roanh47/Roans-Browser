# AGENTS.md — Roan's Browser

Fork of Thorium (Alex313031/thorium), rebranded to **Roan's Browser**.
This repo is the Thorium *overlay* (logos, infra scripts, docs, patched files). The Chromium/Thorium
source tree itself is fetched by the upstream build scripts and is not committed here.

## Hard rules
- Never rename or rewrite: `LICENSE.md`, `infra/CHROMIUM_LICENSE`, `pak_src/LICENSE*`, `.gitmodules`,
  `src/third_party/**/LICENSE`. Upstream attribution, submodule URLs and the Widevine/Flatpak refs stay as-is.
- Naming: display `Roan's Browser`, single word `RoansBrowser`, lowercase `roansbrowser`,
  app id `nl.roanheemstra.RoansBrowser`.
- No private data in this repo, it is public.
- `infra/hangout_services/manifest.json` is JSONC (it has `//` comments and is invalid JSON by design).
  Do not "fix" it with a JSON parser.

## Ad blocking
- uBlock Origin is preinstalled for every new profile via `infra/default_apps/external_extensions.json`
  (id `cjpalhdlnbpafiamejdnhcphjbkeiagm`, MV2). The update URL points at the Chrome Web Store, so bundle
  a local `.crx` if that listing ever disappears.
- MV2 stays alive in this tree: `kManifestV2Availability = 2` in
  `src/extensions/browser/extension_prefs.cc` plus the `allow-legacy-mv2-extensions` flag.
- Android: upstream sets `enable_extensions = !is_android`, but that is a build flag, not a limit of the
  platform. A fork turns it on explicitly (Kiwi Browser ships `enable_extensions = true` in its
  `.build/android_arm/args.gn`) and carries the Android extension UI code. Upstream Chromium is porting
  this as `enable_extensions_core` / `enable_desktop_android_extensions`, so the code is moving upstream.
- Brave Shields is a different thing: an in-browser engine (brave-core + adblock-rust), not an extension.
  It cannot be dropped onto a Thorium tree; it would mean rebasing on brave-core.

## Build / CI reality (measured on a GitHub-hosted runner, 2026-10-13)
- `ubuntu-latest`: 4 vCPU (EPYC 7763), 15 GB RAM, 152 GB disk with 86 GB free, 106 GB free after removing
  the preinstalled toolchains (dotnet, ghc, CodeQL, 12 GB Android SDK), Java 17.
- GitHub-hosted jobs stop hard at 6 h. A cold Chromium Android build needs roughly 10-20 h and ~75 GB.
  Cromite, which does ship real APKs, builds with `timeout-minutes: 1440` on its own builder
  (`runs-on` = workflow input), not on hosted runners.
- Larger runners are not available on this account: a 16-core job stayed queued until cancelled.
- Disk is the first wall, not just time: a full-history `fetch --nohooks chromium` + `gclient sync`
  filled the 113 GB free on the runner in 95 min and died with `no space left on device` (run
  38388352300). Use `fetch --no-history`, prune `~/.cipd/pkgs` after the sync, and keep ~60 GB free
  for `out/`.
- Consequence: app-layer APK builds (Gradle/WebView) belong in GitHub Actions. A compiled Chromium APK
  needs a self-hosted builder with ~16 cores, 64 GB RAM and 300 GB disk attached to this repo. Never
  promise an APK out of a hosted runner.
