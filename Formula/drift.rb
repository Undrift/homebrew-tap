class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.0/drift-darwin-arm64"
      sha256 "eab8054c59084b61ec3377c845c130cbe74f047e90684bbc477ec6199c459999"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.0/drift-darwin-amd64"
      sha256 "1eae1eae35b5cfc81423c65282159aed87ab9cbf072f5de3743791814f74ba9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.0/drift-linux-arm64"
      sha256 "600fdefc8f8887d75a21eb21fd3099b6839f193cb89753bb819b3fdc4f990562"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.8.0/drift-linux-amd64"
      sha256 "27a52270cf3d890f09b7cb27b6501110e0b06baa3c4217a359828828b61e96e3"
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
