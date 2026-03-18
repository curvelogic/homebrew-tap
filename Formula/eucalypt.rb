class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.0.1230"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1230/eucalypt-aarch64-osx.tgz"
      sha256 "de0e67243e68bca6bf77bde43e16b562fc6516d1155f666a15a030cd1e7d5466"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1230/eucalypt-aarch64-linux.tgz"
      sha256 "c729bcfe19440069f3a04e156c8e35a67be8a79e374179194b0843814aee59f2"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1230/eucalypt-x86_64-linux.tgz"
      sha256 "c6afd5b93f7317447517bac01e28b576596791dbd4ea9794f9133793dcbf060f"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
