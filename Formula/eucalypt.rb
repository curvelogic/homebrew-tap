class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.11.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.1/eucalypt-aarch64-osx.tgz"
      sha256 "556b1816000ef8713f40f343ff2d2e9c6707c33c16892096072144eddad1af8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.1/eucalypt-aarch64-linux.tgz"
      sha256 "76eadecfa2dbb394f36c01f1dca743ecbfe162129ba9c634ca3f4f6ec3fe0670"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.1/eucalypt-x86_64-linux.tgz"
      sha256 "7224505fe6e28d8233341b200d401b2f6108dffbd08d3d9f39307dc1cb511fc7"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
