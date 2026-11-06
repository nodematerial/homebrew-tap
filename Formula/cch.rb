class Cch < Formula
  desc "Browse, search and resume Claude Code conversations across projects"
  homepage "https://github.com/nodematerial/cch"
  url "https://github.com/nodematerial/cch/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "dc998c90efe998156a3c9d9f2a96a8e54e9cbaca7f90dd582e0cf30bd746d7a7"
  license "MIT"

  depends_on "fzf"
  depends_on "jq"
  depends_on :macos
  depends_on "ripgrep"

  def install
    bin.install "cch"
  end

  def caveats
    <<~EOS
      cch also needs Claude Code (the claude command):
        https://docs.claude.com/en/docs/claude-code
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cch --version")
  end
end
