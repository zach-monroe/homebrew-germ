# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.7.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.7.0/germ-linux-x86_64.tar.gz"
      sha256 "2f1803cf2311aadedaa88f277764cce3e0db6602cb47b897d216bba23003c27c"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.7.0/germ-linux-aarch64.tar.gz"
      sha256 "c96db8261eb88616758df755ee1ee8d797c6a285e6314e4f5507e48d048ba76b"
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
