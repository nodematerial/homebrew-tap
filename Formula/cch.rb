class Cch < Formula
  desc "Browse, search and resume Claude Code conversations across projects"
  homepage "https://github.com/nodematerial/cch"
  url "https://github.com/nodematerial/cch/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "4d983966255249c06dea3ef1a6d186520cb9497538304d56a32f3b46cfa0cc4c"
  license "MIT"

  depends_on "fzf"
  depends_on "jq"
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
