class Cch < Formula
  desc "Browse, search and resume Claude Code conversations across projects"
  homepage "https://github.com/nodematerial/cch"
  url "https://github.com/nodematerial/cch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "198875a4414800d5878b5103a03ce0da20ac57543089c18526f09770515b14fe"
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
