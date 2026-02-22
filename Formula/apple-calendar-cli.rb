class AppleCalendarCli < Formula
  desc "Command-line tool for Apple Calendar operations via EventKit"
  homepage "https://github.com/sichengchen/apple-calendar-cli"
  url "https://github.com/sichengchen/apple-calendar-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dffdc4bcf74b86bde4aa79025888db0adf441139bb38beba6f8b4a2aa3296cad"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/apple-calendar-cli"
  end

  test do
    assert_match "apple-calendar-cli", shell_output("#{bin}/apple-calendar-cli --version")
  end
end
