class SyndTerm < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.3.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.2/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "ef9e2ee5955f2324fa0af238c6c434d284c7be22a7dfc049902d0ae848ba852d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.2/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "29d0c303986adc368b2561dd28e179b1fc9de94647ac18475caad97b43abb2f5"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.3.2/synd-term-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cbed7b52ad010f1db1944b351680f240d6ba2fc8431b49f4c5bb045ce8084b98"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

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
    bin.install "synd" if OS.mac? && Hardware::CPU.arm?
    bin.install "synd" if OS.mac? && Hardware::CPU.intel?
    bin.install "synd" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
