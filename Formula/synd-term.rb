class SyndTerm < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.6/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "c1c26832a5a51f942680ea866b2f79e8c947fd04ba67d1e8274c696fdc9e32c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.6/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "365cc6fbdac46fb0b71a383343034097589f7d2bd08d485e78af17332b6b2ff1"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.6/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e9a6d3811e1ab51080fd507b264e2a0e916f06503160c6b33a23177ba77ecde"
    end
  end
  license "MIT OR Apache-2.0"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}, "x86_64-unknown-linux-musl-dynamic": {}, "x86_64-unknown-linux-musl-static": {}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

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

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
