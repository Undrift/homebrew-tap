class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.3.4"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.4/learnt-darwin-arm64.tar.gz"
      sha256 "9d846eb2869bd1e1df51327f49a2c197bf5129b5258bca255d24dcdc968590d6"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.4/learnt-darwin-amd64.tar.gz"
      sha256 "3984dd32ea223918e712ab4e64504de7209c8056b53632ccdcd02e6db87eb9cf"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.4/learnt-linux-arm64.tar.gz"
      sha256 "2fb6234eae92455364b32d4453fa177d06e9cce6c83d2737c451e33744063f4d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.4/learnt-linux-amd64.tar.gz"
      sha256 "0b11a723e137d6894762c2736eeea16ac6d738d7271f99934a1f8d31a61a2fff"
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
