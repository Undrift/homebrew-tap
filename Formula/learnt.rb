class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.0"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.0/learnt-darwin-arm64.tar.gz"
      sha256 "73e5c356e0d004f8847d434ebffed6a8eea66f1fadc30415f8b0965157773464"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.0/learnt-darwin-amd64.tar.gz"
      sha256 "02f5095d3fce40ead7121bb119bd99ebe20299e1c8aa31c10b858bc88bfd4c8c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.0/learnt-linux-arm64.tar.gz"
      sha256 "80e4e73fc0b5efcb45a6acc406b32098b5511d5077f46a917a3c0d1241e334d8"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.0/learnt-linux-amd64.tar.gz"
      sha256 "8e461f7a89e15b06cd728a13fa52f79fccdfb34041561ccc596befc0c1372f96"
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
