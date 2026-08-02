class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.0/eucalypt-aarch64-osx.tgz"
      sha256 "74623befa222b55d95c3f9e2779dcb3bd824a97bce09e1fd2e866abfe4acea79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.0/eucalypt-aarch64-linux.tgz"
      sha256 "dc5009a5d6c1113aae841c6b13d9048d78fdde7274ca223a473a5f20ead40c49"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.14.0/eucalypt-x86_64-linux.tgz"
      sha256 "5c278555e7ac62e6d6cc096e7ca59d1b03d2e96979758ac2baba68c52d44376e"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
