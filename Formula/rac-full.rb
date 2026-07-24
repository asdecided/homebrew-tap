class RacFull < Formula
  desc "Complete local RAC toolchain"
  homepage "https://github.com/itsthelore"
  url "https://github.com/itsthelore/rac-core/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "8f3cd6977c1388aa1fdb4884a4267666f0b7c7f9310da0fc29844e2ce6bb5426"
  license "Apache-2.0"

  depends_on "decided"

  def install
    (share/"rac-full"/"manifest.txt").write <<~EOS
      rac-full is the umbrella installation for the RAC toolchain.
      Native commands are provided by the decided dependency.
    EOS
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
    assert_predicate formula_opt_bin("decided")/"decided", :executable?
    assert_predicate formula_opt_bin("decided")/"decided-mcp", :executable?
  end
end
