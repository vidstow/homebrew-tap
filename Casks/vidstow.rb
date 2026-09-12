cask "vidstow" do
  version "0.1.0-beta.6"
  sha256 "529c475a2ba39dcd20b4fa388cfe96f1f52aadc5e83116c1dc9a45999bbbbab2"

  url "https://github.com/vidstow/vidstow/releases/download/v#{version}/VidStow-#{version}-darwin-arm64.zip"
  name "VidStow"
  desc "Desktop YouTube download manager"
  homepage "https://github.com/vidstow/vidstow"

  depends_on arch: :arm64
  depends_on formula: "ffmpeg"
  depends_on macos: :big_sur

  app "VidStow/VidStow.app"

  # VidStow's current public beta is ad-hoc signed rather than Apple-notarized.
  # Homebrew verifies the pinned archive checksum before this explicit bypass.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/VidStow.app"]
  end

  zap trash: "~/Library/Application Support/vidstow"

  caveats <<~EOS
    VidStow #{version} is ad-hoc signed and is not notarized by Apple.
    This cask removes macOS quarantine after verifying the pinned SHA-256 checksum.
    Review the source and release metadata at:
      https://github.com/vidstow/vidstow/releases/tag/v#{version}
  EOS
end
