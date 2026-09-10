class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.16"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.16/learnt-darwin-arm64.tar.gz"
      sha256 "81e5a06aa5d4fb01e89d1f7e59e6ad1338b1362e137d8683ca4eb69fc01e5344"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.16/learnt-darwin-amd64.tar.gz"
      sha256 "35c515ae169eb8cf56624434b0071c4105658feff92718fd9aa043a5f640a77c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.16/learnt-linux-arm64.tar.gz"
      sha256 "ac3f8971a944bfe5b0df8d1ffa3f7fb633e5ef00174fd23aae09a37d6ebeabb2"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.16/learnt-linux-amd64.tar.gz"
      sha256 "3185985fabc1ddbc64301dbcfacdeb6aadafe73f340e1ab7d8d0548555085f90"
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
