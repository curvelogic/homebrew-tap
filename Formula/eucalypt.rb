require "language/haskell"

class Eucalypt < Formula

  desc "Eucalypt (eu) tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/archive/0.1.1.1438.tar.gz"
  # To update: curl -L ${url} | shasum -a 256
  sha256 "e2d43a112194ada76aae6a14d9d4ac01e34623b57ae810704b951e2699d3cfa0"

  depends_on "haskell-stack" => :build
  depends_on "pcre" => :build
  depends_on "pkg-config" => :build

  def install
    inreplace "package.yaml", /version:\s+0\.1\.1\.0/, "version: #{version} "
    system "stack", "--no-terminal", "build", "--ghc-options='O2'"
    binary = `stack --no-terminal path --local-install-root`.strip + "/bin/eu"
    bin.install binary
  end

  bottle do
    root_url "https://github.com/curvelogic/eucalypt/releases/download/0.1.1.1438"
    cellar :any_skip_relocation
    sha256 "124ed40574edbda0c75ae034671eed3723f6b7b2ac6410a0e05a079f26a52184" => :mojave
  end

  test do
    expected = "eu - Eucalypt (Haskell Impl: v#{version})"
    assert_equal expected, `#{bin}/eu --version`.strip
  end
end
