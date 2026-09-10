class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, Android, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.3/drift-darwin-arm64"
      sha256 "3e5836c763b6ac2786a65867e5beca1593f9ae8fcad1bf7615f672b241f0c766"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.3/drift-darwin-amd64"
      sha256 "3f52cfa988ccbc71de740b2489ad2bdec14504d2e48ee5c40107332388012d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.3/drift-linux-arm64"
      sha256 "1b879dabde86eb2fe6afa5b73dbd2ecb709717ad245226f0161a3c0b39abf4a4"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.5.3/drift-linux-amd64"
      sha256 "c149126e219b6ae629a9954e3d82359cb525823c42397a3a19bc38e54e80fdff"
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
