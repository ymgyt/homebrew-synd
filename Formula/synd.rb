class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.1/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "eb3d2639bdc3db622165454f146893d52c354c7eb8468c16cc235830ffdb844f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.1/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "4c838e94706234244c46d6a8577510b3db5c66aaef3d63cc5fb83107581eec8a"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.2.1/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b588d787ac716ae32387455264b792fa07c9bc8a59883c338c95c276adea86d"
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
