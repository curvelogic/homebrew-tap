class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.6.1.1685"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1685/eucalypt-aarch64-osx.tgz"
      sha256 "8e44558d93c4c0533b8d80e1c36d7351fe08bc57bf175fd06c0e0a2222454977"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1685/eucalypt-aarch64-linux.tgz"
      sha256 "10df067547fa0d7676031bbe19aecca7622803c4212f2a294454346caa0def91"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.1.1685/eucalypt-x86_64-linux.tgz"
      sha256 "a262c12403aac276540dda402e8ea6d6a860ec7d7cb4984959275f59530be8c1"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
