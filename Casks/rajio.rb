cask "rajio" do
  version "0.10.0"
  sha256 "d7142d4eceabcc145fdf265fd64eadc7f025178af8a34c1c8aeb6d7b93f82b20"

  url "https://github.com/sichengchen/rajio/releases/download/v#{version}/Rajio-#{version}-universal.dmg"
  name "Rajio"
  desc "Desktop podcast player"
  homepage "https://github.com/sichengchen/rajio"

  app "Rajio.app"
end
