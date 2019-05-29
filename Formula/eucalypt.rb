
class Eucalypt < Formula
  version "0.1.1.1944"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1944/eucalypt-x86_64-osx.tgz"
  sha256 "d0619d420e187d5f6dfb6f5d20e096d89aad24818102a0e36abdadac7c6f99d0"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

