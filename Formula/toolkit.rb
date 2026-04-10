class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "0623b691366bb3b3d1500dcbd70af38b05d05597e862b34df7a53806150acad2"
  license "MIT"

  depends_on "gh"
  depends_on "git"

  def install
    # Install everything under libexec, symlink the CLI into bin.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/toolkit"

    # Shell completions.
    zsh_completion.install libexec/"completions/toolkit.zsh" => "_toolkit"
    bash_completion.install libexec/"completions/toolkit.bash" => "toolkit"
  end

  test do
    assert_match "toolkit v", shell_output("#{bin}/toolkit version")
  end
end
