class Synd < Formula
  desc "terminal feed viewer"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "12e9d8ed3b1b2bd48774525bbe769b70104a938f06f4332a8c63f1be45200114"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "8726fd08166a5eaa1b91ecf214c778bffe33bb056c89970aae9d12d2af19bc39"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2afcdd9439877a3f0169a0f5377f25bd5be2be43f874426880970acd6ac207e8"
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
