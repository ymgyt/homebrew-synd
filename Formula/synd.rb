class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.9"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.9/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "a30c38fb1a875e30eb8b303a44c2ed82b2e7c48c55218f12fe636db3ffa05ea0"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.9/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "7d2b9f854dbcc22ad5241a0b4896fcfea9a2923c1b317ea1f1faea8a41515f56"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.9/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20ff29822e4c84493efe7016975948e921ba5200e619a7ca7f9ad46ed3d9b393"
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
