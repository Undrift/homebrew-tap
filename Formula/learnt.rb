class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.6"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.6/learnt-darwin-arm64.tar.gz"
      sha256 "092d190e9b2dcd8db6e48a06191a5a6d149d93d605fd7ac6f9e457d984eecb6c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.6/learnt-darwin-amd64.tar.gz"
      sha256 "865e7508af12e8f8ed55b8eb27764e67897b76e0f78d8defc70475b1ed605d9f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.6/learnt-linux-arm64.tar.gz"
      sha256 "f4320c82cbad44b1f4a38bc551906ce791c09c2bf2ab671527e7f6d6a01fb4d7"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.6/learnt-linux-amd64.tar.gz"
      sha256 "e0dc5a09cb54a76fb16d8ed3d3ba328d3fcf74c17c63f1544758a4ae27bc5b76"
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
