class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.0/eucalypt-aarch64-osx.tgz"
      sha256 "239414a168e58948b97316b1d944b7c34f6db17539feef862fdd39a09a00d6a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.0/eucalypt-aarch64-linux.tgz"
      sha256 "6874be4343b1e68711b64b732258f7c1527524251c99b4dd18ecf8a32263d16d"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/v0.6.0/eucalypt-x86_64-linux.tgz"
      sha256 "8997388141d86c49eed2f565bb310eb02a947119e276246167dac6d4aef491d9"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
