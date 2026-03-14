class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.5.0.1175"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1175/eucalypt-aarch64-osx.tgz"
      sha256 "8c4743d50ae0101c7b5dff9e5593243730418da7e680ce0f9c4d82a95e89bad6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1175/eucalypt-aarch64-linux.tgz"
      sha256 "02f8a2782aeb70b466e8504b9f7d0803bb750ce65cb7b6067e3c5113c5594eda"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.5.0.1175/eucalypt-x86_64-linux.tgz"
      sha256 "2cbe6621f3a034d54f9b89ecf27ecbbaf06bb43a976e7cbd5412006c535b98fc"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
