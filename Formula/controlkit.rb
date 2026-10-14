class Controlkit < Formula
  desc "Command-line automation for iOS simulator apps"
  homepage "https://github.com/redne-w/ControlKit"
  url "https://github.com/redne-w/ControlKit/releases/download/v0.1.2/controlkit-v0.1.2-macos-arm64.tar.gz"
  sha256 "46ddfc81bdf72556e0c4d049d96c120d995dc94382eb33aedd5d6f4bce930339"
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
