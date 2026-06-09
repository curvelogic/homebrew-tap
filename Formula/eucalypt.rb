class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.7.1.1887"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.1.1887/eucalypt-aarch64-osx.tgz"
      sha256 "e2d918ae825b2f3e4b10f84efa3d781c291b09eb9caaa7f05ad960bfc2f2760d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.1.1887/eucalypt-aarch64-linux.tgz"
      sha256 "e01781ab64c6854d7d0ed656022f1b26ef5595a7f46bc1fe443a391392778797"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.1.1887/eucalypt-x86_64-linux.tgz"
      sha256 "e152303d600c3fe7731af4c06f2a91345c95bcfdc7c40c23ba2e71937c295af2"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
