cask "eau" do
  version "1.0.1"
  sha256 "c3e616a685ae2a8aa83788239423e0034c0a60933cb80cec4371cfac5d9c7d1a"

  url "https://github.com/sichengchen/macos-release/releases/download/eau-v#{version}/Eau-#{version}-arm64.pkg"
  name "Eau"
  desc "Chinese and Japanese input method with mixed candidates"
  homepage "https://github.com/sichengchen/eau"

  depends_on arch: :arm64
  depends_on macos: :ventura

  pkg "Eau-#{version}-arm64.pkg"

  uninstall_preflight do
    executable = "/Library/Input Methods/Eau.app/Contents/MacOS/Eau"
    system_command executable, args: ["--disable-input-source"], must_succeed: false
  end

  uninstall quit: "com.scchan.inputmethod.eau",
            pkgutil: "com.scchan.eau.local-install"

  caveats do
    <<~EOS
      Add Eau under Chinese, Traditional in System Settings > Keyboard > Text Input > Edit > +.
      Complete any activation prompt in System Settings.
    EOS
  end
end
