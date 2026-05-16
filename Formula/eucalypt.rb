class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.1/eucalypt-aarch64-osx.tgz"
      sha256 "9adcfeb781816c711cda7d951350f185ebff5254dc9f9e36d2522610422f5858"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.1/eucalypt-aarch64-linux.tgz"
      sha256 "4208ba422232c72e555d8e100a70d49d606b69a684bb0037503ee1f7d1b5feaf"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.1/eucalypt-x86_64-linux.tgz"
      sha256 "cc3fae9e46e1eb0a204194c7e72a4c2d09eb58bac8bb73ea13378f9b740fcb89"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
