class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.1/eucalypt-aarch64-osx.tgz"
      sha256 "59b8ceffae3bffc5057467bbebd52bd8aa2083aad8dd93ecc206eae632b6d7ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.1/eucalypt-aarch64-linux.tgz"
      sha256 "7422fcd6f705b9bc56ae68f5a930182ce42a7b94dac149aeaae38f8df1b96f3c"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.8.1/eucalypt-x86_64-linux.tgz"
      sha256 "b0ca690f6547ed43e01d9c1eda6c4af50c95e0d6eab9d6d295aec7200c61c35b"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
