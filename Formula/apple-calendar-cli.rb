class AppleCalendarCli < Formula
  desc "Command-line tool for Apple Calendar operations via EventKit"
  homepage "https://github.com/sichengchen/apple-calendar-cli"
  url "https://github.com/sichengchen/apple-calendar-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9739c34e50cd4b5f928e33f6c34330060eace46f98d5aa6c563f1328fb3e532b"
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
