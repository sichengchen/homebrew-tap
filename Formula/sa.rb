class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.15"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.15/sa-darwin"
  sha256 "04d5332165632ad3c39864cc4adb8436fbff7c03acf2b0cf66439b5b8cfb2dad"

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
