class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.1/drift-darwin-arm64"
      sha256 "ecb2792966f479cde66b418a69d9957314d539e167d07a911c3df3cd78e4dc7d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.1/drift-darwin-amd64"
      sha256 "fa05f89e3e302ca8d140a1d78a7cae2da41462e3175c47ef1f2bfd16add9e3f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.1/drift-linux-arm64"
      sha256 "6c67b4a36aa66163c86eaab17dea2a5a487ebaaf01d35ae9c8547b9a0d39d24f"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.15.1/drift-linux-amd64"
      sha256 "39d2eb0398a84c36126dc9ea97faa8026456c8e55359b43ef5a3204ac9de554f"
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
