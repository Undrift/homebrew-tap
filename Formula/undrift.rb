class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.2/undrift-darwin-arm64"
      sha256 "49563d8413925d28e28dc19cb515b61e435bfb4226ca21683a976f4db796632e"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.2/undrift-darwin-amd64"
      sha256 "837b2d6ae4d5e1b1cc68d208a7cd767f17549cac771395d158fda0cc2129c831"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.2/undrift-linux-arm64"
      sha256 "3d5b0a5c7215572894f1bf6c69beb0e31b5e7c3d134000dc6bf79337aeaf16b3"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.2/undrift-linux-amd64"
      sha256 "e8370ca70d192251fc64f4067a85cb7b016cb3e45c8d5df899592806ccf2121c"
    end
  end

  def install
    binary_name = "undrift-darwin-arm64"
    if OS.mac? && Hardware::CPU.intel?
      binary_name = "undrift-darwin-amd64"
    elsif OS.linux? && Hardware::CPU.arm?
      binary_name = "undrift-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      binary_name = "undrift-linux-amd64"
    end

    bin.install binary_name => "undrift"
  end

  test do
    system "#{bin}/undrift", "--version"
  end
end
