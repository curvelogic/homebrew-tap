class Eucalypt < Formula
  version "0.2.0.224"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.224/eucalypt-x86_64-osx.tgz"
  sha256 "69716d57cfb19668ca7a5331ecbf470320d1b3e7982bad10b397f2f61c4b92e6"

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
