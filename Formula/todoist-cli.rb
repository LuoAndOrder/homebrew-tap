class TodoistCli < Formula
  desc "Fast, offline-capable CLI for Todoist"
  homepage "https://github.com/LuoAndOrder/todoist-rs"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.3/td-aarch64-apple-darwin.tar.gz"
      sha256 "9621b981800c4a4e75dd7e888aaa0191942b9df0296c5bb3d673303ee0700e6e"
    else
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.3/td-x86_64-apple-darwin.tar.gz"
      sha256 "8df6dbd0627062dd0cf16292520346f1d5dbea536e573567ab81e21b71346344"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.3/td-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "782b7b9da1ac5ed4fa0034d1d4563adf45713edc2689b60fa41fd65118cea55b"
    end
  end

  def install
    bin.install "td"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/td --version")
  end
end
