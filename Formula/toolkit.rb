class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "37dbf50e0934ea91695865b37896c60a8c3a2ceef59d216a6de0dad3ec004119"
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
