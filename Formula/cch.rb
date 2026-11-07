class Cch < Formula
  desc "Browse, search and resume Claude Code conversations across projects"
  homepage "https://github.com/nodematerial/cch"
  url "https://github.com/nodematerial/cch/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e569cc86873d3b05c45bab35835b92a3c0fc37c867f2390afb1ef82d72c963f3"
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
