class Synd < Formula
  desc "terminal feed viewer"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-aarch64-apple-darwin.tar.xz"
      sha256 "a8b54455c16a88172abc760517fad9cdb29b7eea60b04a953918f397de3a9b57"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-apple-darwin.tar.xz"
      sha256 "948c4a42ce5fd9466faf84806368c760b9bc2015343ffa2c69ccbb73c075e7a8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b6aa2239bb9a32fc708d57cf5e63036e42864a7ff509a994c6ab4cb3a576fcd8"
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
