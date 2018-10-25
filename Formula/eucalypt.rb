require "language/haskell"

class Eucalypt < Formula
  include Language::Haskell::Cabal

  desc "generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt-hs/archive/0.1.0.703.tar.gz"
  sha256 "01f82e38d1e77fb22168687a5e0daa9356278b9b2748f6b5cf2c33019716ef5e"

  depends_on "ghc" => :build
  depends_on "haskell-stack" => :build
  depends_on "pcre" => :build
  depends_on "pkg-config" => :build

  def install
    inreplace "package.yaml", /version:\s+0\.1\.0\.0/, "version: #{version} "
    system "stack", "--system-ghc", "build"
    binary = `stack --system-ghc path --local-install-root`.strip + "/bin/eu"
    bin.install binary
  end

  test do
    expected = "eu - Eucalypt (Haskell Impl: v#{version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
end
