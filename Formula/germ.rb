# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.5.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.5.0/germ-linux-x86_64.tar.gz"
      sha256 "e18842081086fe0b90c6fa576a72f519d1488eabe3e3c9c1011878e0ef5c11ea"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.5.0/germ-linux-aarch64.tar.gz"
      sha256 "44c450430fef06ea916b29ee83c0a66408c7de9329c6842969d9cbc4f9386b67"
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
