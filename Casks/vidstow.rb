cask "vidstow" do
  version "0.1.0-beta.5"
  sha256 "6f4319c3e9389eb1b884ba48c73ff05a706a4c1cbf45129d7032684571bc8625"

  url "https://github.com/vidstow/vidstow/releases/download/v#{version}/VidStow-#{version}-darwin-arm64.zip"
  name "VidStow"
  desc "Desktop YouTube download manager"
  homepage "https://github.com/vidstow/vidstow"

  depends_on arch: :arm64
  depends_on macos: :big_sur
  depends_on formula: "ffmpeg"

  app "VidStow/VidStow.app"

  # VidStow's current public beta is ad-hoc signed rather than Apple-notarized.
  # Homebrew verifies the pinned archive checksum before this explicit bypass.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/VidStow.app"],
                   must_succeed: true
  end

  zap trash: "~/Library/Application Support/vidstow"

  caveats <<~EOS
    VidStow #{version} is ad-hoc signed and is not notarized by Apple.
    This cask removes macOS quarantine after verifying the pinned SHA-256 checksum.
    Review the source and release metadata at:
      https://github.com/vidstow/vidstow/releases/tag/v#{version}
  EOS
end
