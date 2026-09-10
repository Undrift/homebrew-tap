class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.17"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.17/learnt-darwin-arm64.tar.gz"
      sha256 "33153308f00ae1bf51467a6b753df9294fdfe5f95e792fa371c33a70b23ba36d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.17/learnt-darwin-amd64.tar.gz"
      sha256 "5d720692dc525fcc1f34b97a99432f64aff2286bf97cd39858317717ce618797"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.17/learnt-linux-arm64.tar.gz"
      sha256 "22ca7180bd4678c17a9a44bc0d487b75b632bd7a3a9ddd110d0a22b46ee6e994"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.17/learnt-linux-amd64.tar.gz"
      sha256 "038696bf5bff2a9bf0ac6b813a1dd53e79d3039b55ad9fe406b938dd58713784"
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
