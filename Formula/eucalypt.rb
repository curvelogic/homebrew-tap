class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.0/eucalypt-aarch64-osx.tgz"
      sha256 "6ba25405a59da84564e7f72b7899e645e12aba4f245523b8bc05d20e7cdeddf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.0/eucalypt-aarch64-linux.tgz"
      sha256 "43490b1c997fdbb78bec34b5840007dee6f51d502389230599c12c1c95ce15ce"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.11.0/eucalypt-x86_64-linux.tgz"
      sha256 "db14b80af4df81e9a38bffc4ec9bf1b90234b253dda863df6af8315d0c4fa97c"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
