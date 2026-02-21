class TodoistCli < Formula
  desc "Fast, offline-capable CLI for Todoist"
  homepage "https://github.com/LuoAndOrder/todoist-rs"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.4/td-aarch64-apple-darwin.tar.gz"
      sha256 "f3e354b4fd87d4728cd449262940b5a3eb93abe56b58eb40708bd84599c650e4"
    else
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.4/td-x86_64-apple-darwin.tar.gz"
      sha256 "301c3e9dc789d8781cdfe607590182b744b41f5f711574305fa11bc947368f0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/LuoAndOrder/todoist-rs/releases/download/v0.1.4/td-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8969de554c9f2b2b53abba04a81a826e3a88f838ba54bb7affb2ca69a980451"
    end
  end

  def install
    bin.install "td"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/td --version")
  end
end
