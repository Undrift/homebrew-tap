class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.1.0/undrift-darwin-arm64"
      sha256 "01e645265388baaffa2ca2cc00d4db944480454951a66808703131ea8b0fc81c"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.1.0/undrift-darwin-amd64"
      sha256 "7858d9dc33b3a98af5b0db9803b077c9ccc963a78fac1fa3fb3c3e7a7fa6676c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.1.0/undrift-linux-arm64"
      sha256 "945063bcb7b34f150430631d0912ada652f66d48e2e4b063359f78e05f1055f6"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.1.0/undrift-linux-amd64"
      sha256 "ef76d9755622e360ca61fe36c0ed53c481e24bb1140d3a8f85bc7e78d2b34c25"
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
