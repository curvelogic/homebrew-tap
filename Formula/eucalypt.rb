class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.3.0.498/eucalypt-aarch64-osx.tgz"
  version "0.3.0.498"
  sha256 "f6d58b585c4df7b02b1d404b74f2fd6adafcd851a544f63ced381c819b289bb3"

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
