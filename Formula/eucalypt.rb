class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.1.1345"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.1.1345/eucalypt-aarch64-osx.tgz"
      sha256 "2c99e059bf2c3a9282c9211fe7357eb77a143c0214141083e77b55bbe30f4dff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.1.1345/eucalypt-aarch64-linux.tgz"
      sha256 "27623807e9fa4bfe913fd9ad4262da20a677c77f63027593e7805f85f14d5e08"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.1.1345/eucalypt-x86_64-linux.tgz"
      sha256 "4300234a0b5bd67c4b96be2bd4a53cb185d1442dd495bce87596637acec0e413"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
