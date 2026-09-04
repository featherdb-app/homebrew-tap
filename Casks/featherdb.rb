cask "featherdb" do
  version "1.8.2"
  sha256 "7006b2a2514401defe05dce7668923821d518ae5892ae462c2dff10650fedcde"

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