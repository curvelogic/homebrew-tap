class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.0/acetone-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "b0734e6eee7d415c39744817af1f1d0a392eb8faec94afa7677775df7912df4c"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.0/acetone-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "e95c954e2b25966d6ba34d4c3d3c9b549c9897d868bb4a4775cf374c0dbe6c8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.0/acetone-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f274950ebb4634a7c02668232e82019acff96d0bafbbb1964f157ea3576c867"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.3.0/acetone-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26f1a075d076f9c8a199af2d10ebdca8d1e0af0fa5d6633b1184382ff8765d13"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
