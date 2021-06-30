class Eucalypt < Formula
  version "0.2.0.104"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.104/eucalypt-x86_64-osx.tgz"
  sha256 "0d7fe99284de5e6fc1f21cfbeea9c625ae553fc5a3957c03e34b4e82fc78b59f"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
