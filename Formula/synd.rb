class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.10"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.10/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "f7a9856e63fc210936b31afaf3e56cb8baac589531dbb82b6a5b87b19c4fed68"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.10/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "ad9aaa2ecbde825498dc518964fb3741acea3c0b8f49a748e492c9751a3eee4d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.10/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fa26e03f338c28705e975d6c95705b5893775a4725063a2282c090aff9bb576"
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
