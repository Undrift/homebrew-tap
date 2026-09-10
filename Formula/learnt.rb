class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.3.3"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.3/learnt-darwin-arm64.tar.gz"
      sha256 "059f06b545b67351f83e8c0fb0b1529e844e9c56b1f80218f75261dc67041a77"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.3/learnt-darwin-amd64.tar.gz"
      sha256 "faa20df87ac30b761ef08dd47db9746475193e29d7a023f6b8c3ba8dcc74785c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.3/learnt-linux-arm64.tar.gz"
      sha256 "745659ea33855e39a5f4f013a690c06195e0837b811cf74b3229b4f12f4bd60d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.3/learnt-linux-amd64.tar.gz"
      sha256 "a7c00bc725642cf0cc6659de9ed0010f1b5b655a61e4d5f71e55154b124c4af7"
    end
  end
  depends_on "git"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"learnt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/learnt --version")
    assert_match "schema_version", shell_output("#{bin}/learnt schema")
  end
end
