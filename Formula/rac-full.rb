class RacFull < Formula
  desc "Complete local RAC toolchain"
  homepage "https://github.com/itsthelore"
  version "0.23.0"
  license "Apache-2.0"

  depends_on "decided"

  def install
    (prefix/"README").write <<~EOS
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
