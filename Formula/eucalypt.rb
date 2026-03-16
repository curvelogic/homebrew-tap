class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.0.1221"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1221/eucalypt-aarch64-osx.tgz"
      sha256 "c2b1ed5b529f21628326cda7ff692bfb49f28272aae26a19f5f4167ca1799c50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1221/eucalypt-aarch64-linux.tgz"
      sha256 "191defad81a774371aec3c05ac402206567584231444567bedb1e68baa2328fb"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1221/eucalypt-x86_64-linux.tgz"
      sha256 "ceee99a34800547f672269c1fb200d7fc715a74f689c487396483cee607e4933"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
