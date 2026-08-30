class AsdecidedCore < Formula
  desc "Native AsDecided engine and read-only MCP server"
  homepage "https://asdecided.com/"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.29.0/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "e40ec60ce196cf94da7d4b903babdf0c86652cdef2f333a0b72250728016cab7"
  elsif OS.mac?
    url "https://github.com/asdecided/core/releases/download/v0.29.0/asdecided-x86_64-apple-darwin.tar.gz"
    sha256 "1eedf6f7b21aba98afd992094bea321a6ac7cf2d7bb81c8d8f6115d0437d832f"
  elsif Hardware::CPU.arm?
    url "https://github.com/asdecided/core/releases/download/v0.29.0/asdecided-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8412976926b04b24a087cbcde7034a54c3f15d0ad12a4420a9cceb54a03f26b8"
  else
    url "https://github.com/asdecided/core/releases/download/v0.29.0/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c0c987e98878a6045ed772dd81f5588e5d775c8287b4abf0edc8fa23448ee10c"
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
