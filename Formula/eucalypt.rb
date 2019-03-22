
class Eucalypt < Formula
  version "0.1.1.1870"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1870/eucalypt-x86_64-osx.tgz"
  sha256 "6d9f55fb3961ddae0e436c07d87e3caf7ab3fa4298e77eb664fd80656c6c71a8"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

