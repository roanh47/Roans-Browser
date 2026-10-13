# Roan's Browser

My own Chromium build. Fork of [Thorium](https://github.com/Alex313031/thorium) by
Alex313031, which is a patched Chromium. Same patches and build scripts, my branding.

## What is in it

- uBlock Origin preinstalled for every new profile, via `infra/default_apps/external_extensions.json`.
- Manifest V2 kept alive so the full uBlock Origin keeps working:
  `kManifestV2Availability = 2` in `src/extensions/browser/extension_prefs.cc`, plus the
  `allow-legacy-mv2-extensions` flag.
- All of Thorium's patches and GN args are still there: `docs/PATCHES.md`, `infra/args.list`.
- Windows, Linux, macOS and Android build scripts: `docs/BUILDING.md`, `build_android.sh`,
  `arm/setup_arm.sh`, `win_scripts/`.

## Branding

- Display name `Roan's Browser`, single word `RoansBrowser`, lowercase `roansbrowser`,
  app id `nl.roanheemstra.RoansBrowser`.
- Upstream attribution is untouched: `LICENSE.md` (BSD-3-Clause, Alexander Frick),
  the submodule URLs (`libjxl`, `infra/upgrader`), Widevine and Flatpak refs.
- Tag `pre-rebrand` is the last state before the rename, so the diff is one command away.

## Status

- Rebrand: done (names, icons, product strings, app id).
- No compiled build yet. A cold Chromium build does not fit a GitHub-hosted runner: the job cap is
  6 hours and this build needs 10-20 hours and ~75 GB, on a runner with 4 vCPU and 15 GB RAM.
  A real APK needs a self-hosted builder (about 16 cores, 64 GB RAM, 300 GB disk) attached to this
  repo. App-layer builds can run in GitHub Actions without that.
- Android extensions: upstream Chromium sets `enable_extensions = !is_android`, so they are off on
  Android. Kiwi Browser turns them on with `enable_extensions = true` in its Android args, and
  upstream is porting that as `enable_extensions_core` / `enable_desktop_android_extensions`.
  Porting it to this tree is still open.

## Building

Use the upstream instructions in `docs/BUILDING.md` (Windows, Linux, macOS) and
`build_android.sh` / `arm/setup_arm.sh` for Android and ARM. `AGENTS.md` has the fork rules, the
brand naming, the uBlock/MV2 details and the measured CI numbers.

## License

BSD-3-Clause, see `LICENSE.md`. Copyright of the upstream work belongs to Alexander Frick
(Thorium) and the Chromium project.
