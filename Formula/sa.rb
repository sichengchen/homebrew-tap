class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/sichengchen/sa/releases/download/v2026.2.0/sa-darwin-arm64"
    sha256 "PLACEHOLDER"
  end

  on_intel do
    url "https://github.com/sichengchen/sa/releases/download/v2026.2.0/sa-darwin-x86_64"
    sha256 "PLACEHOLDER"
  end

  depends_on "bun"

  def install
    binary = Dir["sa-darwin-*"].first
    bin.install binary => "sa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sa --version 2>&1", 1)
  end
end
