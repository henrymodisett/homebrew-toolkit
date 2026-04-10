class Toolkit < Formula
  desc "Shared engineering toolkit — principles, scripts, and Codex pre-push review for all projects"
  homepage "https://github.com/henrymodisett/toolkit"
  url "https://github.com/henrymodisett/toolkit/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "cdf6078e6a3915694e27dd5a336d6ade9846261795a74abbbf616938446a435c"
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
