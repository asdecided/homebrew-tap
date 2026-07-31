class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://github.com/asdecided/core"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.26.1/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "d90eb14a53f961860f4fe5b76b89a2978356bc9d854d41b08912581c8605733d"
  elsif OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.26.1/asdecided-x86_64-apple-darwin.tar.gz"
    sha256 "33490680526ee09de7d5a9c0c137eaca49ab8603c3fe5044b009aefa8f6c4728"
  elsif Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.26.1/asdecided-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ebbf82115bf642da071d37bc2dfe7bbfa630c9e120185815953db489a728f134"
  else
    url "https://github.com/asdecided/core/releases/download/v0.26.1/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1250260b3b5983cadd113090cf3a57b790c2aa5c2d4673707e1f29aa24ed6ab"
  end

  def install
    bin.install "decided"
    bin.install "decided-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
