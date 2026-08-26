class Simutex < Formula
  desc "Tiny mutex for iOS Simulators"
  homepage "https://github.com/sichengchen/simutex"
  url "https://github.com/sichengchen/simutex/releases/download/v0.2.0/simutex-0.2.0-macos-arm64.tar.gz"
  sha256 "8b3c4d9b2a6f050385ffcbb866fc8d145c9b5117a679e81ed1649cb1bb3704a8"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "simutex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/simutex version")
  end
end
