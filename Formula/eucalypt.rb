class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.1/eucalypt-aarch64-osx.tgz"
      sha256 "e32bdab23e0516dff9a9037249fd54be32bbfc3f03c107a1926659519f4b1397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.1/eucalypt-aarch64-linux.tgz"
      sha256 "829972d87f6ef5dbe5e0698839ee6cb4c75c4373c4f046644ffcbd33fff8347e"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.1/eucalypt-x86_64-linux.tgz"
      sha256 "5ea1acabe025c07cb9bda7b3162886444599cb2368a23f076842aae2232806dc"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
