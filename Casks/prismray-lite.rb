cask "prismray-lite" do
  version "1.0.1"
  sha256 "3eca86ed9956668a8761d8321dd8a36a4bb230d417ce92072e2ddcf36fb26fba"

  url "https://github.com/CRACKRAMMER/PrismRay/releases/download/v#{version}/prismray-macos-arm64-lite.dmg"
  name "PrismRay"
  desc "Cross-platform dual-core proxy client (Lite edition, downloads cores on demand)"
  homepage "https://github.com/CRACKRAMMER/PrismRay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  conflicts_with cask: "prismray"

  app "PrismRay.app"

  zap trash: [
    "~/Library/Application Support/prismray",
    "~/Library/Caches/com.crackrammer.prismray",
    "~/Library/Preferences/com.crackrammer.prismray.plist",
    "~/Library/Saved Application State/com.crackrammer.prismray.savedState",
    "~/Library/WebKit/com.crackrammer.prismray",
  ]

  caveats <<~EOS
    PrismRay is an open-source release without Apple Developer ID notarization.
    If macOS Gatekeeper blocks the first launch, run:
      xattr -dr com.apple.quarantine "/Applications/PrismRay.app"
    Or install directly with:
      brew install --cask --no-quarantine CRACKRAMMER/tap/prismray-lite
  EOS
end
