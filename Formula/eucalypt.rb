class Eucalypt < Formula
  version "0.2.0.184"
  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.2.0.184/eucalypt-x86_64-osx.tgz"
  sha256 "46b9397131366e827d647b819d8ce03c3178c0b0915cc5955c65ac6e8d97b009"

  def install
    bin.install "eu"
  end


  def test
    expected = "Eucalypt (Rust Impl: v#{package.version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end

end
