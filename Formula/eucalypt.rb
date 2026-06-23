class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.0/eucalypt-aarch64-osx.tgz"
      sha256 "e9a8579657536ea0a2940abac0040b52a0a0047e54f9a20ce53520b71006a016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.0/eucalypt-aarch64-linux.tgz"
      sha256 "4b59bb3fac57e24c40325364e04277b2abf367ed51b3b4b1a7294c1d883e0e91"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.10.0/eucalypt-x86_64-linux.tgz"
      sha256 "8857bf8615196e4f8b68a988d6126812493d84be4b89101b82deb745a0f4ecdc"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
