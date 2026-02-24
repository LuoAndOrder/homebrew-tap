class TodoistCli < Formula
  desc "Fast, offline-capable CLI for Todoist"
  homepage "https://github.com/LuoAndOrder/todoist-rs"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.2.0/td-aarch64-apple-darwin.tar.gz"
      sha256 "6e92ebdd0e75c5f31980c163a22328f3ea2748417c79c784feac1b1fc83656d3"
    else
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.2.0/td-x86_64-apple-darwin.tar.gz"
      sha256 "49f8c66f2538633d8b84a273165965d69b1901f8eb5e049d7fe405e23bc59e91"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.2.0/td-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb23940d6bfdd2ba8b1dc6c57794825cb96bf0036e95e92b8783eb4c186dd3ef"
    end
  end

  def install
    bin.install "td"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/td --version")
  end
end
