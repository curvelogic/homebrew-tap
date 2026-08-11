class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.6.0/acetone-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "65a4e4702a15883a0df2520f935cd4f72aeb819ce1d38d7b98c1c82279363fbd"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.6.0/acetone-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "f705b97e974621aeefaaa97c180b1b7e791992f7297b7c59d0f6bb1ce3c03f39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.6.0/acetone-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "763ec31d34ecd7715ad3756e01e352de3f85a1408760a439e7440d1a55555a82"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.6.0/acetone-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c7dc47b7b05b613a488ede15c285c23188b7ac3538960b7c778a40d0398d8b19"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
