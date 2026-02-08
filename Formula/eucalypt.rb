
class Eucalypt < Formula
  version "0.3.0.361"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.3.0.361/eucalypt-x86_64-osx.tgz"
  sha256 "f752f3645f4f61de030c93a9064ffbd05738359d6e92101e1ec1392276beeef7"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end

