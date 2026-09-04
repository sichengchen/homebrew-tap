cask "rajio" do
  version "0.10.1"
  sha256 "ff4a46e53c5d01cbd326c15aaeb23eabae53133e5ec8fd794ce40c63a88e1edc"

  url "https://github.com/sichengchen/rajio/releases/download/v#{version}/Rajio-#{version}-universal.dmg"
  name "Rajio"
  desc "Desktop podcast player"
  homepage "https://github.com/sichengchen/rajio"

  app "Rajio.app"
end
