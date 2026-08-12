class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.1/drift-darwin-arm64"
      sha256 "0c97c2184000757c9c1fded6e846c3d4cc0cc1969e14f72b83165eb389dfeb0b"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.1/drift-darwin-amd64"
      sha256 "3b51bb8ad33c7fe978a5125e2049c6cfd88dc86230022f0f8292d58a486ba611"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.1/drift-linux-arm64"
      sha256 "ba0470ef41d4d65af876ef95e17dfcf221530310427f0307fc2553de2325707c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.2.1/drift-linux-amd64"
      sha256 "9d573332031f8f0da0ed6efb949ba5f3ee8d983b9c3a815a269909dea5e3e25f"
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
