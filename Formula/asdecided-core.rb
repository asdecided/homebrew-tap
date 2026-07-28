class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://github.com/asdecided/core"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.24.1/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "e96046c5d39586bf9ed4b7967120abf0ea1cd536651bb6bc3b0c00d01b7f40e6"
  else
    url "https://github.com/asdecided/core/releases/download/v0.24.1/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c63ed2b44b7ae4db72395e95f30f74eccfc854585a8ccc39b4ed226e4b55cb48"
  end

  def install
    odie "The v0.24.1 macOS release supports Apple Silicon only." if OS.mac? && !Hardware::CPU.arm?
    odie "The v0.24.1 Linux release supports x86_64 only." if OS.linux? && !Hardware::CPU.intel?

    bin.install "decided"
    bin.install "decided-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
