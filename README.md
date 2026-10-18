# Homebrew Wine Tap

Homebrew tap providing pinned versions of Wine Staging for macOS (builds by
[Gcenx](https://github.com/Gcenx/macOS_Wine_builds)) plus the `gstreamer-runtime`
dependency. Based on [philberthfz/homebrew-wine](https://github.com/philberthfz/homebrew-wine).

## Casks

- `wine-staging@<version>`: Wine Staging pinned to a specific version (currently `11.7`)
- `gstreamer-runtime`: GStreamer runtime (installed automatically as a dependency)

## Requirements

- macOS
- Rosetta 2 on Apple Silicon: `softwareupdate --install-rosetta`

## Installation

```sh
brew tap lauri3k/wine
brew install --cask --no-quarantine lauri3k/wine/wine-staging@11.7
```

This installs `Wine Staging.app` into `/Applications` and links `wine`, `wineserver`,
`winecfg`, `wineboot`, `winedbg`, `regedit`, `msiexec`, etc. into Homebrew's `bin`
directory, so they are on your `PATH`.

Only one `wine-staging@*` version can be installed at a time. To switch:

```sh
brew uninstall --cask wine-staging@11.7
brew install --cask --no-quarantine lauri3k/wine/wine-staging@<version>
```

If you installed without `--no-quarantine`:

```sh
xattr -dr com.apple.quarantine "/Applications/Wine Staging.app"
```

## Adding a version

Pick a release from <https://github.com/Gcenx/macOS_Wine_builds/releases> that has a
`wine-staging-<version>-osx64.tar.xz` asset, then:

```sh
./new-version.sh 11.8
```

Commit and push the generated `Casks/wine-staging@11.8.rb`.

## Credits

- Cask definitions originally from [Homebrew](https://github.com/Homebrew/homebrew-cask) (BSD-2-Clause).
- Wine builds by [Gcenx](https://github.com/Gcenx/macOS_Wine_builds) / [WineHQ](https://wiki.winehq.org/MacOS).
- GStreamer packages by [freedesktop.org](https://gstreamer.freedesktop.org/).
