class Snipx < Formula
  desc "Text annotation language for structured notes against prose documents"
  homepage "https://github.com/curvelogic/snipx"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/snipx/releases/download/v0.1.0/snipx-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a03cb73191a874e93a62c4d99e5dd039d69badcd24a76662af90061a3030254f"
    else
      url "https://github.com/curvelogic/snipx/releases/download/v0.1.0/snipx-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "cb897d2e6f95bef1d8087a3d542cd040ddcff961841b2858c10f314513c3494f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/snipx/releases/download/v0.1.0/snipx-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e5aa0cfc0d2c0252d5630bc639da3a784273dd9aa886c33e1cc7613b996ee2ea"
    else
      url "https://github.com/curvelogic/snipx/releases/download/v0.1.0/snipx-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "48c19cb4f30f0f02a42d0c68344642b6185accfcb626d46ad397f5b63090e9a1"
    end
  end

  def install
    bin.install "snipx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/snipx --version")
  end
end
