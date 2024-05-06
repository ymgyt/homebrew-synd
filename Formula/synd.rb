class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.4/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "f67539731429b947a7ecf68334137809f5dd9a6d81d964a1856dbf4a477c0b55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.4/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "8baf2d4d46338de6fa3eccf9b7189dbd446a92ed1e874e5de90e8167c5318cb6"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.4/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da2c009c24c5d80483a80589d6ac7a71ba81ec4d3a69fc8f5dd2ae15fd9de629"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "synd"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "synd"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "synd"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
