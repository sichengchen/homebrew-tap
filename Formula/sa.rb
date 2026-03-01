class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.3.3"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.3.3/sa-darwin"
  sha256 "af72dc1b031306b73cd6461447a44b77c7561aa839faac764da37dcb22fb59be"

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
