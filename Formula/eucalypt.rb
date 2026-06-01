class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.6.1.1691"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1691/eucalypt-aarch64-osx.tgz"
      sha256 "139f1886eaee12fad85d5650c449cf84d9f3c89738b72d5b6715c0523743fbba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1691/eucalypt-aarch64-linux.tgz"
      sha256 "a948f66f5abb903023f791ebd4a4c5559666f52be2a0ee9ed53688d19283dbef"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1691/eucalypt-x86_64-linux.tgz"
      sha256 "a51ed6cba1baea23361e590de6458788cf34cbdfd2b2d80a74207a39f92fd458"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
