class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.7"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.7/learnt-darwin-arm64.tar.gz"
      sha256 "7c9879031e3ed684dfe59f687677ffdd0d8b3612456a9979d74bce4e8d951dc3"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.7/learnt-darwin-amd64.tar.gz"
      sha256 "c0c9079b121a41e7bcdeb167aa0c10db5d7c551abf4d841920d125cc3056709c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.7/learnt-linux-arm64.tar.gz"
      sha256 "ed444a705ffe9919e142265b3dae359be139505783a600be8cbe8918d0a1ef00"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.7/learnt-linux-amd64.tar.gz"
      sha256 "33690f48d68ebf9d0996c7b11c1e4963fc7999ece9e37c270881aadf6194e5e7"
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
