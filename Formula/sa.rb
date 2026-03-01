class Sa < Formula
  desc "Personal AI agent assistant"
  homepage "https://github.com/sichengchen/sa"
  version "2026.3.0"
  license "MIT"

  url "https://github.com/sichengchen/sa/releases/download/v2026.3.0/sa-darwin"
  sha256 "f48fb1cf3114ae26d4b199248cbc4c79c7da38c65f458b19e5272e470d5b48d5"

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
