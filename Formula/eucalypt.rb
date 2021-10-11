class Eucalypt < Formula
  version "0.2.0.178"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.178/eucalypt-x86_64-osx.tgz"
  sha256 "a56bcfdb72aa98ccef5fe5ec18245fdf776544a7bc73b6a780b8c9625e8cb9d8"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
