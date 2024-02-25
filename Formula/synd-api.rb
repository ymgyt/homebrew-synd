class SyndApi < Formula
  desc "syndicationd backend api"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.4/synd-api-aarch64-apple-darwin.tar.gz"
      sha256 "b08f2ecc0376cdbc0583066e0b3d24e13a1521246569b0a7312b639694e0971f"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.4/synd-api-x86_64-apple-darwin.tar.gz"
      sha256 "2201f5d0f8b7134b989218ef91e6c26196db950f0c815a165d9660ae4dec806d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.4/synd-api-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e21e54925e2a09ce581d9f829ee2ea378bf824c3b47c379aa7aa1e7c0d9c1e9"
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
