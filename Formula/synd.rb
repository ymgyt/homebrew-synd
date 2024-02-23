class Synd < Formula
  desc "terminal feed viewer"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-aarch64-apple-darwin.tar.xz"
      sha256 "3799d8bd54a146c48d3b3a1eeb393ad0d79584e97653e985deb8068824719ee6"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-apple-darwin.tar.xz"
      sha256 "37072d8ab479c5ac94ee19f65224e7335e9a5284be056857c2e2feddab3770ee"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f6088e7fe291501b136b3c23f57a70fc71d76f0fdec730dae2cbf32ff83b9fd9"
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
