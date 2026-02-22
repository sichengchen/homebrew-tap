class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.10"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.10/sa-darwin"
  sha256 "636e839078d3489b4f463dd113bc53ef77c659d37adb7cac0aa8fede982c2fed"

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
