require "language/haskell"

class Eucalypt < Formula
  include Language::Haskell::Cabal

  desc "generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt-hs/archive/0.1.0.943.tar.gz"
  # To update: curl -L ${url} > shasum -a 256
  sha256 "329301d61db032e2b9d279a2fa1ce68ce304e0b32a3eb2972af4d924f6d060e2"

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
