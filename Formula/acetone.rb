class Acetone < Formula
  desc "Version-controlled labelled property graph database, queried with openCypher"
  homepage "https://github.com/curvelogic/acetone"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.1/acetone-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "1d711ce263e21570530b1b631250e87cc737498ef8b81b6a5aa156425737ec6e"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.1/acetone-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0c96d16aeeb97d8446e3585857b9a7898902baf199ed6ea914b97ca769696580"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.1/acetone-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "777041cc46340e9bde4ae7505c3f49e2155ca1fb86dd162ca89a3c400eb5da86"
    else
      url "https://github.com/curvelogic/acetone/releases/download/v0.1.1/acetone-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1f553eb47555b24014ace78d68c4678fe9a0c261a5b6afc60d1d556ed90ce8e0"
    end
  end

  def install
    bin.install "acetone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acetone --version")
  end
end
