class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.0/eucalypt-aarch64-osx.tgz"
      sha256 "82d19b6a5251b07f8f12a91dc87d1b2f8eb0404536210a6e3c2f4c92e569617a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.0/eucalypt-aarch64-linux.tgz"
      sha256 "20d28f4afc75bba30d357482938a4a94434f37f7607f7d3d83c74e9a9276deb3"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.0/eucalypt-x86_64-linux.tgz"
      sha256 "1e08de7906ad01eadf235522f1ef990540726b01b0f9e343a324e4305d50e681"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
