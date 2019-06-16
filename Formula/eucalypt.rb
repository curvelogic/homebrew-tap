
class Eucalypt < Formula
  version "0.1.1.1972"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1972/eucalypt-x86_64-osx.tgz"
  sha256 "592412087e5311b1f9680b6e8692c46a0216d3300cf0dfe2029986f41851d9f2"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

