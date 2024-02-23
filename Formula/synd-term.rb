class SyndTerm < Formula
  desc "terminal feed viewer"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-aarch64-apple-darwin.tar.xz"
      sha256 "6463be059c6c18ac79a029ba6ff743fe3c2b3e9ce4e5ae1edd083647962add54"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-apple-darwin.tar.xz"
      sha256 "879dbf7ff634e348060db02eae632babbde2182d630a9322097e08fbf961439b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "032b1595ca5e7431149e4780a606df8fea8c611c9640264ad8df8f2131dafc33"
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
