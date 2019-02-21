
class Eucalypt < Formula
  version "0.1.1.1692"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1692/eucalypt-x86_64-osx.tgz"
  sha256 "f37de39896b28975e3a7c30aca66d58346712dfe16e93f59ef1905566d92435d"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

