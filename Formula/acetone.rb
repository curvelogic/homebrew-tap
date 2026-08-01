class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.4.0/acetone-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "968a16fe4a9a966d826782a00229e2092446e0a699423c6197192e03ed8fdf40"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.4.0/acetone-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "bea7d9121cf3f6c9809b2ad2ed8fcf08f538c6d048586d5d4fb58654ce2c08e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.4.0/acetone-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "96ee198e68845f176940d4982128dd6b27e08a83529bd5c03d90f8b448e6d9ae"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.4.0/acetone-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c314f93d77e98bf8cf06ba615a61d12244c704a1817957bb11ae7c35a104d7cb"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
