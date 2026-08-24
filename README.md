# homebrew-tap

Personal Homebrew tap. Currently one cask: [FeatherDB](https://featherdb.dev/)
— a native macOS Postgres client with an MCP gateway for AI coding tools.

## Install

```bash
brew tap nguyenhuuphuc/tap
brew install --cask featherdb
```

## Status

The `featherdb` cask is linted clean (`brew style` / `brew audit --strict`,
both 0 offenses) but **not yet installable**: `sha256` is a placeholder and
no release exists yet at the GitHub Releases URL it points to. Both get
filled in together, from a real `DIRECT_DISTRIBUTION=1` build — see
`frontend/scripts/ship.sh` and `docs/RELEASING.md` in the
[featherdb](https://github.com/NguyenHuuPhuc/featherdb) repo.

Updating the cask for a new release is two edits: `version` in
`Casks/featherdb.rb`, and `sha256` from `shasum -a 256` on the built DMG.
`livecheck` reads the same Sparkle appcast the app itself checks, so
`brew livecheck --cask featherdb` should always report the version Sparkle
is already offering — no separate source of truth to drift out of sync.
