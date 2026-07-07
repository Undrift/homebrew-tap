class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.3/undrift-darwin-arm64"
      sha256 "5fc167c0b667a96307f34dca73aa4dc08405abc055c5df5884455c85af41adf5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.3/undrift-darwin-amd64"
      sha256 "fd06ec7c7c2654323d513149feb02ef2c5f829af877377330c2dbfcb56711011"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.3/undrift-linux-arm64"
      sha256 "5b598c85883439712315e5eed0db67c09620bd2a260e10f47970a21233abcb51"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.3/undrift-linux-amd64"
      sha256 "67478088161681e836870b2dc523f9abea75c2e3b644bf0589563281d41350bf"
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
