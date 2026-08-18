class WayfinderRouter < Formula
  desc "Local execution policy for AI model routing"
  homepage "https://github.com/asdecided/WayfinderRouter"
  url "https://github.com/asdecided/WayfinderRouter/archive/refs/tags/router-v2026.8.0.tar.gz"
  sha256 "88da91e17fd06c329a6004649ecca672b8f9d87ae947491562c9be3bbba8ff56"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust/crates/wayfinder-cli")
  end

  test do
    output = pipe_output("#{bin}/wayfinder-router route --json -", "Say hello")
    assert_match '"schema_version": "3"', output
    assert_match '"recommendation": "local"', output
  end
end
