class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.13.0/drift-darwin-arm64"
      sha256 "e7146fdd1e60b2745531708b5205eaef62271666be9adb8baa369fb30b6111ca"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.13.0/drift-darwin-amd64"
      sha256 "0b086c9743fc0853383ecfe0b687e9a47127a7e65247ef3d51d573302cb72f0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.13.0/drift-linux-arm64"
      sha256 "edc6a11492b4c1579bb6cf70703ec32d7927a0f043309f91423db1969d324c64"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.13.0/drift-linux-amd64"
      sha256 "32c5b8ac379581de7c2bb79374fba08781c8a0171475afd25d99d3cabbfd243e"
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
