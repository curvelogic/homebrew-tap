class Eucalypt < Formula
  version "0.2.0.155"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.155/eucalypt-x86_64-osx.tgz"
  sha256 "fe1f9fafb5f9f4a32402489bae4043be55875ec2aec5a20884273bd7d3217f6d"
  bottle :unneeded

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
