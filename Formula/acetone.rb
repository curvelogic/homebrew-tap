class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.2.0/acetone-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c706793d84afab10ca1cf0fc3237f3b4179a21c63b60d52d2ac1a67d82cbb1aa"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.2.0/acetone-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "227916a39673025dfab1514f7a38189fd4fd481e905f9d58065d7587f76b6954"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.2.0/acetone-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d5d6010ad76a66e8d30f8654fae48584c0ecb7f4669666264b896d76671865c7"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.2.0/acetone-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80a36942c8e0c3080b4663cada11216ec8b0e946e268281ea457ffd222b3f2d1"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
