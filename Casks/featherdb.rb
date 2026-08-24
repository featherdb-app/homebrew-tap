cask "featherdb" do
  version "1.0.0"
  # PLACEHOLDER — replace with `shasum -a 256 dist/FeatherDB-<version>.dmg` from the real
  # release build. `brew audit`/`brew install` will refuse this cask until it matches the
  # actual asset, which is the point: a wrong sha256 here is how a cask silently serves a
  # tampered download, so Homebrew treats a mismatch as a hard failure, not a warning.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/NguyenHuuPhuc/featherdb/releases/download/v#{version}/FeatherDB-#{version}.dmg"
  name "FeatherDB"
  desc "Native macOS Postgres client with an MCP gateway for AI coding tools"
  homepage "https://featherdb.dev"

  # Homebrew's own livecheck reads Sparkle feeds directly — one appcast, two consumers,
  # no separate version file to keep in sync. `brew livecheck --cask featherdb` should
  # report the same version Sparkle offers inside the app.
  livecheck do
    url "https://featherdb.dev/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :sequoia"

  app "FeatherDB.app"

  zap trash: [
    "~/Library/Application Support/FeatherDB",
    "~/Library/Caches/dev.featherdb.app",
    "~/Library/Preferences/dev.featherdb.app.plist",
    "~/Library/Saved Application State/dev.featherdb.app.savedState",
  ]
end
