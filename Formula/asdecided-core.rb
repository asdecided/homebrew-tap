class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://asdecided.com/"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.26.2/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "45f6af38274969bda8b773ddc7e380485bb728156d1a826a1cd32b7d98f66a7a"
  elsif OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.26.2/asdecided-x86_64-apple-darwin.tar.gz"
    sha256 "6c02a8645ad033dfcaab6cc7c048b7347968db4ce02b972a3c70b3f622de6c0e"
  elsif Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.26.2/asdecided-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "10f7ab61e3485467e30eb033df93d57f294549f30282ffe240b3cfcd7c1eebc6"
  else
    url "https://github.com/asdecided/core/releases/download/v0.26.2/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "301fefbc56ca56454843d5a109d2e5ae535eeed9fae356985ef4d3a323aa3995"
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
