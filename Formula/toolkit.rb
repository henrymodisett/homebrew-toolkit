class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "3e344da1fb2fe82d3ad7ae0be140a600be0d09533f9e72d9ade3ff137414c1db"
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
