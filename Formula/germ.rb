# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.1.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.1.0/germ-linux-x86_64.tar.gz"
      sha256 "d1a09fcd2322cdb96c9ffce417b32f89ae81deef509ddd9f2d80b90ae49a2ac3"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.1.0/germ-linux-aarch64.tar.gz"
      sha256 "19cacea79cd9dc43c5873f213b55eb6041777c1a9910cbfe5f3a5042936e9e2e"
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
