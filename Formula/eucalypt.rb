class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.352/eucalypt-x86_64-osx.tgz"
  version "0.2.0.352"
  sha256 "45dada59bf6be761f8b5ef7c4ec0b2c5f02da80a0119a75b3aea8c67c1af8787"

  def install
    bin.install "eu"
  end

  test do
    expected = "eu - Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
end
