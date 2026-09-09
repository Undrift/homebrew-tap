class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.10"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.10/learnt-darwin-arm64.tar.gz"
      sha256 "2bb988841a2da33193b5badbb55666cf8df6ce72492422c7760cf9c1f90948c7"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.10/learnt-darwin-amd64.tar.gz"
      sha256 "98bd1494f42ee6ea8b90102c928b14e582fe7e49b907829a736d56460ce7b7f3"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.10/learnt-linux-arm64.tar.gz"
      sha256 "83248780ca08ffa012541aefb4a176d59425cd4d1a42ea7609daab178f287c08"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.10/learnt-linux-amd64.tar.gz"
      sha256 "647fb4c9547d75b515c4b19b81918bf9fdfaa297957645d14d19b640246ac6fe"
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
