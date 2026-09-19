class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.7.0/undrift-darwin-arm64"
      sha256 "64b19b573ed4be414b6fb7ecb430235348b6bf88ac9d30811a2f390f7229b033"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.7.0/undrift-darwin-amd64"
      sha256 "49c6e75565fde8c748e43225e1ac4340ed3dcbe1993ab8b3c4aa198288306851"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.7.0/undrift-linux-arm64"
      sha256 "442cda1fe22b8b69a78cf8c7cb0d37ce98a13757a14da86d13b5ff0c6e1fcfd3"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.7.0/undrift-linux-amd64"
      sha256 "c3444adc9546d36ed4bb55f11eb01ee58c8a1e940e26b9eab189647322c719aa"
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
