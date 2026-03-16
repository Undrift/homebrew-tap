class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.9/drift-darwin-arm64"
      sha256 "0788ad819fd86ad42cc69c7a2e67c683b0b1eb691c0d8e57bd894a2f8db6ba91"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.9/drift-darwin-amd64"
      sha256 "94f3d19c171dd6095886a9b760478ddc155d84fde7c49989795038b6ad86a563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.9/drift-linux-arm64"
      sha256 "5f4d7d04f8fd573cb25bd49ecc9a4f4a665038bda7f87081027db5eef46544bd"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.9/drift-linux-amd64"
      sha256 "756bdc50abb5644e5c804086d45b6a35d6a1d3a8bc6c6a14b3401b6cfd0df184"
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
