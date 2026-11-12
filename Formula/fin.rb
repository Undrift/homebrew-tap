class Fin < Formula
  desc "Ledgerly finance CLI for ledger management, statements, and audits"
  homepage "https://github.com/Undrift/homebrew-tap"
  url "https://github.com/Undrift/homebrew-tap/releases/download/fin-v0.1.0/fin-0.1.0.tar.gz"
  sha256 "3350c2eb326c890d254f419983faf714c8fff9ec0ee8304140f9a23a43bfcca8"

  depends_on "node"

  def install
    libexec.install "fin", "cli", "README.md"
    bin.install_symlink libexec/"fin"
  end

  def caveats
    <<~EOS
      Set FIN_ENV_FILE to your Ledgerly credentials file, or place it at
      ~/.config/fin/env (NEXT_PUBLIC_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY).
      Keep it private: chmod 600 ~/.config/fin/env
      Then run: fin login --app-url https://YOUR_LEDGERLY_APP
      Backups default to the current directory's backups/ folder.
    EOS
  end

  test do
    assert_match "fin 0.1.0", shell_output("#{bin}/fin --version")
    assert_match "Usage: fin", shell_output("#{bin}/fin --help")
    (testpath/"empty-backup").mkpath
    assert_match "no manifest.json", shell_output("#{bin}/fin backup verify #{testpath}/empty-backup 2>&1", 1)
  end
end
