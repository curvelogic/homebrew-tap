class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.1/eucalypt-aarch64-osx.tgz"
      sha256 "0f259383c473a4e70f4a0e6310b08e090e030ec4d2d8191f101683072440e4dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.1/eucalypt-aarch64-linux.tgz"
      sha256 "3fa2fe9b9f8440f00e9561358f2a09339568281e377724852d554808b857ecf0"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.1/eucalypt-x86_64-linux.tgz"
      sha256 "4310c350d3a474f6f28dad72391898440ded3ed3a078d7a6df80cc0d707e3df0"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
