class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.13.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.2/eucalypt-aarch64-osx.tgz"
      sha256 "f6020b7ac8e45029270fffe2d249c77bb0669cf4fb3dc9bb8a552fc17bbc2399"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.2/eucalypt-aarch64-linux.tgz"
      sha256 "d1cdd1c726531d91b0e53ad5e579641921ca34c3aa5cbf6c08cd28e32d4c2910"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.2/eucalypt-x86_64-linux.tgz"
      sha256 "ed9fb9cc47a05e5157f5573adfefde58399d491bddada76eca8967db7d5cac0b"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
