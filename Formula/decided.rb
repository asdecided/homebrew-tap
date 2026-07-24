class Decided < Formula
  desc "Native AsDecided requirements-as-code CLI and read-only MCP server"
  homepage "https://github.com/itsthelore/rac-core"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/itsthelore/rac-core/releases/download/v0.23.0/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "00477139d35e823cd5b6dd345622fc706c3423b53e3fdae6ed506484fb3c3777"
  else
    url "https://github.com/itsthelore/rac-core/releases/download/v0.23.0/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d9294f82df8b04c7ac4549baf0d05e9bf3cf7791fb9c59cabcd8ec1ea35a9c18"
  end

  def install
    odie "The v0.23.0 macOS release supports Apple Silicon only." if OS.mac? && !Hardware::CPU.arm?
    odie "The v0.23.0 Linux release supports x86_64 only." if OS.linux? && !Hardware::CPU.intel?

    bin.install "decided"
    bin.install "decided-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
