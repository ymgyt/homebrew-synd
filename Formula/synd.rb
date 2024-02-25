class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.5"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.5/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "7195a3a4dd48aa80c5aa7a0dcd33c36aa67ecf3f6bdb973ee23dbb8292cfeaf8"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.5/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "8ead800b10abe218994b19acdda96cb0736ba021ed77ddcd1d473833fb76ccdd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.5/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9534d558e550b738c730bd3be47a4b3756ae870c2cf7f0454b55e06d7ab74ae"
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
