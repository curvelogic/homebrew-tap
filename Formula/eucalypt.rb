class Eucalypt < Formula
  desc "Tool for generating, templating and processing YAML, JSON, TOML"
  homepage "https://curvelogic.github.io/eucalypt/"
  url "https://github.com/curvelogic/eucalypt/releases/download/0.3.0.361/eucalypt-x86_64-osx.tgz"
  version "0.3.0.361"
  sha256 "f752f3645f4f61de030c93a9064ffbd05738359d6e92101e1ec1392276beeef7"

  def install
    bin.install "eu"
  end

  test do
    assert_match "eu", shell_output("#{bin}/eu --version").strip
  end
end
