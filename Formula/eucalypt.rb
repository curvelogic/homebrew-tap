class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.7.0.1851"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.0.1851/eucalypt-aarch64-osx.tgz"
      sha256 "7f501a02229c513751137f5ed3d74b5801ec9e681d24a70fce8f6315becfdcb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.0.1851/eucalypt-aarch64-linux.tgz"
      sha256 "d240c96af15f3fb84acebb0baa91344652a388110303dec11cdf394ef6d05d78"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.7.0.1851/eucalypt-x86_64-linux.tgz"
      sha256 "c349b6de3a831f6469c8f3de98e1c2937343b0fe68f256d2a82dd5270b54b4f5"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
