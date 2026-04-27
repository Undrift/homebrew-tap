class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.12.0/drift-darwin-arm64"
      sha256 "e08dda4b68e80179a33cc80e2c934ca5edaaf7e7ad59a10fa001ecbe31bee4c8"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.12.0/drift-darwin-amd64"
      sha256 "9aece218b016890488c4fbc561e1f72839a9ae1607594781dda6c2bd2e12bbcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.12.0/drift-linux-arm64"
      sha256 "4f8ee2052bb199ce4ce93cfd76cd7bc442ae64d00baeb1bcca17b8a63ecc4b3a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.12.0/drift-linux-amd64"
      sha256 "3dd045323cbcae45e1ae928f0a1946f19f0bb376dfdf685dc6978e0770e9b4a4"
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
