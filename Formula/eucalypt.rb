
class Eucalypt < Formula
  version "0.2.0.40"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.40/eucalypt-x86_64-osx.tgz"
  sha256 "74c4ebb6b4c47468038d3d9bcee4ec9b73e8ca59ce181dd2ed8884fb7f5c68bf"
  bottle :unneeded
  
  def install
    bin.install "eu"
  end
  
  
  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
  
end

