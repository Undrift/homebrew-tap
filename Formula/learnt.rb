class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.5"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.5/learnt-darwin-arm64.tar.gz"
      sha256 "d50451d0e217bd3a7c3f5c10f829a422007d2cb531f39879ea2da10f9a317817"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.5/learnt-darwin-amd64.tar.gz"
      sha256 "43b9919cea730abf42dc5ba0836eb15a14249978db4abaca96a667bc1ba40012"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.5/learnt-linux-arm64.tar.gz"
      sha256 "be103c8a620015a4ea242e0e7eddf29a2b6a983849a398269d328a02046f4ce5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.5/learnt-linux-amd64.tar.gz"
      sha256 "41a4d3824ddbdd6573416fd3535ae769ebdac59a52b79485853d12b5f8540e8f"
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
