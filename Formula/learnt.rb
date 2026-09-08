class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.1.2"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.1.2/learnt-darwin-arm64.tar.gz"
      sha256 "39afd06ee6ad23f4a3ccf185effb5cdf745053abec9e1dc60aa27f7b65232234"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.1.2/learnt-darwin-amd64.tar.gz"
      sha256 "5ef4924e8247536501668509d3cf10c090465b4324875fff9f91c1b2707f4fb0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.1.2/learnt-linux-arm64.tar.gz"
      sha256 "74d5796f4defbc1bf8be0467613d217d58d8c9a98dc50dfd95b63d54b8d7e31f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.1.2/learnt-linux-amd64.tar.gz"
      sha256 "5f305480d68e77a3455fbac310567a134ed24295cba3a77ff5c1ac8df9778a61"
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
