class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.8"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.8/learnt-darwin-arm64.tar.gz"
      sha256 "ad943a5028a5346472d54256e8c03a02899609fd9b20fe8e8f233dc8370d41db"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.8/learnt-darwin-amd64.tar.gz"
      sha256 "1f30d2ba0a7d1a30fdf29725750736af259ca8d08af81012bc4d6ba7d8a75de3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.8/learnt-linux-arm64.tar.gz"
      sha256 "aa3d700ca78298d8f50036e19bd21def92da8218cd82640a37a55e4194f265a5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.8/learnt-linux-amd64.tar.gz"
      sha256 "59d0978575769876ccfed06577ee7278a5073de9731863e10c80927d5149b3bf"
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
