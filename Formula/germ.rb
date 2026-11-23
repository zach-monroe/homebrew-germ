# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.2.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.2.0/germ-linux-x86_64.tar.gz"
      sha256 "f5da17ca45dd34e0e1195c01cb5fdf377badee8e669d23b8d9fce830a3a457f1"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.2.0/germ-linux-aarch64.tar.gz"
      sha256 "33924df44675b5e2cd9eb463706693f9ef9e7705f11a91633cefc1babd5ae350"
    end
  end

  depends_on :linux
  depends_on "tmux"

  def install
    bin.install "germ", "germ-relay"
    (share/"applications").install "germ.desktop"
    doc.install "README.md", "config.example.toml"
  end

  def caveats
    <<~EOS
      germ draws with your system's OpenGL and X11 libraries (libGL, libX11, ...),
      which any Linux desktop already has. Run `germ setup` once so invite links
      (germ://) open germ.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/germ version")
  end
end
