class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-darwin-arm64"
      sha256 "fbe2a2a7e8d38d665015e22203e578b4d7166e54d9deb3a217c125fa9208e9d5"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-darwin-amd64"
      sha256 "1e8e5c2d05d1aaaecec43403d488f14abaf4418789c4b76177e4c104eac7158d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-linux-arm64"
      sha256 "364f29d0776d4fd67e3954ebdc1b7b164008a59b36f074dbb812b0a342494e42"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.4.1/undrift-linux-amd64"
      sha256 "53d5c546cee1253890ff567a52957b86093c693361ef384356c8d92175921970"
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
