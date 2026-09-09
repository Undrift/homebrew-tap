class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.14"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.14/learnt-darwin-arm64.tar.gz"
      sha256 "873dd4e87c426b89be5b0313233bba1c8fa142e1f1640f32f83783bd9f4c2dfe"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.14/learnt-darwin-amd64.tar.gz"
      sha256 "a3658197fc3495d31cba6373543de18ea394aec8830eb1f3efd73cefd8559820"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.14/learnt-linux-arm64.tar.gz"
      sha256 "3df70eae5c75564d209497b1149e5270073350fde2d2f9f28f46c53363fde53f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.14/learnt-linux-amd64.tar.gz"
      sha256 "7bc8d2781af7d9f3893482d05dda73495672f62ffa9597e1d3cd8e1d8d45543c"
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
