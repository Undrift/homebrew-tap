class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.6.0/undrift-darwin-arm64"
      sha256 "df1efe324fa836df503831e76d53591882fc34b2ab2b31b63f651b6e717fb284"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.6.0/undrift-darwin-amd64"
      sha256 "03bf9357005dc3a690ff727ae80d5864df13a0ad030c897e9ca65104c30fc40c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.6.0/undrift-linux-arm64"
      sha256 "5de8ddb5d430208b1458895369804241ab6dd9268d17c9cdc5e0ae9f6578e69a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.6.0/undrift-linux-amd64"
      sha256 "f847248b8caf047e5299f4387259e0ffd6c92edb3752922e081fd83c44546884"
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
