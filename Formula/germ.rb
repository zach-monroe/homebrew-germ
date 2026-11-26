# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.8.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.8.0/germ-linux-x86_64.tar.gz"
      sha256 "ee3019c5457d353cd07b3be399e3f7f399ad943b9b271638271132b8c4d4dd12"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.8.0/germ-linux-aarch64.tar.gz"
      sha256 "8102c0a2480eb4d3d36c15520899ec61ad134d9a867d93570939ea0936dff217"
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
