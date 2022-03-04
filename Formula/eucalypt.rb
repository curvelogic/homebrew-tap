class Eucalypt < Formula
  version "0.2.0.202"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.202/eucalypt-x86_64-osx.tgz"
  sha256 "bd275f9f9af81058f8b140b38f45c07635fdffdb56c6f36f43643a11c5600772"

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
