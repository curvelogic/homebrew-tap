class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.4.1467"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.4.1467/eucalypt-aarch64-osx.tgz"
      sha256 "1875c01771d2e5494643252de561598f6bfcaaf9fd1de5f8824efdbbeca2d3f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.4.1467/eucalypt-aarch64-linux.tgz"
      sha256 "0eb5de83ff399fd5d6fe16e6c32703e34220b1447fb3af375ab84ec1d079fa90"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.4.1467/eucalypt-x86_64-linux.tgz"
      sha256 "224fab15541d9e5344ef6ec8198bbfca3ac03a319a6352f8532b1a667fae071e"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
