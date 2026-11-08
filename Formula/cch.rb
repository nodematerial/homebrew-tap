class Cch < Formula
  desc "Browse, search and resume Claude Code conversations across projects"
  homepage "https://github.com/nodematerial/cch"
  url "https://github.com/nodematerial/cch/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "a5562be0ea4febdbf9066c42677302ec6508f803dd46fcaccf949df05042e504"
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
