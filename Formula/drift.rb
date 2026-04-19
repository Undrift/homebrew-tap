class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.9.0/drift-darwin-arm64"
      sha256 "fdb72a8dada2d00706d597dd1f7db838476934c8ae5510a379aa444425d90b3f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.9.0/drift-darwin-amd64"
      sha256 "7f64f110cc6a8bcdac09d574c399def5a87cf6e132ceafb0d5c945ac75f6d015"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.9.0/drift-linux-arm64"
      sha256 "ec3f886679ab8a210a8cfd3443d5dab60502e5422e6faf655933ca7baf394dae"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.9.0/drift-linux-amd64"
      sha256 "e4b1cf264be9e3ef379c227555fd4eb38e3e8ca06f1bbf85d6d888cc9d59a7e2"
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
