class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.0/undrift-darwin-arm64"
      sha256 "e7636526abcdfdff5bb790365eb1eaac69f83d0ffafd74571f790acaeb4fe742"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.0/undrift-darwin-amd64"
      sha256 "e804bd2f7df97e5332439e4910f0049d0602e4241f68b92643477c2a0658d513"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.0/undrift-linux-arm64"
      sha256 "01c9d07adc0eca630f25f4c5797c269556a731b1f61d06e2c5a875f41cf0180a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.0/undrift-linux-amd64"
      sha256 "32b01923f731e6b810b231bf719dd8f1921a254606c36904639de951ca6282b9"
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
