class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.2/drift-darwin-arm64"
      sha256 "0e77d59ab9dbe5c17c89b500b616f090a3cef6d6e1c1c3be7bcc40c018e64afe"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.2/drift-darwin-amd64"
      sha256 "dddb466288da3e5506af86b26a643ad6d50f88c35074989ce4449d8e36d38a0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.2/drift-linux-arm64"
      sha256 "7e36d69d9e0705aa14aa198b91cfcc498fd60389152023c810977a360b53147e"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.2/drift-linux-amd64"
      sha256 "eb44e326a41f770f4f252f6c9d268f1b90fda8849ed021bd0007fe53f8408091"
    end
  end

  def install
    binary_name = "drift-darwin-arm64"
    if OS.mac? && Hardware::CPU.intel?
      binary_name = "drift-darwin-amd64"
    elsif OS.linux? && Hardware::CPU.arm?
      binary_name = "drift-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      binary_name = "drift-linux-amd64"
    end

    bin.install binary_name => "drift"
  end

  test do
    system "#{bin}/drift", "--version"
  end
end
