
class Eucalypt < Formula
  version "0.1.1.2042"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.2042/eucalypt-x86_64-osx.tgz"
  sha256 "be6d2ee06a12db3f2fe857de7882e453e80cc956b363b6a466c51995f675dd75"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

