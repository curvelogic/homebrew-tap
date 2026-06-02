class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.6.2.1786"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.2.1786/eucalypt-aarch64-osx.tgz"
      sha256 "3345e0533334f8daedaa98062f7b9d005a4892a222d413a93dc0626b0587e7a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.2.1786/eucalypt-aarch64-linux.tgz"
      sha256 "096d73c1bc8c47000524beb00f47e7d6679a1cd23b8b3a5270cf0fc5be4ed3a7"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.6.2.1786/eucalypt-x86_64-linux.tgz"
      sha256 "95acb56a5dd90cc50597b7166736d5826e5e91c4384f07e0b897dc8717578d53"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
