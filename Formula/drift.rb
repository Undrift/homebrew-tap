class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "1.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.5/drift-darwin-arm64"
      sha256 "68380853ab3cb9cc4ee7d19318eda54211e13905dc2e64d40a58b0d6be85e49d"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.5/drift-darwin-amd64"
      sha256 "d69d526e7fb23b104be3aed70d434827218d84b40b12ac4bbdd931ff19a011ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.5/drift-linux-arm64"
      sha256 "a4e375a669058ef869652e452f6856668f6a1ae6b4e3558613df16c77d9e44cb"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v1.7.5/drift-linux-amd64"
      sha256 "8c0d7ea4b03445dc0338825d5adf6be18c215d080a182bfd33631d787291bc83"
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
