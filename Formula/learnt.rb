class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.3.1"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.1/learnt-darwin-arm64.tar.gz"
      sha256 "4db1df364b7e7b968701dbba29d230d4987c49e32f6c2ed695ebda2bf13baa88"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.1/learnt-darwin-amd64.tar.gz"
      sha256 "1240584989dbf6e740b1ed64b925c50c240724c275df3efef88ca8f4ad82c2b2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.1/learnt-linux-arm64.tar.gz"
      sha256 "b9cd29fd3624d2c886129faaa9de7b25b6cab2de7f1f8aed7ffb57db6085bda6"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.1/learnt-linux-amd64.tar.gz"
      sha256 "7d57ce01a3572c6dc4b69e3b5188e9767da2b16d82b7569d04ccb51ed76250a1"
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
