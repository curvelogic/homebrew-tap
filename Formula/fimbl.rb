class Fimbl < Formula
  desc "A very simple command line based file integrity checker for the paranoid."
  homepage "https://github.com/curvelogic/fimbl"
  url "https://github.com/curvelogic/fimbl/archive/refs/tags/0.1.20.tar.gz"
  sha256 "98a6bc7bf534e9bc42992c62ac16872ca531b31f87abee44c079dcb4710dcfb2"
  version "0.1.20"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "fimbl"
    bin.install "target/release/fimbl"
  end
end
