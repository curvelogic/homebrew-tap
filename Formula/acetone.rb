class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.7.0/acetone-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "dc176b604547e8dc98f3c652f10898ebdff1413a2d3ddb5783de47be8c6ef8dd"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.7.0/acetone-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "7476cd59c3b771d79a69423c9605d965cc02685cbb862b4b377ca0d63a034932"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.7.0/acetone-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "99e58d55add21b4279ae524059e53d84ba539c7a6cce561957a5d1cb6634123b"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.7.0/acetone-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "87e11ebbd94003f011e839ceaecbfc38708c4595b85e029d34c3e2fbdea1df96"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
