# homebrew-tap

Homebrew tap for [FeatherDB](https://featherdb.dev/) — a native macOS Postgres
client with an MCP gateway for AI coding tools.

## Install

```bash
brew tap featherdb-app/tap
brew install --cask featherdb
```

## Status

Live since 1.0.0 (2026-08-24) — installed and verified with a real
`brew install --cask featherdb` from a cold tap, not just linted. Assets
come from [featherdb-releases](https://github.com/featherdb-app/featherdb-releases),
a public repo holding only downloadable files; the app's source stays in the
private [featherdb](https://github.com/featherdb-app/featherdb) repo.

Updating the cask for a new release is two edits: `version` in
`Casks/featherdb.rb`, and `sha256` from `shasum -a 256` on the built DMG —
see `frontend/scripts/ship.sh` and `docs/RELEASING.md` in the source repo.
`livecheck` reads the same Sparkle appcast the app itself checks, so
`brew livecheck --cask featherdb` should always report the version Sparkle
is already offering — no separate source of truth to drift out of sync.
