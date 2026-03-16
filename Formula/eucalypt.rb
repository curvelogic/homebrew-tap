class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.0.1207"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1207/eucalypt-aarch64-osx.tgz"
      sha256 "4772a4a95824740f6fb9d805d94d1d16800d61bd8cb17d4738262a845cdb0b9d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1207/eucalypt-aarch64-linux.tgz"
      sha256 "ee7a72146b2a3c079360f89b3387fe1a36eec97a2ca8ba5d0bea10c065a19153"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1207/eucalypt-x86_64-linux.tgz"
      sha256 "25548671b84355f052cb5d12f49bb35c3c2008dd070c51fa198f7774aab7791a"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
