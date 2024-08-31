class SyndTerm < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.1/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "57090a8bbf29d5edd9ba8df509f74a4740e32ff1f3c6362133fa2bed21a90fb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.1/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "d67698c17bc12d0c1e8b3883f2e93ef2ffd78eaef4afbd8b1df82a74c4375660"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.1/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "227dfb30b624f5de5e8ed8745996837556845929f8393f0fb1c6d1e4927f213e"
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
