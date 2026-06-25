class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.1/eucalypt-aarch64-osx.tgz"
      sha256 "863e930b2ee3e3b1828b1640928f123981d091068bcdde5afae7d8923d2e4a4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.1/eucalypt-aarch64-linux.tgz"
      sha256 "c23b70956e6eadf22f1b7d287b6a512f9a2548a7171d292d29ed79ded31a7be4"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.1/eucalypt-x86_64-linux.tgz"
      sha256 "a84ba1116e59146578fab6d170f1b2470867d3c55d1e1297ceba0c150d5bff19"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
