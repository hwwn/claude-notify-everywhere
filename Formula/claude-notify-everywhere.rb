class ClaudeNotifyEverywhere < Formula
  desc "Get notified when Claude Code needs your attention — desktop & mobile"
  homepage "https://github.com/hwwn/claude-notify-everywhere"
  url "https://github.com/hwwn/claude-notify-everywhere/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "66925c30e8dfd12b300863b163196f86451fe711636ef8db30c6aa1eb926d90c"
  license "MIT"

  depends_on "jq"
  depends_on "terminal-notifier"

  def install
    bin.install "bin/claude-notify-everywhere"
    lib.install "lib/terminals.sh"

    # Patch lib path to point to Homebrew's installed location
    inreplace bin/"claude-notify-everywhere",
      'LIB_DIR="$(cd "$SCRIPT_DIR/../lib" && pwd)"',
      "LIB_DIR=\"#{lib}\""
  end

  def caveats
    <<~EOS
      To set up notifications, run:
        claude-notify-everywhere install

      This will configure Claude Code to notify you via:
        - macOS desktop notifications (click to jump to your terminal)
        - Mobile push (ntfy.sh, Bark, Pushover, or Telegram)
    EOS
  end

  test do
    assert_match "claude-notify-everywhere v", shell_output("#{bin}/claude-notify-everywhere version")
  end
end
