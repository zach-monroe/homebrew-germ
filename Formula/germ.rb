# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.8.1"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.8.1/germ-linux-x86_64.tar.gz"
      sha256 "aa9c4f078e42b1b4bad492de1695a5b7dae7a9f96869d5b608c1b5be5bd95518"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.8.1/germ-linux-aarch64.tar.gz"
      sha256 "395125f9e213b883a5b750b182c0a7a68b92ffe77b1e80c9dda6ee25566674ed"
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
