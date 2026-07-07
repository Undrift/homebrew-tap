class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-darwin-arm64"
      sha256 "d9b9cf66c28fd6be881642208d31b6a9a1fe0d59792d9a5286de8700fc1f7a53"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-darwin-amd64"
      sha256 "0f6b0928ad3e702b5b1dd858948a68f7312854b243b665e112463ebd7cc60ada"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-linux-arm64"
      sha256 "4ad464bf28341d8d0d97abf898a24f966522522e8649fd7af0124fcdb00f8c86"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-linux-amd64"
      sha256 "74aad8a41299b9be530b334c3217f36d16cca10095f29ccd3f0aa841c275a49b"
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
