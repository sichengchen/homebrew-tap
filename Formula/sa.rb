class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.2.18"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.2.18/sa-darwin"
  sha256 "a1256b3d7226710bd6a2c2698c4006b28afd9a4f3c770b49bd9f5cd4dbb416df"

  depends_on "oven-sh/bun/bun"

  def install
    bin.install "sa-darwin" => "sa"
  end

  service do
    run [opt_bin/"sa", "engine", "start"]
    working_dir Dir.home
    environment_variables SA_HOME: "#{Dir.home}/.sa", PATH: "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sa --version 2>&1", 1)
  end
end
