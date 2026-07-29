class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.1.0/drift-darwin-arm64"
      sha256 "1ae6d9851ec55315f6d5e67db98d6a181397f06f4a600e2a3a18ef69a3624215"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.1.0/drift-darwin-amd64"
      sha256 "a1ab09d9524c58f7530e2a617a4f756f8b2d86d277aad362717e53b9c51fe259"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.1.0/drift-linux-arm64"
      sha256 "af449502768b6cc2455dd2fbe927329cd6ed5d35c1f305dbff01e74b4923186b"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.1.0/drift-linux-amd64"
      sha256 "0eac729fb62656dc63b8d7d03d93b3978b33eeb8faea9c929486fcf9d2fdb6c1"
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
