
class Eucalypt < Formula
  version "0.1.1.1901"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1901/eucalypt-x86_64-osx.tgz"
  sha256 "bdbd319f134d2ae04ea3e52bf1dbb8d10e1130a4b464b17f662a4ff3f0927c7a"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

