class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.0/undrift-darwin-arm64"
      sha256 "43e4a4d7a2f4b18c948208e6a147d321c6d7b286ed540506718f5af574113a18"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.0/undrift-darwin-amd64"
      sha256 "516e2926da25c20709e8c3bc39105cd608de215b4b5ca54ac3e76f1d9b8ed168"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.0/undrift-linux-arm64"
      sha256 "0f37eb0ad79c3e00ace86fb2ddb0391e240ac8f64319dd0d011e2a8fd3b4efa7"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.0/undrift-linux-amd64"
      sha256 "7446248261540120fe15bd9680baa409526a871fd745fcf9f42e98da894b2894"
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
