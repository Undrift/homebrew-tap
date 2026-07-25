class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.1/drift-darwin-arm64"
      sha256 "79043c660be08637e430f408875cf6ecc6e7cc6f3d85c8aabbc101b539bade79"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.1/drift-darwin-amd64"
      sha256 "3354e70159e934bdbbb0667f5c822308063f00f140909610ecd96c88a054cd85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.1/drift-linux-arm64"
      sha256 "79545ab91c7911b7dbe3a83fa3571f797a4c7bd8ffc9025a122e960d3b488a00"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.1/drift-linux-amd64"
      sha256 "088ac00afb9d0407065c7f145f9e15827db100fccece1d53f91cb7a10a264039"
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
