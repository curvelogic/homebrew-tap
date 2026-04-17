class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.3.1456"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1456/eucalypt-aarch64-osx.tgz"
      sha256 "114c45b4de4e1b7c24d2732659f85841aec94c7ad481acb4bbf6f64daaa6780a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1456/eucalypt-aarch64-linux.tgz"
      sha256 "5530e658da81436a00f7a4378bed155d7cbdc9293ca5c4263d7cfcfe9bd3f2b1"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.3.1456/eucalypt-x86_64-linux.tgz"
      sha256 "d6e98a1ba56010c9fcd56384402436f4ae1a544b43960c2e2cbd78cf11328e35"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
