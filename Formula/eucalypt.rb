class Eucalypt < Formula
  version "0.2.0.161"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.161/eucalypt-x86_64-osx.tgz"
  sha256 "124cf4f2a596b7eca7d96f78b59c8cc79cc10f1587d0844f48a17762ea91f923"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
