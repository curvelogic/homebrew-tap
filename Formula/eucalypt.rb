
class Eucalypt < Formula
  version "0.1.1.1861"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1861/eucalypt-x86_64-osx.tgz"
  sha256 "62487a8859233a3e9f81f8534db4da51ca24fb51b4de8bbe85e57f0a555b8dbd"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

