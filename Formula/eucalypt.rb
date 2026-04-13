class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.3.1440"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1440/eucalypt-aarch64-osx.tgz"
      sha256 "ddfb1dc232187aab2a84b50fdd53f8950bc635aefa5b9815b0dbaa6f8ffc0da4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1440/eucalypt-aarch64-linux.tgz"
      sha256 "77a0bf5507de557a2b2e211db6cba6fa529fc2a3878e103763070331d4d8b386"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1440/eucalypt-x86_64-linux.tgz"
      sha256 "522824014375959ab8042b783aeaa595a08c26743dfe6c08da3581d1b7561b3e"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
