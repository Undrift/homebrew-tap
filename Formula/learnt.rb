class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.5.4"
  on_macos do
    on_arm do
      version "0.5.8"
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.8/learnt-darwin-arm64.tar.gz"
      sha256 "257b9fd1fc72839b2a1a0b9264984c88829213da9cf6f3f01159288f252779de"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.4/learnt-darwin-amd64.tar.gz"
      sha256 "0362f228206f56e3011e9b9cf49f63eab4568621d9ccecbbed508545ab2ce99c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.4/learnt-linux-arm64.tar.gz"
      sha256 "b73ede5bb3f8339e1d1d826251fd1059c1534a9b2036008e0232c2987bf94955"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.4/learnt-linux-amd64.tar.gz"
      sha256 "44ebb9a347f6283de83d4b32114bb3a88ab5ccc7051c23857722e11af02e9fdb"
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
