class Synd < Formula
  desc "terminal feed viewer"
  homepage "https://docs.syndicationd.ymgyt.io/synd-term/"
  version "0.1.6"
  on_macos do
    on_arm do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.6/synd-term-aarch64-apple-darwin.tar.gz"
      sha256 "c02751ba979720a2a24be09e82d6647a6283f28290bbe9c2fb79c03cb6dbb979"
    end
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.6/synd-term-x86_64-apple-darwin.tar.gz"
      sha256 "3be81f95c68bde17ead0972df258c1094b28fd3d2a96c1a05261dba2326f31d8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/ymgyt/syndicationd/releases/download/synd-term-v0.1.6/synd-term-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bd9a646a14263bec04a4d2348a5e966621c68c39b17945af46b27677f4db8a7"
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
