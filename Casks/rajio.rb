cask "rajio" do
  version "0.11.0"
  sha256 "2e573e646c9c43091c9f20a87debb61e6beef93bd4cb2bc74c689f2e1439df26"

  url "https://github.com/sichengchen/rajio/releases/download/v#{version}/Rajio-#{version}-universal.dmg"
  name "Rajio"
  desc "Desktop podcast player"
  homepage "https://github.com/sichengchen/rajio"

  app "Rajio.app"
end
