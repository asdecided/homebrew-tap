class WayfinderRouter < Formula
  desc "Local execution policy for AI model routing"
  homepage "https://github.com/asdecided/WayfinderRouter"
  url "https://github.com/asdecided/WayfinderRouter/archive/refs/tags/router-v1.0.0.tar.gz"
  sha256 "d7ab09fde8193ce12f855a8de74870f1f929dd596991879ba028fd03b600e709"
  license "Apache-2.0"
  version_scheme 1

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
