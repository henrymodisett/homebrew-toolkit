class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "30198725dddbe06e3982277393e09671e573ae6a1d0d43d146f5144867481cf6"
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
