class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.0/acetone-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "2938a2d6cf7b7ca219e21026c4492952e4d7cd8f3d2a63a18ee2d352cf5dd315"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.0/acetone-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "86995e29183b7591aa082046565a35250bbed622afaca205536ca43d7ee23ea6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.0/acetone-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f7e5d5ed3c7339022734f7433af953ae8ce4ca42454052307efb91f9b12b4dc"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.0/acetone-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67c8ebd1dd2f7c503d649f6aa264904fd0f9f8d1d67e380da7740cc91a83f230"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
