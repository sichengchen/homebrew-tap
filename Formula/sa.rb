class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.13"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.13/sa-darwin"
  sha256 "3ebd0b0d3d5fc6586290ac2d9d1377b6a4e52473148631bf18f3e38d2bd515ae"

  depends_on "oven-sh/bun/bun"

  def install
    bin.install "sa-darwin" => "sa"
  end

  service do
    run [opt_bin/"sa", "__engine"]
    keep_alive true
    working_dir Dir.home
    log_path var/"log/sa/engine.log"
    error_log_path var/"log/sa/engine.log"
    environment_variables SA_HOME: "#{Dir.home}/.sa", PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sa --version 2>&1", 1)
  end
end
