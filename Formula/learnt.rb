class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.5.4"
  on_macos do
    on_arm do
      version "0.5.5"
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.5/learnt-darwin-arm64.tar.gz"
      sha256 "b1453ec47c2a462e05535682addcf3721acf8cda46dc9313dd6b497ddc02899d"
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
