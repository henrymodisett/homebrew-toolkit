class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "94dc5666f599512c42786e0c88c73fc50ce8088d2b2dd5a2e50a973aa55f6d8a"
  license "MIT"

  depends_on "gh"
  depends_on "git"

  def install
    # Install everything under libexec, symlink the CLI into bin.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/toolkit"
  end

  test do
    assert_match "toolkit v", shell_output("#{bin}/toolkit version")
  end
end
