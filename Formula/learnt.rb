class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.5.3"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.3/learnt-darwin-arm64.tar.gz"
      sha256 "1d95285977cfd9d48fb9a718278a8d4f5d00a15089c7beb0963b94e5fe2aeb8a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.3/learnt-darwin-amd64.tar.gz"
      sha256 "5a0aca00e1576295c36d825a32bfe7dba1cbb9f2fe48636de9491055699e853b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.3/learnt-linux-arm64.tar.gz"
      sha256 "ca55747e78ea7c5c610b727f21b52a6615ec970c8b5af0e38c1cd689dda5216d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.3/learnt-linux-amd64.tar.gz"
      sha256 "ba00974afc7e71dfd4d7d3fb7101140fcfc215cb2225d9dd5bc4a76f0d941dba"
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
