class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.4.0.712"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.4.0.712/eucalypt-aarch64-osx.tgz"
      sha256 "047116a58553ae620fcce59f222083ed75c995b66f5bb2d365da83337559ab64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.4.0.712/eucalypt-aarch64-linux.tgz"
      sha256 "879cf009d10d234c7c4cadd7cbf655d20fb8a04c46054cc5ff416654762a6dd2"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.4.0.712/eucalypt-x86_64-linux.tgz"
      sha256 "f80000867ad4b226e2da61b6759243142b2d9d058593aba43e534915e2d1058c"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
