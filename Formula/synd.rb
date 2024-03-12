class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.7"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.7/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "b064706c3e6e1db1a47e4926693b3cb66bb6b91133a9b8f6551d5f487fae3a6f"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.7/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "7162bd96b6701115ad149c7830d66128d0e3457971ee143f13ec5414641a89b6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.7/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91651676f326fe839a8ea883800b9e523435273f0d8a494fe9bcb2a57192fd3c"
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
