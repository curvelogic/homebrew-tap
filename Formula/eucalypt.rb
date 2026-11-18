class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://eucalypt.curvelogic.info/"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.16.0/eucalypt-aarch64-osx.tgz"
      sha256 "aeda0850b1413437ee46750f8c9062b681bd928ef46472020fddf80694e6dc19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.16.0/eucalypt-aarch64-linux.tgz"
      sha256 "fcdb1172ffde93f40587827621cd0c25f2d5b9807ab38d3dc79876f440ac1e0a"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.16.0/eucalypt-x86_64-linux.tgz"
      sha256 "305dbf089fa826effc1402d5f03abbdc57db65238f774fd3dcbb6d48a78634cc"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
