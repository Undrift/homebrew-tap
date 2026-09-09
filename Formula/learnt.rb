class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.13"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.13/learnt-darwin-arm64.tar.gz"
      sha256 "a898a41dd1b0cdcdf3c9a5bc3286877a16fa7654c80d35c165c9cfcbd6493893"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.13/learnt-darwin-amd64.tar.gz"
      sha256 "616f233909c3b3eeb0d2f55dba23b578718c7e3bbaeebf0d5a87c531d1cae57d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.13/learnt-linux-arm64.tar.gz"
      sha256 "7c7808b1ef5d0801148932e246507417810120ef553b447cc435108c435b8129"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.13/learnt-linux-amd64.tar.gz"
      sha256 "2f1cd039bcfe553d69a2f9709bfc01d44567f73cbd08e66fe9cf14d1fe190588"
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
