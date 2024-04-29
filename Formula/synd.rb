class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.3/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "330641c767c01107e2f214dec759b0620125d46c8180ca4c0d46372a67a7018e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.3/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "1239839707cbacbf78963a22aca003e7b488e68e67ca040f8841dd6cba8f5eb4"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.3/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a7fafc93707ce5f75e36eee0f263e6ff5d11d5633ff7cede60d78d887c21fa7"
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
