class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.0/drift-darwin-arm64"
      sha256 "644d68d91d36ecf1f5ba7e568218d9cc0d0a9b282d12cd7d2e73875f841d5605"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.0/drift-darwin-amd64"
      sha256 "d966aead8ff667f6de92d3715d7e27227253798aec0a82f63ad797153d15e9d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.0/drift-linux-arm64"
      sha256 "7d62f9f3c0085051fd2cf2459f864efcb592dc5a18bdad7775bf0bf9364b0f21"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.0/drift-linux-amd64"
      sha256 "3c64b2bc0d7dcb739d97f31c049a6d35c84e4f6b6b1c465b29131ef5af26378d"
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
