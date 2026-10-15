class Controlkit < Formula
  desc "Command-line automation for iOS simulator apps"
  homepage "https://github.com/redne-w/ControlKit"
  url "https://github.com/redne-w/ControlKit/releases/download/v0.3.1/controlkit-v0.3.1-macos-arm64.tar.gz"
  sha256 "3c793fbfe85c7227579ee6fb55d5fab1cbcad496060b2ba89935324f7da9ac7e"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  # ControlKit runs xcodebuild and simctl and builds its XCTest helper on first use.
  depends_on xcode: ["26.0"]

  def install
    bin.install "bin/ControlKit"
    # ControlKit finds its helper sources at ../share/ControlKit relative to its real path.
    share.install "share/ControlKit"
  end

  def caveats
    <<~EOS
      ControlKit needs a dedicated iOS simulator; see: ControlKit help run
      The agent skill is installed at:
        #{opt_share}/ControlKit/skills/ios-use-controlkit/SKILL.md
      To report a problem, run: ControlKit report
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ControlKit --version").strip
    assert_path_exists share/"ControlKit/Helper/RuntimeTests.swift"
  end
end
