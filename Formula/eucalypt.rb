require "language/haskell"

class Eucalypt < Formula
  include Language::Haskell::Cabal

  desc "generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/archive/0.1.1.1438.tar.gz"
  # To update: curl -L ${url} | shasum -a 256
  sha256 "e2d43a112194ada76aae6a14d9d4ac01e34623b57ae810704b951e2699d3cfa0"

  depends_on "ghc" => :build
  depends_on "haskell-stack" => :build
  depends_on "pcre" => :build
  depends_on "pkg-config" => :build

  def install
    inreplace "package.yaml", /version:\s+0\.1\.1\.0/, "version: #{version} "
    system "stack", "--system-ghc", "build"
    binary = `stack --system-ghc path --local-install-root`.strip + "/bin/eu"
    bin.install binary
  end

  test do
    expected = "eu - Eucalypt (Haskell Impl: v#{version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
end
