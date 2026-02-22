class AppleCalendarCli < Formula
  desc "Command-line tool for Apple Calendar operations via EventKit"
  homepage "https://github.com/sichengchen/apple-calendar-cli"
  url "https://github.com/sichengchen/apple-calendar-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ce1e4d5eb3c223b100ae4111e855b1a213c2c20621e440247a45c7f19e9f0f11"
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
