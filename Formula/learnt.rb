class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.12"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.12/learnt-darwin-arm64.tar.gz"
      sha256 "189cafbbdf247ff5bd98a81729c68f1cba4fd091f100c2704859630e52d70851"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.12/learnt-darwin-amd64.tar.gz"
      sha256 "0a4fa30692259dd63b77766cc85883175adf165803002e627f4c5acbd1fa0bd5"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.12/learnt-linux-arm64.tar.gz"
      sha256 "421bfd89e05aeae0ca5ed58e6d1d13dbd5fed2633eb4a974fa59acb65939f1c5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.12/learnt-linux-amd64.tar.gz"
      sha256 "e9c762285daa82a4607680b9b1cb85e971407dc710540b828933351ee9757e00"
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
