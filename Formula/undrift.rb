class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.1/undrift-darwin-arm64"
      sha256 "720e8f6b9b92fca0e8994df627215a15e5b4f8efabdf3ca03ee3148c0d32e310"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.1/undrift-darwin-amd64"
      sha256 "602185cf4f535655cce2a9e743ff02d0610a7f866d048a23c02317b377449418"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.1/undrift-linux-arm64"
      sha256 "5dee0ae1a7838c50a668fbe1c5faed515ef99e500571059e9b8f20dab7a9bc9a"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.1/undrift-linux-amd64"
      sha256 "123d24396a1e3930738bc4d3d031132f523572fbcf698d1526d0cca0c6ea53fc"
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
