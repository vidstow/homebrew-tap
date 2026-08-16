# VidStow Homebrew Tap

Homebrew distribution for [VidStow](https://github.com/vidstow/vidstow).

## Install

VidStow currently supports Apple Silicon Macs only.

```sh
brew tap vidstow/tap
brew install --cask vidstow
```

The cask also installs FFmpeg, which VidStow requires for media merging and
conversion.

## Important macOS security notice

The current VidStow public beta is **ad-hoc signed and not notarized by Apple**.
After Homebrew verifies the release archive against the SHA-256 checksum pinned
in [`Casks/vidstow.rb`](Casks/vidstow.rb), the cask explicitly removes macOS's
quarantine attribute from the installed app so it can launch.

Installing this cask therefore bypasses the normal Gatekeeper quarantine check
for VidStow. Review the [source](https://github.com/vidstow/vidstow) and the
[published release metadata](https://github.com/vidstow/vidstow/releases) before
installing. This workaround can be removed once releases are Developer ID signed
and Apple-notarized.

## Upgrade

```sh
brew update
brew upgrade --cask vidstow
```

## Uninstall

```sh
brew uninstall --cask vidstow
```

To also remove VidStow's saved queue and settings:

```sh
brew uninstall --cask --zap vidstow
```
