class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.5.1"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.1/learnt-darwin-arm64.tar.gz"
      sha256 "a81f399786d5ef81573fdd15c85092e0ba43639193536508beba8142f84cb9a0"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.1/learnt-darwin-amd64.tar.gz"
      sha256 "96f8ccadecc366766470a781e67d4ba8cbe5987d093e9abb6ed1ff583c8e3bb9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.1/learnt-linux-arm64.tar.gz"
      sha256 "59c1610ca35b9f3fe4c1b52995c8629f72f8175ece04d8c7310bbaa01602efcf"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.5.1/learnt-linux-amd64.tar.gz"
      sha256 "066d398785291b5f363f3b7530c0318527723e78ba687c7a0fc620cb6053df74"
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
