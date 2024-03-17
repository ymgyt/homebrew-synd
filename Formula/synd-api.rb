class SyndApi < Formula
  desc "syndicationd backend api"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.6"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.6/synd-api-aarch64-apple-darwin.tar.gz"
      sha256 "dca6fadcb9be120e1d5b2d98bc7fc0865e8c72164bc3b00a26cc6a27dd1ad652"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.6/synd-api-x86_64-apple-darwin.tar.gz"
      sha256 "201a322f6e2f3fb6fb4984aac6967e9cb0fb24c06d90805eed8f609dfeb3fabb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-api-v0.1.6/synd-api-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9c46add2beff07f89904ed22fe21c354439b38da292681c7e99ff65860aad03"
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
