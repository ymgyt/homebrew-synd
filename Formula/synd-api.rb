class SyndApi < Formula
  desc "syndicationd backend api"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.5"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.5/synd-api-aarch64-apple-darwin.tar.gz"
      sha256 "73219c05723d9844e90bd667f6298236171fd1353c877d01bb898e7977ac41c2"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.5/synd-api-x86_64-apple-darwin.tar.gz"
      sha256 "b1fa4e0b5973c6c5ab91cd81ede81093d756cdbb02bfa86d7f5d0ee6f75dc023"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.5/synd-api-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39691da8f076b69a50af48604fa78c3601e8ecf93e6ee550e2e4c203f8667e26"
    end
  end
  license "MIT OR Apache-2.0"

  def install
    on_macos do
      on_arm do
        bin.install "synd-api"
      end
    end
    on_macos do
      on_intel do
        bin.install "synd-api"
      end
    end
    on_linux do
      on_intel do
        bin.install "synd-api"
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
