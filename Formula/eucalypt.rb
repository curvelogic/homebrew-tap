class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.1/eucalypt-aarch64-osx.tgz"
      sha256 "4ec6ae2ce356ea40f6652e4aea40585ae27eca15d668407030cd36d540c19e36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.1/eucalypt-aarch64-linux.tgz"
      sha256 "52c655cd4c52694bb0e8458dc22092eef75965cacf091bab7e05c5b3fa9cb6d6"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.13.1/eucalypt-x86_64-linux.tgz"
      sha256 "8a234980f74f9365dc7967d27b3cf30bfb921814459483ab260faa85039b7ba3"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
