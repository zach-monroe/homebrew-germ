# Homebrew formula for germ (Linux only). Published to the
# zach-monroe/homebrew-germ tap by the release workflow:
#   brew install zach-monroe/germ/germ
class Germ < Formula
  desc "Fast GPU terminal with built-in tmux, coding-agent tools, and session sharing"
  homepage "https://github.com/zach-monroe/germ"
  version "0.4.0"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/zach-monroe/germ/releases/download/v0.4.0/germ-linux-x86_64.tar.gz"
      sha256 "c3ab41283f505d9771ea0d266f3f847cd04b43fe477dd7da0eb5ea728d60d461"
    end
    on_arm do
      url "https://github.com/zach-monroe/germ/releases/download/v0.4.0/germ-linux-aarch64.tar.gz"
      sha256 "7aad339157cc416b3b58b853864593a56fb52ae1d341ceb20718de1ac604b387"
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
