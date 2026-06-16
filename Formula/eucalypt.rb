class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.0/eucalypt-aarch64-osx.tgz"
      sha256 "6e090802989f8dedc58c935687ca7eaaa4e90c70a8859a1774ba7706abb14066"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.0/eucalypt-aarch64-linux.tgz"
      sha256 "dfef5da972234d1f4c40da6e051d479e5ab8deb5ff72689bb8717f645ad6a37b"
    elsif Hardware::CPU.intel?
      url "https://github.com/curvelogic/eucalypt/releases/download/0.9.0/eucalypt-x86_64-linux.tgz"
      sha256 "6f59faf3cd162b2f6a6c4d1713f32989001edee98465f82ad2f7838b6935eda4"
    end
  end

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
