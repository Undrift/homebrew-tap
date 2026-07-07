class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-darwin-arm64"
      sha256 "75d9148acddb5046e957eeff47f53d5302d898564308a9aa10a1d7e80b507029"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-darwin-amd64"
      sha256 "7a308a72bda51c42eceb27a10ec1462a37e35c5f88724e3f08eeff73992a8e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-linux-arm64"
      sha256 "54da1b0988a149190d58cfc4b487194ddcf4650400d268a0935d41a9ffdae9e4"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-linux-amd64"
      sha256 "60bc977cd6ed762daf3334f0c3093186402d29a5092b27f90dfa2c357a80e049"
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
