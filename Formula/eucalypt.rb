
class Eucalypt < Formula
  version "0.1.1.2042"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.2.46/eucalypt-x86_64-osx.tgz"
  sha256 "e57a23a9381111d6e0c8919acf1165bd6dcdc9f48a428bffbbfd26ff43e3f88b"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

