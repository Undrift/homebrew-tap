class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.3/undrift-darwin-arm64"
      sha256 "045a66a0164284a0921355db814c1257c1d505f47548d8043366c0c0e3bf9edf"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.3/undrift-darwin-amd64"
      sha256 "1dcd713bb29bba9411091d0ae3f3ffa32d69373f6dd7528f44b6a7dd4135d76c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.3/undrift-linux-arm64"
      sha256 "7ba90d2533edb54bd1620fa9cf4e6be0e978613f2e9e98bb379e84fee03ea8b2"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.5.3/undrift-linux-amd64"
      sha256 "67320c646c4ba234d292b714095eedaa5791a4dac4cac39a63d92a66f348591c"
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
