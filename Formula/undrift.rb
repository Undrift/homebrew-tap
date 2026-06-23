class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.3.0/undrift-darwin-arm64"
      sha256 "b72c36ddf0fb8ecb6706dafe7783384bafa1e1a40c176f78e67cb2ca2b0ed1a0"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.3.0/undrift-darwin-amd64"
      sha256 "e8c531bab52f1c1b8ffbf898dab6de19e342bf986622f0452de61542f6c50782"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.3.0/undrift-linux-arm64"
      sha256 "13f223f1c0387544c20623e12b50e76eb45f9b3e3cd96bcee912f6bbe1f52b34"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.3.0/undrift-linux-amd64"
      sha256 "e643ae1bfd274cd2c31988774e9ecd4cb6c13d7d6c2c05b5db5dbef6e9a3a406"
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
