class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.2.1"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.1/learnt-darwin-arm64.tar.gz"
      sha256 "1c6866acef81f91cd93d3e62e232e15e9132c7bc5c8c438bb10cc7643bcd9386"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.1/learnt-darwin-amd64.tar.gz"
      sha256 "120ea8e0e59d02029299b7feb9ee80d93c9b84fffb116d637e1f00c078ddd41c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.1/learnt-linux-arm64.tar.gz"
      sha256 "72080e6802b23ac80776e7e0e06baf37ad1b960a1c9a56201d94fdf250bb8a72"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.2.1/learnt-linux-amd64.tar.gz"
      sha256 "05f2d5852019a8ba376705f745007e154dc6c3b7408997fb85534b06573fd4f5"
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
