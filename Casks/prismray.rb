cask "prismray" do
  version "1.0.1"
  sha256 "ca96de49691b03e7ba2b5dcfb69d7291a234ce2af4066e299f3635872c1f141a"

  url "https://github.com/CRACKRAMMER/PrismRay/releases/download/v#{version}/prismray-macos-arm64-full.dmg"
  name "PrismRay"
  desc "Cross-platform dual-core proxy client (Full edition with bundled sing-box & Xray)"
  homepage "https://github.com/CRACKRAMMER/PrismRay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  conflicts_with cask: "prismray-lite"

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
      brew install --cask --no-quarantine CRACKRAMMER/tap/prismray
  EOS
end
