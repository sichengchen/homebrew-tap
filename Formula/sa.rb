class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.14"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.14/sa-darwin"
  sha256 "865075a21f72a73e88912c5b394672ed2842a3335301dac9a4629132457b8515"

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
