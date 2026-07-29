class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://github.com/asdecided/core"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.25.1/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "07d08e0a1474094be353ad243545a5538456adc553a3fdbc0718f5f045cbff02"
  else
    url "https://github.com/asdecided/core/releases/download/v0.25.1/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f515983159928d4032ff258ff738dd9885a0d87b21f49fa15c651666b647b80"
  end

  def install
    odie "The v0.25.1 macOS release supports Apple Silicon only." if OS.mac? && !Hardware::CPU.arm?
    odie "The v0.25.1 Linux release supports x86_64 only." if OS.linux? && !Hardware::CPU.intel?

    bin.install "decided"
    bin.install "decided-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
