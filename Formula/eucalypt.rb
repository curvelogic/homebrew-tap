class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.0/eucalypt-aarch64-osx.tgz"
      sha256 "b1e3f51f72004fff5c240378c6f68757ff0069d2978e64e728adb7dac13ef758"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.0/eucalypt-aarch64-linux.tgz"
      sha256 "2c37563103e24f568074bbe9a040943efbc2109a4106a212c716a91a73bcbdc5"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.12.0/eucalypt-x86_64-linux.tgz"
      sha256 "e21ac53813c57b1a0510d5eae4c704d2677ffda10ba4eefda1a2d56709c4ba9e"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
