class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.4.1"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.4.1/learnt-darwin-arm64.tar.gz"
      sha256 "e6da85c5c916ed0d196bdb94bb7d962c7fdf07e821217831049297c32b761bdf"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.4.1/learnt-darwin-amd64.tar.gz"
      sha256 "da160c7be865ec5cdeecaae027db7ffbaa88d214fe63217b882652bd991c8972"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.4.1/learnt-linux-arm64.tar.gz"
      sha256 "f76bdb523a6d83379c729482d0261591b9887d22e9691d230b4b270cd1c745b1"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.4.1/learnt-linux-amd64.tar.gz"
      sha256 "17a032bcb9f4f1a12ffd87614eead9a2a2c5bfbe294cb06fba3b33fe50c7fb19"
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
