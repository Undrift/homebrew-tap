class Drift < Formula
  desc "Opinionated CLI for Supabase-backed iOS, macOS, and web projects"
  homepage "https://github.com/Undrift/drift"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.2/drift-darwin-arm64"
      sha256 "56ec924835953719c8157d3476dc8b46ce97e6f9795cf2419910a5ec77eb54df"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.2/drift-darwin-amd64"
      sha256 "1f7814148cf045af5e4e038871ca6fe9c5671a7e067647d97e84f52cc1bd6e61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.2/drift-linux-arm64"
      sha256 "2a29e2150a761a41504c759cfcf7934ec5ec329b675549b11061b9284b7c3f98"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/v2.0.2/drift-linux-amd64"
      sha256 "84bc262612c32d0608e2e89666a305799c0768c9be45ac201c2d9754df6cf3ea"
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
