class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.1/eucalypt-aarch64-osx.tgz"
      sha256 "b579001b72bb7465c10f80fd136f21c8baa4d77d8f44ff0353467fac6f3c701b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.1/eucalypt-aarch64-linux.tgz"
      sha256 "3d7b248e33acebafb04d3fd89610c8f866863589c5df5b817e63a757b9d8d29e"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.1/eucalypt-x86_64-linux.tgz"
      sha256 "151f98682d04216b520a6a33607794bb7cf35d2df2017f09a369872a2e18599a"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
