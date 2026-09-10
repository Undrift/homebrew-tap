class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.5.0"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.0/learnt-darwin-arm64.tar.gz"
      sha256 "cf2dd6fb255a1a3c292e767e8f15bd729fc496fe60bd14ad9ed719151f57e806"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.0/learnt-darwin-amd64.tar.gz"
      sha256 "35001e82254cd1bd1f6610c0584285f19a618202cd97577f58de5cb538109d4f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.0/learnt-linux-arm64.tar.gz"
      sha256 "f1956264c1089b235782b2e10c517a50855a31f343d7efd63b45f0c2fa313515"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.0/learnt-linux-amd64.tar.gz"
      sha256 "c3dc68f1b3186410b2d6e111773ad6aaf9d7013eeef4a0c18397fdebe5d66126"
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
