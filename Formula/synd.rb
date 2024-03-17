class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.8"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.8/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "475fc2067c1b8473b989d822f993840602d324c2472f15cbd27b0acf58f892f8"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.8/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "541e53cc84fc9790385b5c35cacc5c44f158308ef9104ab0f28132f4e747a0b8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.8/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84d0ecc82833974d5271ff18c498e3da233dea5d60804c19fde72b94c40fb0c1"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    on_macos do
      on_arm do
        bin.install "synd"
      end
    end
    on_macos do
      on_intel do
        bin.install "synd"
      end
    end
    on_linux do
      on_intel do
        bin.install "synd"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
