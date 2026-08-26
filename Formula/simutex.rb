class Simutex < Formula
  desc "Tiny mutex for iOS Simulators"
  homepage "https://github.com/sichengchen/simutex"
  url "https://github.com/sichengchen/simutex/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "62ccb4777d0c0173899d2bc04de638e7b2ab353d4b522a5c6db89672e1a5d42a"
  license "MIT"

  depends_on :macos
  depends_on "zig" => :build
  depends_on xcode: :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix.to_s
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/simutex version")
  end
end
