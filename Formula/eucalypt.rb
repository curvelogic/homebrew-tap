
class Eucalypt < Formula
  version "0.1.1.1610"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1610/eucalypt-x86_64-osx.tgz"
  sha256 "55a2b967838f38d76ee6542697cc18f878a70246ac674eaed262803c0fadf1f0"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Haskell Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

