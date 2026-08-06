class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.5.0/acetone-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "daceb9784485cb813421c815aa5368f9991734c596d934e4321f7bd9cc96a19f"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.5.0/acetone-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "39d136ab4013d0bfd51c68e4ed375913166b1614211a91a214f269897e190488"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.5.0/acetone-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "20faf1d30dc602a295ed47258a9b89d0c522b58e5500a1785ad8b8cfded1e8c2"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.5.0/acetone-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "efc68ec9d65b81cd810e7d740ee555d451643090c83ee919969e9a621c19e138"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
