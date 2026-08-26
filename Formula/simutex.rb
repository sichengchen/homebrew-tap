class Simutex < Formula
  desc "Tiny mutex for iOS Simulators"
  homepage "https://github.com/sichengchen/simutex"
  url "https://github.com/sichengchen/simutex/releases/download/v0.2.1/simutex-0.2.1-macos-arm64.tar.gz"
  sha256 "81ef8e467783e90b6b20fbd29b41767e3946280e3e868dbbaf3131c04684585c"
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
