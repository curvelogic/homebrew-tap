class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.1/acetone-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "420b1a3400e16cb0883c07feb3b86979c86e407c08ba72675d8e7a575053bbcf"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.1/acetone-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "847567395992be63105da7d409014cef59edec579ebe3864ecaa98f8a0081959"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.1/acetone-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc70ac983261d6b006cc6cd6f27068b13a5a4a09e5cfbe6d7856fe5475d16795"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.1/acetone-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3fb8e5476e1e10c9b2eeb64b1a9d662dcf5417678ec5c01262caefe7f1227b9"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
