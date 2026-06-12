class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.0/eucalypt-aarch64-osx.tgz"
      sha256 "88a70ba2393660325c1ee94249eba1f192e100387ab274469d073bc1ff49379c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.0/eucalypt-aarch64-linux.tgz"
      sha256 "af1e998b6f7fefd1b6fe380ae22cee4844822ef1abe6485482472ea9e195d1c7"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.0/eucalypt-x86_64-linux.tgz"
      sha256 "09e74dff1b1984ef7bcd184d233df3822eaad40f83d0840d514984a5434857ae"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
