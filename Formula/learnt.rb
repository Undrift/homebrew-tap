class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.3"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.3/learnt-darwin-arm64.tar.gz"
      sha256 "3ee99a7233002a5ac9325f4dc470d3f343df56083b8d5cc7a3a6e8ebb653eaf7"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.3/learnt-darwin-amd64.tar.gz"
      sha256 "64381d36d0ea9f7fd01ac6c3fc0046c46b9ecb3497dd940266ca37399ee1cb67"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.3/learnt-linux-arm64.tar.gz"
      sha256 "66d173f35d8fdca6d158669bae6b52fafdb222565ddd6bba739819c77a50a865"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.3/learnt-linux-amd64.tar.gz"
      sha256 "f0a924a2acb2a54c02a95b4181eb1eb3fd233cd2668cda0601f33afb8810b88e"
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
