class Undrift < Formula
  desc "CLI for the Undrift / Tether marketing CRM"
  homepage "https://github.com/Harris-A-Khan/undrift-dashboard"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.0/undrift-darwin-arm64"
      sha256 "2f83fcdafe35de6ab678b83b7a78ca5b773eea3038201b734dcc0297b8c80dcf"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.0/undrift-darwin-amd64"
      sha256 "ed224d99c901fee3c661e4ee80a1e3506eac5cf58775a3b0612ab7faeb2da9ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.0/undrift-linux-arm64"
      sha256 "a3524e7481707d3d1b91d69b0921895810829fbee7dbc3a24c2fe1fba41fd814"
    end
    on_intel do
      url "https://github.com/Undrift/homebrew-tap/releases/download/undrift-v0.2.0/undrift-linux-amd64"
      sha256 "c2d5fa27a7f06a342c36807cdeb20077db990d0f4a27b95cfc8b2c3bfe0518d8"
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
