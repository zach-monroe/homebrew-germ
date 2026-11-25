# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.6.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.6.0/germ-linux-x86_64.tar.gz"
      sha256 "7683cafec566f83cd2975abff5f94e4c5b03ea523c59b745bc28930cd15346f0"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.6.0/germ-linux-aarch64.tar.gz"
      sha256 "8c266ead53098a12f62c75ef4b2b617f13890491cd7c1582f29d80f3417d16c6"
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
