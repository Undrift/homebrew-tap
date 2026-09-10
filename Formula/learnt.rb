class Learnt < Formula
  desc "A personal classroom in your terminal"
  homepage "https://github.com/Harris-A-Khan/learnt"
  version "0.3.2"
  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.2/learnt-darwin-arm64.tar.gz"
      sha256 "3e31d4a0fbf11e68249a5bd98bc6fcae4254b94e68e3f017de87f1cfbcd69287"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.2/learnt-darwin-amd64.tar.gz"
      sha256 "fdaecef3acaa25f02c082efd492e26a3e1af993ea129f9932d41a7a2872bf91d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.2/learnt-linux-arm64.tar.gz"
      sha256 "439fef8da03b4757dcd97ced77c68232d733e6595c96f597e92cbfb277881740"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/learnt-v0.3.2/learnt-linux-amd64.tar.gz"
      sha256 "e1504196f09d2118442081169b0a767e22a1d96882823920e383e20b290deaf3"
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
