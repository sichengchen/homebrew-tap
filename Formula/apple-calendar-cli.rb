class AppleCalendarCli < Formula
  desc "Command-line tool for Apple Calendar operations via EventKit"
  homepage "https://github.com/sichengchen/apple-calendar-cli"
  url "https://github.com/sichengchen/apple-calendar-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5baa6374b1ae157c78cabc287a85eff58d54eeac43c2c2ad915d4885e3af73b9"
  license "MIT"

  depends_on macos: :sonoma
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    system "codesign", "--force", "--sign", "-", ".build/release/apple-calendar-cli"
    bin.install ".build/release/apple-calendar-cli"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/apple-calendar-cli --version").strip
    system "codesign", "--verify", "--strict", "-R",
           '=identifier "com.scchan.apple-calendar-cli"', bin/"apple-calendar-cli"
  end
end
