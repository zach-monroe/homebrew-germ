# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.3.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.3.0/germ-linux-x86_64.tar.gz"
      sha256 "3a1a13769be8b7fc4d6d396c5fd7f8f4ef27228301db57fbb89f5ef36501dd49"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.3.0/germ-linux-aarch64.tar.gz"
      sha256 "c93057291752f5c046af12aeafed3bd4cb99d1e6c84d9e1f47fc2b772a99f8c9"
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
