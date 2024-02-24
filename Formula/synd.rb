class Synd < Formula
  desc "terminal feed viewer"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-aarch64-apple-darwin.tar.xz"
      sha256 "59f5e18439f4a4871c4ab8e9ff37b409a48019e1d89a2cef3db00236e551272d"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-apple-darwin.tar.xz"
      sha256 "0d38bdde14b84a8bcc52a61a3c9f4561d5cd56dc1cab5594ed5e5cf3f29b37eb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.4/synd-term-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "000e9ff279088a4f409ea6d5ba7249950e6b3a79dbe72aea1d499294a7b5f042"
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
