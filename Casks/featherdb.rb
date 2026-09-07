cask "featherdb" do
  version "1.9.5"
  sha256 "6633ee96f9996031ecd3980c15a2a6d9832bd800cc726fa2c09329cd0a1a7904"

  # featherdb-releases, not featherdb: the app's source repo is private, and Homebrew
  # downloads anonymously. Per-version tag (unlike site/_redirects' evergreen "downloads"
  # tag) — this file is bumped every release by scripts/bump-cask.sh, so pinning the exact
  # tag is more transparent than an evergreen link.
  url "https://github.com/featherdb-app/featherdb-releases/releases/download/v#{version}/FeatherDB-#{version}.dmg"
  name "FeatherDB"
  desc "Client for Postgres, MySQL and MariaDB with an MCP gateway for AI coding tools"
  homepage "https://featherdb.dev/"

  # Homebrew's own livecheck reads the Sparkle feed directly — one appcast, two consumers,
  # no separate version file to keep in sync.
  livecheck do
    url "https://featherdb.dev/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sequoia

  app "FeatherDB.app"

  # BOTH support dirs: dev.featherdb.app (bundle id) holds credentials, snapshots and the
  # AI journal; FeatherDB (display name) holds lookups. A zap that misses either leaves
  # real user data behind after an uninstall --zap.
  zap trash: [
    "~/Library/Application Support/dev.featherdb.app",
    "~/Library/Application Support/FeatherDB",
    "~/Library/Caches/dev.featherdb.app",
    "~/Library/Preferences/dev.featherdb.app.plist",
    "~/Library/Saved Application State/dev.featherdb.app.savedState",
  ]
end