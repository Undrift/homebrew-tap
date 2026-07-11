class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.1/undrift-darwin-arm64"
      sha256 "bee7fd55230e87d6a4383f318786aa6610bb901dde62be5808c74e5e662ca3bf"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.1/undrift-darwin-amd64"
      sha256 "babcf3c1225625e5821a77ca91dcefbd36a9e30697c023b180110ea500625369"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.1/undrift-linux-arm64"
      sha256 "d80e4c5b47fe274d0b18f0458e4a180fd3cb31514bcf5e960c829b2c60213b86"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.1/undrift-linux-amd64"
      sha256 "6d54e56dcb92bb8e41abd2f22523e68add6167895943f6e43534a937de995b62"
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
