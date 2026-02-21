class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.3"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.3/sa-darwin"
  sha256 "05ef8d3f6bd977cc364d66c08c42c0ece238fbd187ea8325e41910104004ccb3"

  depends_on "bun"

  def install
    bin.install "sa-darwin" => "sa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sa --version 2>&1", 1)
  end
end
