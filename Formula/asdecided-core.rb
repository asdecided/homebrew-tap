class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://github.com/asdecided/core"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.26.0/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "239d01eb638433bd45c4ee3c977899eaaac19601b31d1b07c9444992fcd19da1"
  else
    url "https://github.com/asdecided/core/releases/download/v0.26.0/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4d7f2fa85686af8d1006aa530928f60e2cd3d13d8560b303495f2784d1b8bbed"
  end

  def install
    odie "The v0.26.0 macOS release supports Apple Silicon only." if OS.mac? && !Hardware::CPU.arm?
    odie "The v0.26.0 Linux release supports x86_64 only." if OS.linux? && !Hardware::CPU.intel?

    bin.install "decided"
    bin.install "decided-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
