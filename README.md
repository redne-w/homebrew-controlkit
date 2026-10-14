# homebrew-controlkit

Homebrew tap for [ControlKit](https://github.com/redne-w/ControlKit), command-line automation for
iOS simulator apps.

## Install

```sh
brew install redne-w/controlkit/controlkit
```

ControlKit requires macOS 15 or later on Apple silicon and Xcode 26 or later.

## Update

```sh
brew upgrade controlkit
```

## Releasing a new version

After a ControlKit release finishes, update `url` and `sha256` in `Formula/controlkit.rb`. The
release includes a `.sha256` file next to the archive.
