class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.0/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "9993c750b998524042949cb1a1b1bbaf1d1add6e8e6027a71c937b38333309c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.0/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "84a6f338bba9649db91051ae20bb24ca6ecb90b1c0106af0f9f94dbcc41ca36c"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.0/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a62238f68385f179785a59e67ce596080b5f30d791ddf5168f96e336a69fe3e"
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
