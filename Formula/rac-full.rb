class RacFull < Formula
  desc "Complete local RAC toolchain"
  homepage "https://github.com/itsthelore"
  license "Apache-2.0"

  if OS.mac?
    url "https://github.com/itsthelore/rac-core/releases/download/v0.23.1/asdecided-aarch64-apple-darwin.tar.gz"
    sha256 "40d7129541609cbcf967f7d7d453e7689412bbaac81aa8d3c84e636367804628"
  else
    url "https://github.com/itsthelore/rac-core/releases/download/v0.23.1/asdecided-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51cce8025a7cb2f8b2caea93a8ea71be0ad8c5c316fd0ecced688267bf97b8ac"
  end

  def install
    odie "The v0.23.1 macOS release supports Apple Silicon only." if OS.mac? && !Hardware::CPU.arm?
    odie "The v0.23.1 Linux release supports x86_64 only." if OS.linux? && !Hardware::CPU.intel?

    bin.install "decided"
    bin.install "decided-mcp"
  end

  def caveats
    <<~EOS
      rac-full currently installs the native AsDecided engine:
        decided
        decided-mcp

      RAC CI integrations are consumed directly from:
        https://github.com/itsthelore/rac-ci

      Python API, ingestion, and connector companions will join this umbrella
      as their independent distributions become release-ready.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decided --version")
    assert_predicate bin/"decided-mcp", :executable?
  end
end
