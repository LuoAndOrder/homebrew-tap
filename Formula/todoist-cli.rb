class TodoistCli < Formula
  desc "Fast, offline-capable CLI for Todoist"
  homepage "https://github.com/LuoAndOrder/todoist-rs"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.1/td-aarch64-apple-darwin.tar.gz"
      sha256 "4523c53a25b0f14288f5439b847cdba830a1f09bcabf15a598e0d0ffb63338bf"
    else
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.1/td-x86_64-apple-darwin.tar.gz"
      sha256 "9d34dc48317950d9d3c6d3cd8aa44c5cb3512000d61ebd1d25d3d782da12b36f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.1/td-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aea9933b2362b1b3efb215a13cae78b545a9f7119c61cddd2e425df5cb6248c"
    end
  end

  def install
    bin.install "td"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/td --version")
  end
end
