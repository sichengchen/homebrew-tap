cask "eipgam" do
  version "0.2.1"
  sha256 "eb6a2c1a0fc46c4b2224824dda65767a39a84cc3d620ea08485546398bf1feef"

  url "https://github.com/sichengchen/macos-release/releases/download/eipgam-v#{version}/eipgam-#{version}-universal.zip"
  name "eipgam"
  desc "Local gateway and model manager for AI coding agents"
  homepage "https://github.com/sichengchen/eipgam"

  depends_on macos: :monterey

  app "eipgam.app"
  binary "#{appdir}/eipgam.app/Contents/MacOS/eipgam"

  uninstall quit: "com.sichengchen.eipgam"
end
