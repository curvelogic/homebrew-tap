class Eucalypt < Formula

  version "0.1.1.1534"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1534/eucalypt-x86_64-osx.tgz"
  sha256 "80e69682dd2ced5882d8669de237b01aa46d3ac52927dd48c383ebac75adfe97"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Haskell Impl: v#{version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
