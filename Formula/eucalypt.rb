class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.2.1381"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.2.1381/eucalypt-aarch64-osx.tgz"
      sha256 "2a6a26b7e2ada8f3af907b4d8c43f431014324f3e579d77cd26a758aa8880453"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.2.1381/eucalypt-aarch64-linux.tgz"
      sha256 "c26f359be9574d88f667acfc9db035c2a4b411541f64bb3d279aa10c567c3961"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.2.1381/eucalypt-x86_64-linux.tgz"
      sha256 "f4743b19c426874271ec8d01b4eb260a9c3247a6060362efda3d179fbd5bea32"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
