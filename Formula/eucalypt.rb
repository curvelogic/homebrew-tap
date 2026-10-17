class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.15.0/eucalypt-aarch64-osx.tgz"
      sha256 "9a820f60641462a7df1507d0ec3543a036cbc9cd0a8d4b585ffa872b5dcb90e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.15.0/eucalypt-aarch64-linux.tgz"
      sha256 "4ce0e879fd33f69ce72db544eaad4a7519e3b3816417c5547297dada2ea8b050"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.15.0/eucalypt-x86_64-linux.tgz"
      sha256 "654a59f1c3c6a165d0ecb6e25d24bd575ffe6350ccb647faf9aaeb8b8968c5ac"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
