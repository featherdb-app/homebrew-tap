cask "featherdb" do
  version "1.0.0"
  sha256 "fb55461b4f3390e23e684bd89ec2590c59eae2c09779394a9dc18958b0f908e8"

  # featherdb-releases, not featherdb: the app's source repo is private, and Homebrew downloads
  # anonymously. Per-version tag here (unlike site/_redirects, which points at the permanent
  # "downloads" tag) — this file gets edited every release anyway, so pinning to the exact
  # tag is more transparent than an evergreen link would be.
  url "https://github.com/featherdb-app/featherdb-releases/releases/download/v#{version}/FeatherDB-#{version}.dmg"
  name "FeatherDB"
  desc "Postgres client with an MCP gateway for AI coding tools"
  homepage "https://featherdb.dev/"

  # Homebrew's own livecheck reads Sparkle feeds directly — one appcast, two consumers,
  # no separate version file to keep in sync. `brew livecheck --cask featherdb` should
  # report the same version Sparkle offers inside the app.
  livecheck do
    url "https://featherdb.dev/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sequoia

  app "FeatherDB.app"

  zap trash: [
    "~/Library/Application Support/FeatherDB",
    "~/Library/Caches/dev.featherdb.app",
    "~/Library/Preferences/dev.featherdb.app.plist",
    "~/Library/Saved Application State/dev.featherdb.app.savedState",
  ]
end
