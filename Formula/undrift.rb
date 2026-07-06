class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-darwin-arm64"
      sha256 "857915b42165e8513e6341113fe8a02f16dca40ad97011af9e437ecf408b29d0"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-darwin-amd64"
      sha256 "461504051371ce255b452dd85f7032bea04dc21dffba020d1825e5859a8006b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-linux-arm64"
      sha256 "8df54077b17feb26223740dc5dfe4061606f91ee096a5e0a46a2edd10ef63f53"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.2/undrift-linux-amd64"
      sha256 "80e1be5106e88a12de030bbb291192a4a3c0d198f973e18b395df5042275c18c"
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
